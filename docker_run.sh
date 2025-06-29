#!/bin/bash

# docker run -d --rm --name torrserver -e TS_CONF_PATH=/root/ts/config -e TS_LOG_PATH=/root/ts/log -e TS_TORR_DIR=/root/ts/torrents -v ~/ts:/opt/ts -p 8090:8090  torrserver
# docker run -d --rm --name torrserver -v ~/ts-docker/opt:/opt -p 0.0.0.0:9873:8090 -m=500M  torrserver
docker container ls -a | grep torrserver
if [ $? -eq 0 ];
then
	docker stop torrserver
    docker rm torrserver
fi

docker run -d --restart=always --name torrserver -v ~/ts-docker/opt:/opt -p 0.0.0.0:9873:8090 -p 0.0.0.0:9874:8091 -m=1024M  torrserver
