# Merge-DeepSeek-Local

三合一内容运营自动化平台，整合 **运营管理**、**视频脚本提取**、**视频自动化剪辑** 三大模块，Docker Compose 一键部署。

---

## 架构概览

```
┌─────────────────────────────────────────────────┐
│                  Nginx (port 80)                 │
│        SPA 前端 + API 反向代理 + WebSocket        │
└──────┬──────────┬──────────┬────────────────────┘
       │          │          │
       ▼          ▼          ▼
┌──────────┐ ┌──────────┐ ┌──────────────┐
│Operations│ │ Scripts  │ │  Video Auto  │
│  API     │ │  API     │ │   (Flask)    │
│ (NestJS) │ │(FastAPI) │ │              │
│ :3000    │ │ :8000    │ │   :5000      │
└────┬─────┘ └────┬─────┘ └──────────────┘
     │            │
     ▼            ▼
┌──────────┐ ┌──────────┐
│PostgreSQL│ │  Redis   │
│   :5432  │ │  :6379   │
└──────────┘ └────┬─────┘
                  │
                  ▼
          ┌──────────────┐
          │Scripts Worker│
          │   (Celery)   │
          └──────────────┘
```

---

## 技术栈

| 层 | 技术 |
|---|---|
| 前端 | React 18 + TypeScript + Ant Design 5 + Vite |
| 运营后端 | NestJS + Prisma ORM + PostgreSQL |
| 脚本后端 | FastAPI + Celery + Redis |
| 视频处理 | Flask + FFmpeg + edge-tts + Playwright |
| 语音识别 | faster-whisper (本地) / OpenAI API |
| 基础设施 | PostgreSQL 16 + Redis 7 + Nginx |
| 部署 | Docker Compose (8 个服务) |

---

## 目录结构

```
Merge-DeepSeek-Local/
├── docker/                        # Nginx 配置
│   └── nginx/
│       ├── nginx.conf
│       └── conf.d/default.conf
├── frontend/                      # React SPA 前端
│   ├── src/
│   │   ├── modules/
│   │   │   ├── auth/              # 登录认证
│   │   │   ├── operations/        # 运营管理模块
│   │   │   ├── scripts/           # 脚本提取模块
│   │   │   └── video-auto/        # 视频自动化 (iframe)
│   │   ├── api/                   # API 客户端
│   │   ├── components/            # 共享组件
│   │   ├── router/                # 路由配置
│   │   └── store/                 # 状态管理
│   └── vite.config.ts
├── infrastructure/
│   └── postgres/init/             # 数据库初始化脚本
├── services/
│   ├── operations-api/            # NestJS 运营管理 API
│   │   ├── prisma/                # 数据库模型 & 迁移
│   │   └── src/modules/
│   │       ├── accounts/          # 账号管理
│   │       ├── auth/              # JWT 认证
│   │       ├── contents/          # 内容管理
│   │       ├── topics/            # 话题管理
│   │       └── users/             # 用户管理
│   ├── scripts-api/               # FastAPI 脚本提取 API
│   │   ├── api/
│   │   │   ├── routers/           # 路由 (health, tasks, ws)
│   │   │   └── tasks/             # Celery 异步任务
│   │   └── src/                   # 核心引擎
│   │       ├── downloader.py      # 视频下载
│   │       ├── audio_extractor.py # 音频提取
│   │       ├── transcriber.py     # OpenAI 转写
│   │       ├── local_transcriber.py # 本地 Whisper
│   │       ├── formatter.py       # 输出格式转换
│   │       └── ads_extractor.py   # Ads Library 提取
│   └── video-auto/                # Flask 视频自动化
│       ├── core/                  # 核心引擎
│       │   ├── editor_advanced.py # FFmpeg 视频编辑器
│       │   ├── tts_generator.py   # TTS 语音生成
│       │   ├── downloader_pw.py   # 小红书下载器
│       │   └── publisher.py       # 多平台发布
│       ├── templates/             # Flask Jinja2 模板
│       └── assets/                # BGM / TTS / Logo 资源
├── docker-compose.yml             # 一键部署配置
└── .env                           # 环境变量
```

---

## 快速开始

### 前置要求

- Docker 20.10+ & Docker Compose 2.0+
- 内存 8GB+ (本地 Whisper 需要)
- 磁盘 20GB+

### 部署

