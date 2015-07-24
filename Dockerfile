FROM bingli/kazoo-base
MAINTAINER Bing Li <bingli1000@gmail.com>

RUN yum install -y kazoo-kamailio

RUN sed -i '/children/s/25/10/' /etc/kazoo/kamailio/default.cfg 

ADD entrypoint.sh /root/

VOLUME ["/var/log]

ENTRYPOINT ["/root/entrypoint.sh"]


