"""绿联 NAS 视频解析路由."""

from __future__ import annotations

import json

import redis
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel

from api.core.auth import verify_jwt
from api.core.config import get_settings
from src.ugreen_resolver import (
    NotVideo,
    PasswordRequired,
    ResolveError,
    ResolveTimeout,
    UgreenShareResolver,
    is_ugreen_share,
)

settings = get_settings()
router = APIRouter(prefix="/nas", tags=["nas"])
redis_client = redis.from_url(settings.redis_url, decode_responses=True)

CACHE_TTL_SECONDS = 600  # 10 分钟; 绿联分享签名一般够用


class ResolveRequest(BaseModel):
    url: str


class ResolveResponse(BaseModel):
    video_url: str | None = None
    kind: str | None = None  # "mp4" | "hls"
    mime: str | None = None
    filename: str | None = None
    needs_password: bool = False


@router.post("/resolve-video", response_model=ResolveResponse)
def resolve_video(payload: ResolveRequest, _auth: dict = Depends(verify_jwt)):
    url = (payload.url or "").strip()
    if not url or not is_ugreen_share(url):
        raise HTTPException(
            status_code=400,
            detail="仅支持绿联 NAS 分享链接 (ug.link / *.ug.link 的 share-download)",
        )

    cache_key = f"nas:ugreen:{url}"
    cached = redis_client.get(cache_key)
    if cached:
        try:
            return ResolveResponse(**json.loads(cached))
        except Exception:
            redis_client.delete(cache_key)

    try:
        result = UgreenShareResolver().resolve(url)
    except PasswordRequired:
        return ResolveResponse(needs_password=True)
    except NotVideo as e:
        raise HTTPException(status_code=400, detail=str(e))
    except ResolveTimeout as e:
        raise HTTPException(status_code=504, detail=str(e))
    except ResolveError as e:
        raise HTTPException(status_code=500, detail=f"解析失败: {e}")
    except Exception as e:  # pragma: no cover
        raise HTTPException(status_code=500, detail=f"解析失败: {e}")

    resp = ResolveResponse(**result)
    if resp.video_url:
        try:
            redis_client.setex(cache_key, CACHE_TTL_SECONDS, json.dumps(resp.model_dump()))
        except Exception:
            pass
    return resp
