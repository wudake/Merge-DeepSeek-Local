# Scripts API — 视频脚本提取后端

> 这是 [Merge-DeepSeek-Local](https://github.com/wudake/Merge-DeepSeek-Local) 项目的脚本提取子模块。完整部署请参考 [根目录 README](../../README.md)。

FastAPI 构建的异步任务 API，将 Facebook / YouTube / Ads Library 视频转写为文字脚本。

## 技术栈

| 组件 | 技术 |
|---|---|
| 框架 | FastAPI + Uvicorn |
| 异步任务 | Celery + Redis |
| 语音识别 | faster-whisper (本地) / OpenAI API |
| 视频下载 | yt-dlp + Playwright |
| 实时推送 | WebSocket |

## 目录结构

```
scripts-api/
├── api/
│   ├── main.py              # FastAPI 入口
│   ├── celery_app.py        # Celery 配置
│   ├── routers/
│   │   ├── health.py        # 健康检查
│   │   ├── tasks.py         # 任务 CRUD API
│   │   └── ws.py            # WebSocket 端点
│   ├── tasks/
│   │   └── worker.py        # Celery 异步任务处理
│   ├── models/
│   │   └── schemas.py       # Pydantic 数据模型
│   └── core/
│       ├── auth.py          # JWT 验证
│       └── config.py        # 配置管理
├── src/                     # 核心处理引擎
│   ├── downloader.py        # 视频下载 (yt-dlp)
│   ├── audio_extractor.py   # 音频提取 (FFmpeg)
│   ├── transcriber.py       # OpenAI 转写
│   ├── local_transcriber.py # 本地 Whisper 转写
│   ├── formatter.py         # 输出格式转换 (TXT/SRT/VTT/JSON)
│   ├── ads_extractor.py     # Ads Library 脚本提取
│   └── utils.py             # 工具函数
└── requirements.txt
```

## API 端点

所有端点前缀 `/api/scripts/`，需要 JWT 认证：

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/tasks` | 任务列表 (支持分页) |
| POST | `/tasks` | 创建转写任务 |
| GET | `/tasks/:id` | 任务详情 (含进度) |
| DELETE | `/tasks/:id` | 删除单个任务 |
| DELETE | `/tasks` | 清空全部任务 |
| GET | `/tasks/:id/result` | 获取转写结果 |
| GET | `/tasks/:id/download` | 下载结果文件 |
| GET | `/tasks/:id/download-video` | 下载处理后的视频 |

### WebSocket

连接 `/ws` 获取实时任务进度推送。

### 创建任务请求体

```json
{
  "url": "https://www.facebook.com/...",
  "language": "en",
  "output_format": "json",
  "use_local": true,
  "model_size": "tiny",
  "device": "cpu"
}
```

## 模型选择

| 模型 | 速度 | 准确度 | 说明 |
|---|---|---|---|
| tiny | 最快 | 低 | 适合快速测试 |
| base | 快 | 一般 | |
| small | 中等 | 较好 | 推荐平衡选择 |
| medium | 慢 | 好 | |
| large-v3 | 最慢 | 最高 | 需要更多资源 |
