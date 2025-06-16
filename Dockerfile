FROM node:22-alpine AS dependencies

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci -f

FROM dependencies AS build

WORKDIR /app

COPY . .

RUN npm run build
RUN npm prune --production -f

FROM node:22-alpine AS stage

WORKDIR /app

COPY --from=build /app/.next ./.next
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/next.config.mjs ./next.config.mjs

CMD ["npm", "run", "start"]