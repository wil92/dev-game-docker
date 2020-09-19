#!/bin/bash

IMAGE_NAME="ggjnez92/dev-game";
TAG=$1;

docker rm -f dev-game
docker run -p 8081:80 -d --name dev-game "$IMAGE_NAME:$TAG"
