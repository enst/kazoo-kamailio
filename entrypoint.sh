#!/bin/bash

MY_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')
sed -i '/1 sip:/s/127.0.0.1/'$MY_IP'/g'' /etc/kazoo/kamailio/dbtext/dispatcher
sed -i '/MY_IP_ADDRESS/s/127.0.0.1/'$MY_IP'/g' /etc/kazoo/kamailio/local.cfg
sed -i 'MY_HOSTNAME/s/kamailio.2600hz.com/'$HOSTNAME'/g' /etc/kazoo/kamailio/local.cfg

service kamailio start

exec /bin/bash "$@"

