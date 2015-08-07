#!/bin/bash

MY_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')
sed -i "/1 sip:/s/127.0.0.1/$MY_IP/" /etc/kazoo/kamailio/dbtext/dispatcher

service kamailio start

exec /bin/bash "$@"

