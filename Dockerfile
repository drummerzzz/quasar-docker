# develop stage
FROM node:alpine

RUN mkdir /app
WORKDIR /app

COPY package*.json ./app
RUN apk update && apk upgrade && apk add bash && apk add yarn

RUN yarn global add @quasar/cli
COPY . .

EXPOSE 8080
# # build stage
# FROM develop-stage as build-stage
# RUN yarn
# RUN quasar build
# # production stage
# FROM nginx:1.17.5-alpine as production-stage
# COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]