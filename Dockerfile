FROM oven/bun:latest AS dependencies

WORKDIR /app

COPY package.json bun.lockb ./

RUN bun install

FROM dependencies AS build

WORKDIR /app

COPY . .

RUN bun run build

FROM oven/bun:latest AS stage

WORKDIR /app

COPY --from=build /app/.next .next
COPY --from=build /app/node_modules node_modules
COPY --from=build /app/public public
COPY --from=build /app/package.json .
COPY --from=build /app/next.config.mjs .

CMD ["bun", "start"]