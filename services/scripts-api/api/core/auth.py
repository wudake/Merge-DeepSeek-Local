import jwt
from fastapi import Depends, Header, HTTPException, Request, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from api.core.config import get_settings

settings = get_settings()
security = HTTPBearer(auto_error=False)


def verify_jwt(
    request: Request,
    credentials: HTTPAuthorizationCredentials | None = Depends(security),
    x_api_key: str | None = Header(default=None, alias="X-API-Key"),
    api_key_query: str | None = None,
) -> dict:
    """
    Unified auth: JWT first, API Key fallback.
    Returns decoded JWT payload dict on success.
    """
    # 1. Try JWT Bearer token
    if credentials:
        try:
            payload = jwt.decode(
                credentials.credentials,
                settings.jwt_secret,
                algorithms=["HS256"],
            )
            return payload
        except jwt.ExpiredSignatureError:
            raise HTTPException(status_code=401, detail="Token expired")
        except jwt.InvalidTokenError:
            raise HTTPException(status_code=401, detail="Invalid token")

    # 2. Fallback: X-API-Key header
    key = x_api_key or api_key_query or request.query_params.get("api_key")
    if key and key == settings.api_key:
        return {"auth_type": "api_key"}

    raise HTTPException(status_code=401, detail="Not authenticated")
