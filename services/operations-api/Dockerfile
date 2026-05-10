FROM node:22-alpine AS builder
WORKDIR /app
ENV HUSKY=0
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm config set registry https://registry.npmmirror.com && pnpm install --frozen-lockfile --ignore-scripts
COPY . .
RUN npx prisma generate
RUN npx nest build

FROM node:22-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/package.json ./
EXPOSE 3000
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/src/main"]
