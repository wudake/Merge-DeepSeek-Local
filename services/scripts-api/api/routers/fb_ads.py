"""Facebook Ads Library 视频解析路由."""

from __future__ import annotations

import json

import redis
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel

from api.core.auth import verify_jwt
from api.core.config import get_settings
from src.ads_extractor import FacebookAdsExtractor

settings = get_settings()
router = APIRouter(prefix="/fb-ads", tags=["fb-ads"])
redis_client = redis.from_url(settings.redis_url, decode_responses=True)

CACHE_TTL_SECONDS = 600  # 10 分钟


class ResolveRequest(BaseModel):
    url: str


class ResolveResponse(BaseModel):
    video_url: str | None = None
    kind: str | None = None  # "mp4"


@router.post("/resolve-video", response_model=ResolveResponse)
def resolve_video(payload: ResolveRequest, _auth: dict = Depends(verify_jwt)):
    url = (payload.url or "").strip()
    if not url or not FacebookAdsExtractor.is_ads_library_url(url):
        raise HTTPException(
            status_code=400,
            detail="仅支持 Facebook Ads Library 链接 (facebook.com/ads/library/?id=xxx)",
        )

    cache_key = f"fbads:resolve:{url}"
    cached = redis_client.get(cache_key)
    if cached:
        try:
            return ResolveResponse(**json.loads(cached))
        except Exception:
            redis_client.delete(cache_key)

    try:
        extractor = FacebookAdsExtractor(headless=True)
        video_url = extractor.extract(url)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"解析失败: {e}")

    resp = ResolveResponse(video_url=video_url, kind="mp4")
    if resp.video_url:
        try:
            redis_client.setex(cache_key, CACHE_TTL_SECONDS, json.dumps(resp.model_dump()))
        except Exception:
            pass
    return resp
