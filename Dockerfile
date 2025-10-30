FROM node:16-alpine AS builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.29.3-alpine3.22
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
