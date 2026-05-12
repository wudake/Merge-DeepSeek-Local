"""ads_extractor 诊断: 跑相同的 launch 流程, dump 所有响应 + DOM 状态."""

from __future__ import annotations

import json
import os
import re
import sys

from playwright.sync_api import sync_playwright

from ads_extractor import CHROMIUM_PATH


def main(url: str) -> None:
    all_responses: list[tuple[int, str, str]] = []
    video_urls: list[dict] = []
    graphql_bodies: list[str] = []

    def handle_response(response):
        try:
            u = response.url
            ct = (response.headers.get("content-type") or "").lower()
            all_responses.append((response.status, ct, u))

            if "/api/graphql/" in u:
                try:
                    body = response.body().decode("utf-8", errors="ignore")
                    graphql_bodies.append(body[:8000])
                    # 找 playable_url 之类的字段
                    for m in re.finditer(r'"(playable_url[^"]*)":\s*"(http[^"]+)"', body):
                        video_urls.append({"src": "graphql", "key": m.group(1), "url": m.group(2)})
                except Exception:
                    pass
            if ".mp4" in u and "fbcdn" in u:
                video_urls.append({"src": "cdn", "url": u, "ct": ct})
        except Exception:
            pass

    with sync_playwright() as p:
        browser = p.chromium.launch(
            headless=True,
            executable_path=CHROMIUM_PATH,
            args=[
                "--disable-blink-features=AutomationControlled",
                "--disable-web-security",
                "--no-sandbox",
            ],
        )
        proxy = os.environ.get("PLAYWRIGHT_PROXY", "http://172.17.0.1:7890")
        print(f">>> proxy: {proxy}")
        ctx = browser.new_context(
            viewport={"width": 1920, "height": 1080},
            user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            locale="en-US",
            timezone_id="America/New_York",
            bypass_csp=True,
            proxy={"server": proxy},
        )
        ctx.add_init_script(
            """
            Object.defineProperty(navigator, 'webdriver', {get: () => undefined});
            Object.defineProperty(navigator, 'plugins', {get: () => [1,2,3,4,5]});
            window.chrome = { runtime: {} };
            """
        )
        page = ctx.new_page()
        page.on("response", handle_response)

        try:
            print(f">>> goto {url}")
            page.goto(url, wait_until="domcontentloaded", timeout=45000)
        except Exception as e:
            print(f"!! goto err: {e}")

        page.wait_for_timeout(8000)

        # 看页面有没有进 cookie/登录墙
        title = page.title()
        print(f">>> title: {title}")
        url_now = page.url
        print(f">>> page.url: {url_now}")

        dom = page.evaluate("""() => {
          const out = {videos: [], hrefs: [], buttons: [], inputs: [], html_head: ''};
          document.querySelectorAll('video').forEach(v => out.videos.push({src: v.src, currentSrc: v.currentSrc}));
          document.querySelectorAll('a[href*="login"], a[href*="signup"]').forEach(a => out.hrefs.push(a.href));
          document.querySelectorAll('button,[role="button"]').forEach(b => {
            const t = (b.innerText || '').trim().slice(0, 30);
            if (t) out.buttons.push(t);
          });
          out.html_head = document.body ? document.body.innerText.slice(0, 800) : '(no body)';
          return out;
        }""")
        print("=== DOM SNAPSHOT ===")
        print(json.dumps(dom, indent=2, ensure_ascii=False))

        # 试点播放按钮
        for sel in ('video', '[data-testid="play-button"]', '[aria-label*="Play"]', 'div[role="button"]'):
            try:
                loc = page.locator(sel).first
                if loc.count() > 0:
                    print(f"  click {sel} (count={loc.count()})")
                    loc.click(timeout=3000)
                    page.wait_for_timeout(3000)
                    break
            except Exception as e:
                print(f"  {sel} click err: {e}")

        page.wait_for_timeout(3000)

        try:
            page.screenshot(path="/tmp/ads_debug.png", full_page=False)
            print(">>> screenshot /tmp/ads_debug.png")
        except Exception as e:
            print(f"screenshot err: {e}")

        browser.close()

    print()
    print(f"=== all responses ({len(all_responses)}) ===")
    # 只打 facebook + ads 相关
    interesting = [r for r in all_responses if "facebook.com" in r[2] or "fbcdn" in r[2]]
    for st, ct, u in interesting[:40]:
        print(f"  [{st}] {ct:35s} {u[:120]}")
    print(f"  ... + {len(all_responses) - len(interesting)} other")

    print()
    print(f"=== video candidates ({len(video_urls)}) ===")
    for v in video_urls:
        print(f"  {v}")

    print()
    print(f"=== graphql snippets ({len(graphql_bodies)}) ===")
    for i, b in enumerate(graphql_bodies[:3]):
        print(f"--- gql[{i}] {len(b)} chars ---")
        print(b[:500])
        print()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("usage: python3 _debug_ads.py <url>")
        sys.exit(1)
    main(sys.argv[1])
