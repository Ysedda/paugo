FROM node:18.12.1-alpine3.17 AS base

WORKDIR /app
COPY ./ ./

RUN npm ci

RUN npm run build

FROM alpine:3.17.0 AS production
WORKDIR /app
COPY --from=base /app/dist ./