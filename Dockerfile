FROM node:10.22-alpine

MAINTAINER Guillermo "guille@binary-coffee.dev"

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add git
RUN apk add mongodb=3.4.4-r0

ENV NODE_ENV=docker

RUN git clone https://github.com/wil92/dev-game-client.git
RUN git clone https://github.com/wil92/dev-game.git

RUN cd /dev-game-client;npm install
COPY client-config.js /dev-game-client/src/config.js
RUN cd /dev-game-client;npm run build

# nginx configuration
RUN apk add nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN nginx -g 'pid /tmp/nginx.pid;'

# configure  mongodb
RUN mkdir -p /data/db

# install game server
WORKDIR dev-game
RUN cd /dev-game;npm install

# Start services
COPY start-services.sh /start-services.sh
CMD ["/bin/sh", "/start-services.sh"]