```bash
git clone https://github.com/wudake/Merge-DeepSeek-Local.git
cd Merge-DeepSeek-Local

# 生产环境：修改 .env 中的 JWT_SECRET 和 POSTGRES_PASSWORD
# 可选：设置 OPENAI_API_KEY (使用 OpenAI 转写引擎时需要)

docker compose up -d --build
```

首次部署流程：
1. 拉取/构建所有镜像（video-auto 构建 ~4 分钟）
2. 启动 PostgreSQL + Redis 基础设施
3. operations-api 自动运行 Prisma 迁移
4. entrypoint 检测到空库，自动导入历史数据（账号/话题/内容等）
5. 所有服务就绪

访问 `http://localhost` 进入登录页。

### 默认账号

| 用户名 | 密码 | 角色 |
|--------|------|------|
| `admin` | 导入数据的原始密码 | 超级管理员 |
| `danny` | 导入数据的原始密码 | 操作员 |
| `benny` | 导入数据的原始密码 | 操作员 |

> 如历史数据密码未知（迁移自旧系统），可通过 API 重置。服务首次启动时若不存在 `seed-data.sql`，将自动创建默认账号 `admin/admin123`。

### 停止

```bash
docker compose down          # 停止容器，保留数据卷
docker compose down -v       # 停止并删除所有数据 (不可恢复!)
```

### 重新部署

```bash
# 保留数据卷，仅重建应用
docker compose up -d --build

# 如需完全重置（保留数据库数据但重建表）
docker compose down
docker volume rm app_postgres_data   # 删除数据库数据卷
docker compose up -d --build         # 重建，自动重新导入历史数据
```

---

## 数据管理

### 持久化卷

| 卷名 | 内容 | 大小参考 |
|------|------|----------|
| `postgres_data` | 运营管理数据库 | ~50MB |
| `redis_data` | 任务队列/缓存 | ~10MB |
| `scripts_temp` | 转写任务临时文件 | 变量 |
| `scripts_output` | 转写结果输出 | 变量 |
| `whisper_models` | 本地 Whisper 模型 | ~3GB |
| `videoauto_videos` | 上传/下载的视频 | 变量 |
| `videoauto_output` | 剪辑输出视频 | 变量 |
| `videoauto_assets` | BGM/TTS/Logo 资源 | ~200MB |
| `videoauto_config` | 视频配置 | ~1KB |

### 备份数据库

```bash
# 导出完整数据
docker compose exec -T postgres pg_dump -U app operations > backup_$(date +%Y%m%d).sql

# 仅导出数据（不含 schema，适合迁移）
docker compose exec -T postgres pg_dump -U app --data-only operations > backup_data.sql
```

### 恢复数据库

```bash
# 清空当前数据并恢复
docker compose exec -T postgres psql -U app -d operations -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
docker compose exec -T postgres psql -U app operations < backup_data.sql
docker compose restart operations-api  # 重新运行迁移
```

### 历史数据

服务首次部署时自动导入预置历史数据（位于 `services/operations-api/prisma/seed-data.sql`），包含 66 条话题、21 个账号、33 条内容等。原始备份位于 `infrastructure/postgres/init/02-import-data.sql`。

---

## 故障排除

| 现象 | 原因 | 解决 |
|------|------|------|
| operations-api 不断重启 | 数据库迁移失败（上次残留在 `_prisma_migrations` 表） | entrypoint 自动处理，无需手动干预 |
| nginx 502 Bad Gateway | nginx 容器缓存了旧 DNS，指向不存在的后端 IP | `docker compose exec nginx nginx -s reload` |
| 访问 localhost 无响应 | Docker Desktop 未运行 | 启动 Docker Desktop |
| 首次构建特别慢 | video-auto 镜像包含 PyTorch 依赖 | 正常现象，后续构建会有缓存 |
| 数据库空（没有历史数据） | entrypoint 未找到 seed-data.sql | 检查 `services/operations-api/prisma/seed-data.sql` 是否存在 |

---

## 模块说明

### 1. 运营管理 (Operations)

面向内容运营团队的管理后台，提供账号、话题、内容的增删改查。

| 页面 | 路径 | 功能 |
|---|---|---|
| 仪表盘 | `/operations/dashboard` | 数据概览 |
| 账号管理 | `/operations/accounts` | 社媒账号 CRUD |
| 内容日历 | `/operations/contents` | 内容排期管理 |
| 话题管理 | `/operations/topics` | 话题库维护 |

**API 端点** (前缀 `/api/v1/`)：

