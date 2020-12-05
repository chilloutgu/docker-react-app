#prod
FROM node:10 AS builder
WORKDIR /usr/src/app
COPY ./ ./
RUN npm install --save core-js@3
RUN npm install
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

