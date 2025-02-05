#!/bin/bash

docker run  --restart unless-stopped -d  --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:8090:8090 -p 0.0.0.0:8091:8091 torrserver
