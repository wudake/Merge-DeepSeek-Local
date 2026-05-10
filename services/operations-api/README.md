# Operations API — 运营管理后端

> 这是 [Merge-DeepSeek-Local](https://github.com/wudake/Merge-DeepSeek-Local) 项目的运营管理子模块。完整部署请参考 [根目录 README](../../README.md)。

NestJS 构建的 REST API，为运营管理模块（账号、话题、内容、用户）提供后端服务。

## 技术栈

| 组件 | 技术 |
|---|---|
| 框架 | NestJS + TypeScript |
| ORM | Prisma |
| 数据库 | PostgreSQL 16 |
| 缓存 | Redis |
| 认证 | JWT (共享 JWT_SECRET) |

## 模块结构

```
src/modules/
├── auth/          # JWT 登录认证
├── users/         # 用户 CRUD
├── accounts/      # 社媒账号管理
├── topics/        # 话题库维护
└── contents/      # 内容排期管理
```

## API 端点

所有端点前缀 `/api/v1/`：

| 方法 | 路径 | 说明 | 认证 |
|---|---|---|---|
| POST | `/auth/login` | 用户登录 | 否 |
| GET | `/users` | 用户列表 | JWT |
| POST | `/users` | 创建用户 | JWT (admin) |
| GET/PUT/DELETE | `/users/:id` | 用户操作 | JWT |
| GET | `/accounts` | 账号列表 | JWT |
| POST | `/accounts` | 创建账号 | JWT |
| GET/PUT/DELETE | `/accounts/:id` | 账号操作 | JWT |
| GET | `/topics` | 话题列表 | JWT |
| POST | `/topics` | 创建话题 | JWT |
| GET/PUT/DELETE | `/topics/:id` | 话题操作 | JWT |
| GET | `/contents` | 内容列表 | JWT |
| POST | `/contents` | 创建内容 | JWT |
| GET/PUT/DELETE | `/contents/:id` | 内容操作 | JWT |

## 数据库

使用 Prisma ORM，模型定义在 `prisma/schema.prisma`。部署时通过 `npx prisma migrate deploy` 自动运行迁移。