| 方法 | 路径 | 说明 |
|---|---|---|
| POST | `/auth/login` | 用户登录 |
| GET/POST | `/users` | 用户列表/创建 |
| GET/PUT/DELETE | `/users/:id` | 用户操作 |
| GET/POST | `/accounts` | 账号列表/创建 |
| GET/PUT/DELETE | `/accounts/:id` | 账号操作 |
| GET/POST | `/topics` | 话题列表/创建 |
| GET/PUT/DELETE | `/topics/:id` | 话题操作 |
| GET/POST | `/contents` | 内容列表/创建 |
| GET/PUT/DELETE | `/contents/:id` | 内容操作 |

### 2. 脚本提取 (Scripts)

将 Facebook / YouTube / Ads Library 视频音频提取并转写为文字脚本，支持双引擎转写。

| 页面 | 路径 | 功能 |
|---|---|---|
| 新建任务 | `/scripts/submit` | 提交视频链接，配置转写参数 |
| 任务列表 | `/scripts/tasks` | 查看任务进度，下载结果 |
| 任务详情 | `/scripts/tasks/:id` | 实时进度 + 文本/分段预览 |
| 已完成脚本 | `/scripts/completed` | 浏览和复制历史脚本 |

**转写引擎**：

| 引擎 | 说明 |
|---|---|
| 本地 Whisper (free) | 通过 faster-whisper 本地运行，支持 tiny/base/small/medium/large-v3 |
| OpenAI API (paid) | 调用 OpenAI Whisper API，需配置 `OPENAI_API_KEY` |

**输出格式**：TXT / SRT / VTT / JSON

**API 端点** (前缀 `/api/scripts/`)：

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/tasks` | 任务列表 |
| POST | `/tasks` | 创建转写任务 |
| GET | `/tasks/:id` | 任务详情 |
| DELETE | `/tasks/:id` | 删除任务 |
| DELETE | `/tasks` | 清空全部任务 |
| GET | `/tasks/:id/result` | 获取转写结果 |
| GET | `/tasks/:id/download` | 下载结果文件 |
| GET | `/tasks/:id/download-video` | 下载处理后的视频 |
| WebSocket | `/ws` | 实时进度推送 |

### 3. 视频自动化 (Video Auto)

面向小红书/抖音的内容创作工具，覆盖下载 → 配音 → 剪辑 → 发布全流程。

| 功能 | 说明 |
|---|---|
| 视频获取 | 小红书链接下载、抖音下载、本地上传 |
| AI 配音 | 22 种英文音色 (edge-tts)，语速 0.5x–2.0x |
| 智能剪辑 | Logo 水印、BGM 混音、镜像翻转、调速、调色、字幕 |
| 多平台发布 | 支持 Instagram、抖音等多平台 |

该模块以 iframe 形式嵌入前端 (`/video-auto`)，保持独立 Flask 部署。

---

## 环境变量

在 `.env` 文件中配置（`docker compose up` 自动加载）：

| 变量 | 默认值 | 说明 |
|---|---|---|
| `JWT_SECRET` | `app-shared-jwt-secret-change-me-in-production` | JWT 签名密钥，**生产环境务必修改** |
| `JWT_EXPIRES_IN` | `24h` | Token 过期时间 |
| `JWT_REFRESH_EXPIRES_IN` | `7d` | 刷新 Token 过期时间 |
| `POSTGRES_USER` | `app` | 数据库用户名 |
| `POSTGRES_PASSWORD` | `app_password` | 数据库密码，**生产环境务必修改** |
| `OPENAI_API_KEY` | (空) | OpenAI API Key (使用 OpenAI 转写引擎时必填) |
| `SCRIPTS_API_KEY` | `dev-api-key-change-me` | 脚本服务内部 API Key |

---

## 开发

### 前端开发

```bash
cd frontend
npm install
npm run dev          # Vite 开发服务器 :5173
```

### 后端开发

各服务源码在 `services/` 目录下，Docker 挂载了源码目录，修改后自动热重载：

- **scripts-api**: `services/scripts-api/src/` 挂载到容器 `/app/src`
- **video-auto**: 需要重新构建镜像 (`docker compose up -d --build video-auto`)

---

## 版本

**v1.0.0** — 2026-05-10

- 三模块统一整合
- Ant Design 统一前端风格
- Docker Compose 一键部署
- JWT 跨服务认证
- 本地 Whisper + OpenAI 双引擎转写
