FROM node:alpine AS build

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build --prod

FROM arm64v8/nginx:alpine

COPY --from=build /app/dist/sanbar-app /usr/share/nginx/html
