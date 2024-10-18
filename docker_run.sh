#!/bin/bash

# docker run -d --rm --name torrserver -e TS_CONF_PATH=/root/ts/config -e TS_LOG_PATH=/root/ts/log -e TS_TORR_DIR=/root/ts/torrents -v ~/ts:/opt/ts -p 8090:8090  torrserver
docker run -d --rm  --name torrserver -v ~/ts-docker/opt:/opt -p 0.0.0.0:8090:8090  torrserver
