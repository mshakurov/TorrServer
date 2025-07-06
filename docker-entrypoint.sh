#!/bin/sh

TS_PORT=8090
TS_WEB_LOG_PATH=/opt/ts/weblog
TS_EN_SSL=1
TS_SSL_PORT=8091

printenv | grep ^TS_

FLAGS="--path $TS_CONF_PATH --logpath $TS_LOG_PATH --weblogpath $TS_WEB_LOG_PATH --port $TS_PORT --torrentsdir $TS_TORR_DIR"
if [[ "$TS_HTTPAUTH" -eq 1 ]]; then FLAGS="${FLAGS} --httpauth"; fi
if [[ "$TS_RDB" -eq 1 ]]; then FLAGS="${FLAGS} --rdb"; fi
if [[ "$TS_DONTKILL" -eq 1 ]]; then FLAGS="${FLAGS} --dontkill"; fi
if [[ "$TS_EN_SSL" -eq 1 ]]; then FLAGS="${FLAGS} --ssl"; fi
if [[ -v "$TS_SSL_PORT" ]]; then FLAGS="${FLAGS} --sslport ${TS_SSL_PORT}"; fi


if [ ! -d $TS_CONF_PATH ]; then
  mkdir -p $TS_CONF_PATH
fi

if [ ! -d $TS_TORR_DIR ]; then
  mkdir -p $TS_TORR_DIR
fi

if [ ! -f $TS_LOG_PATH ]; then
  touch $TS_LOG_PATH
fi

if [ ! -f $TS_WEB_LOG_PATH ]; then
  touch $TS_WEB_LOG_PATH
fi


echo "Running with: ${FLAGS}"
echo $(date +"%Y-%m-%d %T") Running with: ${FLAGS} >>start.log

torrserver $FLAGS
