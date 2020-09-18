#!/bin/bash

IMAGE_NAME="dev-game";
TAG=$1;

docker build --no-cache -t "$IMAGE_NAME:$TAG" .
#docker build -t "$IMAGE_NAME:$TAG" .
docker rm -f dev-game
docker run -p 8081:80 -d --name dev-game "$IMAGE_NAME:$TAG"
