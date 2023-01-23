# build stage
FROM node:lts-alpine as build-stage
WORKDIR /backoffice
COPY package*.json ./
RUN npm install -g @vue/cli-service
RUN npm install @vue/compiler-sfc
RUN  npm install --force --loglevel=error
COPY . .
EXPOSE 3001