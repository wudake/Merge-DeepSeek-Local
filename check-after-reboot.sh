#!/bin/bash
# ============================================================
# 服务器重启后项目恢复验证脚本
# 用法: ./check-after-reboot.sh
# ============================================================

set -e

echo "=========================================="
echo "  Merge-DeepSeek-Local 重启恢复检查"
echo "=========================================="
echo ""

# 1. 检查 Docker 状态
echo "[1/8] 检查 Docker 服务..."
if systemctl is-active --quiet docker; then
    echo "  ✓ Docker 已运行"
else
    echo "  ✗ Docker 未运行，尝试启动..."
    systemctl start docker
    sleep 3
fi

# 2. 检查容器状态
echo ""
echo "[2/8] 检查容器状态..."
REQUIRED_CONTAINERS=("app-postgres" "app-redis" "app-operations-api" "app-scripts-api" "app-scripts-worker" "app-video-auto" "app-nginx")
ALL_OK=true
for container in "${REQUIRED_CONTAINERS[@]}"; do
    if docker ps --format '{{.Names}}' | grep -qx "$container"; then
        STATUS=$(docker inspect -f '{{.State.Status}}' "$container" 2>/dev/null || echo "unknown")
        HEALTH=$(docker inspect -f '{{.State.Health.Status}}' "$container" 2>/dev/null || echo "N/A")
        if [ "$HEALTH" = "N/A" ]; then
            echo "  ✓ $container ($STATUS)"
        else
            echo "  ✓ $container ($STATUS, health: $HEALTH)"
        fi
    else
        echo "  ✗ $container 缺失!"
        ALL_OK=false
    fi
done

if [ "$ALL_OK" = false ]; then
    echo ""
    echo "  ⚠ 检测到容器缺失，尝试启动..."
    cd "$(dirname "$0")"
    docker compose up -d
    sleep 10
fi

# 3. 检查端口监听
echo ""
echo "[3/8] 检查端口监听..."
PORTS=(18088 15432 16379)
for port in "${PORTS[@]}"; do
    if ss -tln | grep -q ":$port "; then
        echo "  ✓ 端口 $port 已监听"
    else
        echo "  ✗ 端口 $port 未监听!"
    fi
done

# 4. 检查数据库连接
echo ""
echo "[4/8] 检查数据库..."
DB_CHECK=$(docker exec app-postgres psql -U app -d operations -c "SELECT COUNT(*) FROM users;" 2>/dev/null | tail -3 | head -1 | xargs || echo "FAIL")
if [ "$DB_CHECK" = "FAIL" ]; then
    echo "  ✗ 数据库连接失败"
else
    echo "  ✓ 数据库连接正常 (users: $DB_CHECK)"
fi

# 5. 检查 API 健康
echo ""
echo "[5/8] 检查 Operations API..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:18088/api/v1/auth/login -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"wrong"}' 2>/dev/null || echo "000")
if [ "$HTTP_CODE" != "000" ] && [ "$HTTP_CODE" != "502" ] && [ "$HTTP_CODE" != "503" ]; then
    echo "  ✓ Operations API 响应正常 (HTTP $HTTP_CODE)"
else
    echo "  ⚠ Operations API 可能未就绪（再等 10 秒）..."
    sleep 10
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:18088/api/v1/auth/login -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"wrong"}' 2>/dev/null || echo "000")
    if [ "$HTTP_CODE" != "000" ] && [ "$HTTP_CODE" != "502" ] && [ "$HTTP_CODE" != "503" ]; then
        echo "  ✓ Operations API 响应正常 (HTTP $HTTP_CODE)"
    else
        echo "  ✗ Operations API 无响应 (HTTP $HTTP_CODE)"
    fi
fi

# 6. 检查 Scripts API
echo ""
echo "[6/8] 检查 Scripts API..."
if curl -sf http://localhost:18088/api/scripts/health >/dev/null 2>&1; then
    echo "  ✓ Scripts API 健康检查通过"
else
    echo "  ⚠ Scripts API 健康端点未就绪"
fi

# 7. 检查前端
echo ""
echo "[7/8] 检查前端..."
if curl -sf http://localhost:18088/ | grep -qE "社媒运营|运营管理"; then
    echo "  ✓ 前端页面可正常访问"
else
    echo "  ✗ 前端页面异常"
fi

# 8. 检查磁盘空间
echo ""
echo "[8/8] 检查磁盘空间..."
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -lt 90 ]; then
    echo "  ✓ 磁盘使用率 ${DISK_USAGE}%"
else
    echo "  ⚠ 磁盘使用率 ${DISK_USAGE}%，建议清理"
fi

echo ""
echo "=========================================="
echo "  检查完成"
echo "=========================================="

if [ "$ALL_OK" = true ] && [ "$DB_CHECK" != "FAIL" ]; then
    echo ""
    echo "  ✅ 所有服务运行正常，可以访问 http://服务器IP:18088"
else
    echo ""
    echo "  ⚠ 部分服务异常，请查看上方日志"
    echo "  如需手动启动: cd $(dirname "$0") && docker compose up -d"
fi

echo ""
