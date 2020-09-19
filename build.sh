#!/bin/bash

IMAGE_NAME="ggjnez92/dev-game";
TAG=$1;

docker build --no-cache -t "$IMAGE_NAME:$TAG" .
#docker build -t "$IMAGE_NAME:$TAG" .
