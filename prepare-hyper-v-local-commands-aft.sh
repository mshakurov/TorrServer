chmod +x cp /root/ts/torrserver
cp -f /root/ts/torrserver /usr/sbin/
chmod +x /usr/sbin/torrserver
rc-update del torrserver-alpine
cp /root/ts/torrserver-alpine /etc/init.d/
chmod +x /etc/init.d/torrserver-alpine
rc-update add torrserver-alpine
chmod +x cp /root/ts/prepare-hyper-v-local-start-service.sh

