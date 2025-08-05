#!/bin/bash

docker container ls -a | grep torrserver
if [ $? -eq 0 ];
then
  docker stop torrserver
  docker rm torrserver
fi

# -- --restart always
# docker run -d --restart always           --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:8973:8090 -m=300M  torrserver

_ENTRYPSH=/root/ts-docker/opt/ts/docker-entrypoint.sh
if [ ! -f $_ENTRYPSH ]; then touch $_ENTRYPSH fi
cp docker-entrypoint.sh $_ENTRYPSH
unset $_ENTRYPSH

# -- --restart unless-stopped
docker run -d --restart unless-stopped   --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:8973:8090 -p 0.0.0.0:8974:8091 torrserver
