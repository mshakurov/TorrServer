#!/bin/bash

docker stop torrserver
docker rm torrserver
docker run  --restart unless-stopped -d  --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:8973:8090 torrserver
