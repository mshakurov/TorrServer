#!/bin/sh

TS_PORT=8090
TS_EN_SSL=1
TS_SSL_PORT=8091
if [[ ! -n "$TS_CONF_PATH" ]]; then TS_CONF_PATH=/opt/ts/config; fi
if [[ ! -n "$TS_LOG_PATH" ]]; then TS_LOG_PATH=/opt/ts/log; fi
if [[ ! -n "$TS_WEB_LOG_PATH" ]]; then TS_WEB_LOG_PATH=/opt/ts/weblog; fi
if [[ ! -n "$TS_TORR_DIR" ]]; then TS_TORR_DIR=/opt/ts/torrents; fi

printenv | grep ^TS_

echo setting FLAGS. 1
FLAGS="--path $TS_CONF_PATH --logpath $TS_LOG_PATH --weblogpath $TS_WEB_LOG_PATH --port $TS_PORT --torrentsdir $TS_TORR_DIR"
echo setting FLAGS. 2
if [[ "$TS_HTTPAUTH" = 1 ]]; then FLAGS="${FLAGS} --httpauth"; fi
echo setting FLAGS. 3
if [[ "$TS_RDB" = 1 ]]; then FLAGS="${FLAGS} --rdb"; fi
echo setting FLAGS. 4
if [[ "$TS_DONTKILL" = 1 ]]; then FLAGS="${FLAGS} --dontkill"; fi
echo setting FLAGS. 5
if [[ "$TS_EN_SSL" = 1 ]]; then FLAGS="${FLAGS} --ssl"; fi
echo setting FLAGS. 6
if [[ -n "$TS_SSL_PORT" ]]; then FLAGS="${FLAGS} --sslport ${TS_SSL_PORT}"; fi
echo setting FLAGS. 7


if [ ! -d $TS_CONF_PATH ]; then
  mkdir -p $TS_CONF_PATH
fi

echo setting FLAGS. 8

if [ ! -d $TS_TORR_DIR ]; then
  mkdir -p $TS_TORR_DIR
fi

echo setting FLAGS. 9

if [ ! -f $TS_LOG_PATH ]; then
  touch $TS_LOG_PATH
fi

echo setting FLAGS. 10

if [ ! -f $TS_WEB_LOG_PATH ]; then
  touch $TS_WEB_LOG_PATH
fi

echo setting FLAGS. 11

echo "Running with: ${FLAGS}"
echo $(date +"%Y-%m-%d %T") Running with: ${FLAGS} >>start.log

torrserver $FLAGS
