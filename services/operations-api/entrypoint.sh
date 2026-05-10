#!/bin/sh
set -e

echo "[entrypoint] Running Prisma migrations..."
MIGRATE_LOG=$(mktemp)

if npx prisma migrate deploy 2>"$MIGRATE_LOG"; then
    echo "[entrypoint] Migrations OK."
else
    cat "$MIGRATE_LOG" >&2
    if grep -q "P3009" "$MIGRATE_LOG"; then
        FAILED=$(grep -o '`2026[^`]*`' "$MIGRATE_LOG" | head -1 | tr -d '`')
        echo "[entrypoint] Failed migration: $FAILED"

        # Check if DB has user data to protect
        USER_COUNT=$(node -e "
            const{PrismaClient}=require('@prisma/client');
            new PrismaClient().user.count().then(c=>{console.log(Number(c));process.exit(0)}).catch(()=>{console.log(-1);process.exit(0)})
        " 2>/dev/null || echo "-1")

        if [ "$USER_COUNT" = "0" ] || [ "$USER_COUNT" = "-1" ]; then
            echo "[entrypoint] Empty DB — resetting schema..."
            psql -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
            npx prisma migrate deploy
            echo "[entrypoint] Migrations re-run OK."
        else
            echo "[entrypoint] Data exists — resolving migration: $FAILED"
            npx prisma migrate resolve --applied "$FAILED" || {
                echo "[entrypoint] FATAL: Migration resolve failed."
                exit 1
            }
            npx prisma migrate deploy
        fi
    else
        echo "[entrypoint] Unknown migration error."
        exit 1
    fi
fi

# Import seed data if DB is empty
echo "[entrypoint] Checking if data import needed..."
USER_COUNT=$(node -e "
    const{PrismaClient}=require('@prisma/client');
    new PrismaClient().user.count().then(c=>{console.log(Number(c));process.exit(0)}).catch(()=>{console.log(-1);process.exit(0)})
" 2>/dev/null || echo "-1")

if [ "$USER_COUNT" = "0" ]; then
    if [ -f /app/prisma/seed-data.sql ]; then
        echo "[entrypoint] Importing historical data..."
        psql -f /app/prisma/seed-data.sql
        echo "[entrypoint] Historical data imported."
    else
        echo "[entrypoint] No seed-data.sql — creating admin user..."
        npx ts-node /app/prisma/seed.ts
        echo "[entrypoint] Admin user created."
    fi
fi

echo "[entrypoint] Starting NestJS..."
exec node dist/src/main
