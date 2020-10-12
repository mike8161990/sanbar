FROM node:alpine AS build

WORKDIR /app

COPY sanbar-app/package.json sanbar-app/package-lock.json ./
RUN npm install

COPY sanbar-app/. .
RUN npm run build --prod

FROM --platform=linux/arm64 nginx:alpine

COPY nginx/default.conf /etc/nginx/conf.d
COPY --from=build /app/dist/sanbar-app /usr/share/nginx/html
