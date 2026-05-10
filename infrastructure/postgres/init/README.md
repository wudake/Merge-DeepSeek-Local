# PostgreSQL 初始化

此目录映射到 PostgreSQL 容器的 `/docker-entrypoint-initdb.d/`，仅在数据库首次创建时执行。

## 文件说明

| 文件 | 用途 |
|------|------|
| `01-create-databases.sql` | 创建 `operations` 数据库 |
| `02-import-data.sql` | 原始数据导出（备份参考，不自动执行） |

## 历史数据导入

`02-import-data.sql` 是从旧 MySQL 导出的完整数据备份（含 schema + data），用于迁移参考。

**实际自动导入**由 operations-api 容器处理：entrypoint 检测到空数据库后，通过 `services/operations-api/prisma/seed-data.sql` 自动导入历史数据。

如需手动导入备份数据：
```bash
docker compose exec -T postgres psql -U app -d operations < infrastructure/postgres/init/02-import-data.sql
```
