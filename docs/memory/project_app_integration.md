# App 三合一项目整合

> 项目记忆 — 三个 GitHub 项目整合为一个 App，已发布 V1.0.0

## 项目目标

将三个独立项目整合为一个 App，共享 PostgreSQL、Redis、Nginx 基础设施，统一前端入口和 JWT 认证，Docker Compose 一键部署。

## GitHub

- 仓库：https://github.com/wudake/Merge-DeepSeek-Local
- 分支：main
- 版本：v1.0.0
- 265 个文件，Docker Compose 8 个服务

## 整合架构

| 模块 | 后端 | 前端 |
|------|------|------|
| 运营管理 | NestJS :3000 + Prisma + PG | React + Ant Design |
| 视频脚本提取 | FastAPI :8000 + Celery + Redis + Whisper | React + Ant Design |
| 视频自动化 | Flask :5000 + Jinja2 (iframe 嵌入) | React 壳 + Flask 模板 (Ant Design 风格 CSS) |

## 当前进度 — V1.0.0 全部完成 (2026-05-10)

- Phase 1-5: 基础设施 + 后端迁移 ✅
- 数据库导入：从 MySQL dump 成功导入所有 Operations 数据 ✅
- Video-auto 资产：BGM(27)、TTS(35)、Logo(2)、视频配置(2) 全部拷入容器 ✅
- **UI 统一**：轻量方案 ✅
  - Scripts 模块 4 个页面 Tailwind → Ant Design
  - Video-auto 4 个 Flask 模板 CSS → Ant Design 风格
  - TypeScript 类型检查 0 错误，Vite 构建成功
- 文档更新：根目录 + 3 个子模块 README ✅
- 全部推送到 GitHub main 分支 ✅

## 重要问题与解决

- **nginx 容器无法创建 volume 挂载点**：overlayfs 不允许在镜像层只读目录内创建子目录。解决：将 `scripts_output` 卷挂到 `/var/www/scripts-output`，同步更新 nginx alias 路径。
- **nginx 容器启动失败**：Windows Docker overlayfs 驱动限制。`restart` 失败，需要 `down` + `up -d` 重建容器。

## 容器列表 (8 个)

`app-postgres` `app-redis` `app-operations-api` `app-scripts-api` `app-scripts-worker` `app-video-auto` `app-nginx`

## 注意事项

- Video-auto Dockerfile 重构建慢（~280s），涉及 PyTorch/CUDA 依赖
- 生产环境务必修改 `.env` 中的 JWT_SECRET 和 POSTGRES_PASSWORD
- `.gitignore` 已排除 node_modules, dist, __pycache__, whisper_models
