#!/bin/bash

docker build -t zovma:v1 .
docker run -d --name myNginx -p 80:81 zovma:v1