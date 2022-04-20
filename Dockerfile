FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    strongswan \
    iptables \
    uuid-runtime \
    ndppd \
    openssl \
    && rm -rf /var/lib/apt/lists/* # cache busted 20220420.0

RUN rm /etc/ipsec.secrets

ADD ./etc/* /etc/
ADD ./usr/bin/* /usr/bin/

VOLUME /etc

# http://blogs.technet.com/b/rrasblog/archive/2006/06/14/which-ports-to-unblock-for-vpn-traffic-to-pass-through.aspx
EXPOSE 500/udp 4500/udp

ENV HOST \
	HOST_FQDN \
	SERVICE_NAME

ENTRYPOINT ["start-vpn"]
