FROM node:alpine AS build

WORKDIR /app

COPY home-app/package.json home-app/package-lock.json ./
RUN npm install

COPY home-app/. .
RUN npm run build --prod

FROM --platform=linux/arm64 nginx:alpine

COPY nginx/default.conf /etc/nginx/conf.d
COPY --from=build /app/dist/home-app /usr/share/nginx/html
