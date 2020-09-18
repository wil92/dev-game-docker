#!/bin/bash

docker build --no-cache -t dev-game:1.0 .
#docker build -t dev-game:1.0 .
docker rm -f dev-game
docker run -p 8081:80 -d --name dev-game dev-game:1.0
