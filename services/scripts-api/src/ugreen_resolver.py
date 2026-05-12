"""绿联 NAS 分享页视频直链解析器.

策略: 在 headless Chromium 中打开分享页 -> 找到 '下载' 按钮 (主框架或内嵌
iframe 中) -> 用 expect_download() 拦截点击, 获取真实下载 URL -> 取消下载,
返回 URL. 前端 <video> 直接吃这个 URL 即可播放 (绿联 NAS 返回的 MP4 字节
带 Accept-Ranges + Access-Control-Allow-Origin: *, 浏览器会按字节嗅探判定
为视频, 忽略 Content-Disposition: attachment).
"""

from __future__ import annotations

import glob
import os
import re
import time

try:
    from playwright.sync_api import sync_playwright, TimeoutError as PWTimeoutError
except ImportError:  # pragma: no cover
    sync_playwright = None
    PWTimeoutError = Exception


_browsers_root = os.environ.get(
    "PLAYWRIGHT_BROWSERS_PATH", os.path.expanduser("~/.cache/ms-playwright")
)
_chrome_candidates = glob.glob(
    os.path.join(_browsers_root, "chromium-*", "chrome-linux64", "chrome")
)
CHROMIUM_PATH = _chrome_candidates[0] if _chrome_candidates else None


VIDEO_EXT_RE = re.compile(r"\.(mp4|m4v|mov|webm|m3u8)(\?|$)", re.IGNORECASE)
VIDEO_MIME_PREFIXES = ("video/", "application/vnd.apple.mpegurl", "application/x-mpegurl")
# 绿联 NAS 直接下载 API; 命中即可作为视频流 URL
UGREEN_DOWNLOAD_PATH_RE = re.compile(r"/ugreen/v\d+/filemgr/shareDownloadFile\b", re.IGNORECASE)


class ResolveError(RuntimeError):
    """通用解析失败."""


class PasswordRequired(ResolveError):
    """分享需要密码, 无法自动解析."""


class NotVideo(ResolveError):
    """该分享不是视频文件 / 无法识别为可播放视频."""


class ResolveTimeout(ResolveError):
    """Playwright 超时."""


_DOWNLOAD_BUTTON_TEXTS = ("下载", "Download", "下载文件", "Download all")
_PASSWORD_TEXTS = ("请输入密码", "分享密码", "Share password", "提取码", "请输入访问码")
_VIDEO_EXTENSIONS = (".mp4", ".m4v", ".mov", ".webm", ".mkv", ".avi", ".ogv")


class UgreenShareResolver:
    """解析 ug.link / *.ug.link 分享页中的视频直链 URL."""

    def __init__(self, headless: bool = True, timeout_ms: int = 25000):
        self.headless = headless
        self.timeout_ms = timeout_ms

    def resolve(self, share_url: str) -> dict:
        if sync_playwright is None:
            raise ResolveError(
                "Playwright 未安装. 请在容器内执行: pip install playwright && playwright install chromium"
            )

        captured_url: str | None = None
        captured_mime: str | None = None
        captured_filename: str | None = None

        def on_response(resp):
            nonlocal captured_url, captured_mime
            try:
                u = resp.url
                # 命中绿联下载 API
                if UGREEN_DOWNLOAD_PATH_RE.search(u) and 200 <= resp.status < 400 and not captured_url:
                    captured_url = u
                    captured_mime = (resp.headers.get("content-type") or "").lower()
                # 兜底: 任何视频 MIME / 后缀 也算
                ct = (resp.headers.get("content-type") or "").lower()
                is_video_mime = any(ct.startswith(p) for p in VIDEO_MIME_PREFIXES)
                is_video_ext = bool(VIDEO_EXT_RE.search(u))
                if (is_video_mime or is_video_ext) and 200 <= resp.status < 300 and not captured_url:
                    captured_url = u
                    captured_mime = ct
            except Exception:
                pass

        start = time.monotonic()

        with sync_playwright() as p:
            browser = p.chromium.launch(
                headless=self.headless,
                executable_path=CHROMIUM_PATH if CHROMIUM_PATH else None,
                args=[
                    "--disable-blink-features=AutomationControlled",
                    "--no-sandbox",
                    # 国内服务: 绕过容器内 HTTPS_PROXY (mihomo)
                    "--proxy-server=direct://",
                    "--proxy-bypass-list=*",
                ],
            )
            try:
                context = browser.new_context(
                    viewport={"width": 1366, "height": 768},
                    user_agent=(
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                        "AppleWebKit/537.36 (KHTML, like Gecko) "
                        "Chrome/124.0.0.0 Safari/537.36"
                    ),
                    locale="zh-CN",
                    ignore_https_errors=True,
                    bypass_csp=True,
                    accept_downloads=True,
                )
                context.add_init_script(
                    """
                    Object.defineProperty(navigator, 'webdriver', {get: () => undefined});
                    """
                )

                page = context.new_page()
                page.on("response", on_response)

                try:
                    page.goto(share_url, wait_until="domcontentloaded", timeout=self.timeout_ms)
                except PWTimeoutError as e:
                    raise ResolveTimeout(f"打开分享页超时: {e}") from e

                # 等 SPA + 嵌套 iframe 起来
                try:
                    page.wait_for_load_state("networkidle", timeout=10000)
                except PWTimeoutError:
                    pass

                # 密码门检测 (主框架 + 所有 iframe)
                if _any_frame_has_password_gate(page):
                    raise PasswordRequired("该分享需要密码")

                # 等 '下载' 按钮异步渲染出来 (networkidle 后绿联 SPA 还要再异步拉一次 queryShareInfo
                # 才渲染按钮)
                _wait_for_download_button(page, timeout_ms=8000)

                # 在所有 frame 中尝试点 '下载' 按钮; 拦截 download 事件
                btn_locator, owning_frame = _find_download_button(page)
                if btn_locator is None:
                    raise NotVideo(
                        "未找到分享页的下载按钮 (可能此分享不是视频文件或页面结构已变更)"
                    )

                try:
                    with page.expect_download(timeout=8000) as dl_info:
                        btn_locator.click(timeout=4000)
                    download = dl_info.value
                except PWTimeoutError:
                    # 没触发 download (可能是非视频/直接打开), 看是否在 response 中已捕获到
                    download = None

                if download is not None:
                    if not captured_url:
                        captured_url = download.url
                    if not captured_filename:
                        captured_filename = download.suggested_filename
                    # 立刻取消, 不实际下载到文件系统
                    try:
                        download.cancel()
                    except Exception:
                        pass

                # 给响应监听一点时间收尾
                page.wait_for_timeout(800)

                if not captured_url:
                    raise NotVideo("点击下载未捕获到视频流 URL")

                # 仅当文件名 / URL 看起来是视频, 才返回; 否则视为非视频文件
                if not _looks_like_video(captured_url, captured_filename, captured_mime):
                    raise NotVideo(
                        f"该分享疑似非视频文件 (filename={captured_filename}, mime={captured_mime})"
                    )

            finally:
                browser.close()

        # 至此一定有 captured_url
        kind = (
            "hls"
            if (captured_url.lower().endswith(".m3u8") or "mpegurl" in (captured_mime or ""))
            else "mp4"
        )
        return {
            "video_url": captured_url,
            "kind": kind,
            "mime": captured_mime,
            "filename": captured_filename,
            "needs_password": False,
        }


