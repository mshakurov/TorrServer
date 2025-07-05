#!/bin/bash

docker run -d --rm  --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:8973:8090 torrserver
# docker run -d --rm --name torrserver -v ~/ts-docker/opt:/opt -p 0.0.0.0:9873:8090 -m=500M  torrserver
docker container ls -a | grep torrserver
if [ $? -eq 0 ];
then
	docker stop torrserver
    docker rm torrserver
fi
docker run -d --restart=always --name torrserver -v ~/ts-docker/opt:/opt -p 0.0.0.0:8973:8090 -m=300M  torrserver
