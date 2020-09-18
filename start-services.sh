#!/bin/bash

mongod &
nginx -g 'pid /tmp/nginx.pid;daemon off;' &
npm start