def _any_frame_has_password_gate(page) -> bool:
    for frame in page.frames:
        try:
            if frame.locator('input[type="password"]').count() > 0:
                # 进一步看是否可见
                if frame.locator('input[type="password"]:visible').count() > 0:
                    return True
            txt = (frame.locator("body").inner_text(timeout=1500) or "")[:2000]
            if any(t in txt for t in _PASSWORD_TEXTS) and frame.locator('input[type="password"]').count() > 0:
                return True
        except Exception:
            continue
    return False


def _wait_for_download_button(page, timeout_ms: int = 8000) -> None:
    """轮询直到任一 frame 中出现 '下载'/'Download' 文本; 超时则放弃但不抛错."""
    deadline = time.monotonic() + timeout_ms / 1000
    while time.monotonic() < deadline:
        for frame in page.frames:
            for text in _DOWNLOAD_BUTTON_TEXTS:
                try:
                    if frame.locator(f"text={text}").count() > 0:
                        return
                except Exception:
                    continue
        page.wait_for_timeout(400)


def _find_download_button(page):
    """返回 (locator, frame). 没找到则 (None, None).

    绿联分享页的 '下载' 按钮可能是 button / a / span / div, 因此用宽松的
    text= 匹配 + .first; 主框架优先, 然后遍历每个 iframe.
    """
    frames = list(page.frames)
    # 主框架最优先 (page.frames[0] 即主框架)
    for frame in frames:
        for text in _DOWNLOAD_BUTTON_TEXTS:
            try:
                cand = frame.locator(f"text={text}").first
                if cand.count() == 0:
                    continue
                if _is_visible(cand):
                    return cand, frame
            except Exception:
                continue
    return None, None


def _is_visible(locator) -> bool:
    try:
        return locator.is_visible(timeout=500)
    except Exception:
        return False


def _looks_like_video(url: str, filename: str | None, mime: str | None) -> bool:
    lower_name = (filename or "").lower()
    lower_url = url.lower()
    if any(lower_name.endswith(ext) for ext in _VIDEO_EXTENSIONS):
        return True
    if mime and (mime.startswith("video/") or "mpegurl" in mime):
        return True
    # 绿联下载 API 自带 task_id, URL 本身不含扩展名 -> 依赖 filename / mime
    # 若 filename 没拿到, 但 URL 是 shareDownloadFile 接口, 也接受
    if UGREEN_DOWNLOAD_PATH_RE.search(url):
        return True
    if VIDEO_EXT_RE.search(lower_url):
        return True
    return False


def is_ugreen_share(url: str) -> bool:
    """供路由层快速校验入参."""
    try:
        from urllib.parse import urlparse

        p = urlparse(url)
        host = (p.hostname or "").lower()
        if not (host == "ug.link" or host.endswith(".ug.link")):
            return False
        return "/share-download" in (p.path or "")
    except Exception:
        return False
