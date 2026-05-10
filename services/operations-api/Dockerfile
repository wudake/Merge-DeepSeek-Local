FROM node:22-alpine AS builder
WORKDIR /app
ENV HUSKY=0
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm config set registry https://registry.npmmirror.com && pnpm install --frozen-lockfile --ignore-scripts
COPY . .
RUN npx prisma generate
RUN npx nest build

FROM node:22-alpine
RUN apk add --no-cache postgresql16-client
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/package.json ./
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh
EXPOSE 3000
CMD ["/app/entrypoint.sh"]
