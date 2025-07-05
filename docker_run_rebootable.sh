#!/bin/bash

docker run  --restart unless-stopped -d  --name torrserver -v /root/ts-docker/opt:/opt -p 0.0.0.0:9873:8090 torrserver
