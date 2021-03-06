FROM node:12-alpine as builder
WORKDIR /usr/app

COPY package.json .
RUN yarn install

COPY . .
ENV REACT_APP_PORT=8080
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html