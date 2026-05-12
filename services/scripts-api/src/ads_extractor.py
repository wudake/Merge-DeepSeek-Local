import glob
import json
import os
import re
from pathlib import Path
from urllib.parse import parse_qs, urlparse

try:
    from playwright.sync_api import sync_playwright
except ImportError:  # pragma: no cover
    sync_playwright = None

# Resolve Chromium path respecting PLAYWRIGHT_BROWSERS_PATH
_browsers_root = os.environ.get("PLAYWRIGHT_BROWSERS_PATH", os.path.expanduser("~/.cache/ms-playwright"))
_chrome_candidates = glob.glob(os.path.join(_browsers_root, "chromium-*", "chrome-linux64", "chrome"))
CHROMIUM_PATH = _chrome_candidates[0] if _chrome_candidates else None


class FacebookAdsExtractor:
    """从 Facebook Ads Library 页面提取视频直链."""

    def __init__(self, headless: bool = True, timeout_ms: int = 30000):
        self.headless = headless
        self.timeout_ms = timeout_ms
        self._playwright = None

    def extract(self, ad_url: str) -> str:
        """提取 Ads Library 广告页中的最佳视频 URL.

        返回可直接下载的 MP4 直链或 watch 页链接.
        """
        if sync_playwright is None:
            raise RuntimeError(
                "提取 Facebook Ads Library 视频需要 playwright. "
                "请安装: pip install playwright && playwright install chromium"
            )

        video_urls: list[dict] = []
        watch_ids: set[str] = set()
        _dbg = os.environ.get("ADS_EXTRACTOR_DEBUG") == "1"
        _seen_count = [0]

        def handle_response(response):
            try:
                url = response.url
                _seen_count[0] += 1
                if _dbg and ("facebook.com" in url or "fbcdn" in url):
                    import sys as _sys
                    print(f"[ads_dbg] resp #{_seen_count[0]} {response.status} {url[:160]}", file=_sys.stderr, flush=True)

                # fbcdn CDN 直链 (放最前面, 避免 graphql body 解析抛错时漏掉)
                if ".mp4" in url and "fbcdn" in url:
                    video_urls.append({
                        "url": url,
                        "quality": _guess_quality(url),
                        "source": "cdn",
                    })
                    if _dbg:
                        import sys as _sys
                        print(f"[ads_dbg] >>> matched .mp4+fbcdn ({len(video_urls)})", file=_sys.stderr, flush=True)

                # GraphQL API: 包含 playable_url
                if "/api/graphql/" in url:
                    try:
                        body = response.body().decode("utf-8", errors="ignore")
                        for line in body.strip().split("\n"):
                            if not line:
                                continue
                            data = json.loads(line)
                            _collect_urls(data, video_urls)
                    except Exception as e:
                        if _dbg:
                            import sys as _sys
                            print(f"[ads_dbg] graphql parse err: {e}", file=_sys.stderr, flush=True)

                # video/unified_cvc API: 提取 vi (video ID)
                if "facebook.com/video/unified_cvc" in url:
                    try:
                        body = response.body().decode("utf-8", errors="ignore")
                        match = re.search(r'"vi":\s*"?(\d+)"?', body)
                        if match:
                            watch_ids.add(match.group(1))
                    except Exception:
                        pass
            except Exception as e:
                if _dbg:
                    import sys as _sys
                    print(f"[ads_dbg] handler outer err: {e}", file=_sys.stderr, flush=True)

        with sync_playwright() as p:  # type: ignore[misc]
            launch_args: dict = {
                "headless": self.headless,
                "args": [
                    "--disable-blink-features=AutomationControlled",
                    "--disable-web-security",
                    "--disable-features=IsolateOrigins,site-per-process",
                ],
            }
            if CHROMIUM_PATH:
                launch_args["executable_path"] = CHROMIUM_PATH
            browser = p.chromium.launch(**launch_args)
            # 优先尝试 docker0 网关，其次是 compose 网络网关
            proxy_server = os.environ.get("PLAYWRIGHT_PROXY", "http://172.17.0.1:7890")

            context = browser.new_context(
                viewport={"width": 1920, "height": 1080},
                user_agent=(
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                    "AppleWebKit/537.36 (KHTML, like Gecko) "
                    "Chrome/124.0.0.0 Safari/537.36"
                ),
                locale="en-US",
                timezone_id="America/New_York",
                bypass_csp=True,
                proxy={"server": proxy_server},
            )
            # 隐藏自动化特征（每次页面加载都注入）
            context.add_init_script("""
                Object.defineProperty(navigator, 'webdriver', {get: () => undefined});
                Object.defineProperty(navigator, 'plugins', {get: () => [1, 2, 3, 4, 5]});
                window.chrome = { runtime: {} };
            """)

            page = context.new_page()
            page.on("response", handle_response)

            page.goto(ad_url, wait_until="domcontentloaded", timeout=self.timeout_ms)
            # domcontentloaded 后多等几秒让网络请求飞完
            page.wait_for_timeout(5000)

            # 滚动一下触发懒加载 (Ads Library 有时滚动后才把视频塞进 DOM)
            try:
                page.evaluate("window.scrollBy(0, 400); window.scrollBy(0, -200);")
                page.wait_for_timeout(800)
            except Exception:
                pass

            # 尝试触发视频播放: 先按选择器逐个试 click (per-selector try),
            # 失败也不退出循环; 然后直接对所有 <video> 元素调 .play()/.load() 兜底.
            selectors = [
                'video',
                '[data-testid="play-button"]',
                '[aria-label*="Play"]',
                '[aria-label*="播放"]',
                'div[role="button"][tabindex="0"]',
            ]
            for sel in selectors:
                try:
                    loc = page.locator(sel).first
                    if loc.count() == 0:
                        continue
                    loc.click(timeout=1500)
                    page.wait_for_timeout(500)
                except Exception:
                    continue

            # JS 兜底: 所有 <video> 强制 muted + play + load, 触发 CDN 请求
            try:
                page.evaluate(
                    """() => {
                      document.querySelectorAll('video').forEach(v => {
                        try {
                          v.muted = true;
                          v.autoplay = true;
                          v.playsInline = true;
                          if (typeof v.load === 'function') v.load();
                          const p = v.play();
                          if (p && p.catch) p.catch(() => {});
                        } catch (_) {}
                      });
                    }"""
                )
            except Exception:
                pass

            # 等视频 CDN 请求真正飞起来 (实测 Ads Library 在 click + play 后 5~10s 才开始拉视频)
            page.wait_for_timeout(8000)

            # 直接从 DOM 抓 <video src> / currentSrc (最可靠的兜底, 即使 click 都失败也能拿到)
            try:
                dom_videos = page.evaluate(
                    """() => {
                      const out = [];
                      document.querySelectorAll('video').forEach(v => {
                        if (v.currentSrc) out.push(v.currentSrc);
                        if (v.src) out.push(v.src);
                        v.querySelectorAll('source').forEach(s => { if (s.src) out.push(s.src); });
                      });
                      return out;
                    }"""
                )
                for u in dom_videos or []:
                    if isinstance(u, str) and u.startswith("http") and ("fbcdn" in u or ".mp4" in u):
                        video_urls.append({
                            "url": u,
                            "quality": _guess_quality(u),
                            "source": "dom",
                        })
            except Exception:
                pass

            browser.close()

        # 从 watch IDs 构造 watch 页链接（yt_dlp 可能能处理 watch 页）
        for vid in watch_ids:
            video_urls.append({
                "url": f"https://www.facebook.com/watch/?v={vid}",
                "quality": 0,
                "source": "watch",
            })

        if not video_urls:
            raise RuntimeError("未从 Ads Library 页面提取到视频链接")

        return self._pick_best(video_urls)

    @staticmethod
    def _pick_best(urls: list[dict]) -> str:
        """优先选 CDN/DOM 直链 (HD > SD) > graphql > watch 页."""
        # 先去重 (Ads Library 同一视频会同时通过 CDN/DOM 抓到)
        seen: set[str] = set()
        deduped: list[dict] = []
        for item in urls:
            u = item.get("url") or ""
            if not u or u in seen:
                continue
            seen.add(u)
            deduped.append(item)

        def sort_key(item):
            quality = item.get("quality", 0)
            source = item.get("source", "")
            # CDN/DOM 直链优先 (能直接 yt_dlp), graphql 次之 (playable_url 也是 CDN), watch 页最后
            source_score = {"cdn": 3, "dom": 3, "graphql": 2, "watch": 0}.get(source, 1)
            return (source_score, quality)

        deduped.sort(key=sort_key, reverse=True)
        return deduped[0]["url"]

    @staticmethod
    def is_ads_library_url(url: str) -> bool:
        """判断是否为 Facebook Ads Library URL."""
        parsed = urlparse(url)
        return (
            parsed.netloc in ("facebook.com", "www.facebook.com", "m.facebook.com")
            and "/ads/library/" in parsed.path
        )


def _guess_quality(url: str) -> int:
    """从 URL 猜测视频质量."""
    url_lower = url.lower()
    if "1080" in url_lower or "1080p" in url_lower:
        return 1080
    if "720" in url_lower or "720p" in url_lower or "hd" in url_lower:
        return 720
    if "480" in url_lower or "480p" in url_lower:
        return 480
    if "360" in url_lower or "360p" in url_lower:
        return 360
    return 0


def _collect_urls(obj, storage: list):
    """递归从 Facebook GraphQL 响应中提取 playable_url."""
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k in ("playable_url", "playable_url_quality_hd") and isinstance(v, str) and v.startswith("http"):
                storage.append({
                    "url": v,
                    "quality": 720 if "hd" in k else 0,
                    "source": "graphql",
                })
            else:
                _collect_urls(v, storage)
    elif isinstance(obj, list):
        for item in obj:
            _collect_urls(item, storage)
