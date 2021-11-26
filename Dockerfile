FROM alpine:3.14

LABEL tags="alpine-3.14" \
      build_ver="02-11-2021"

COPY etc /etc
COPY usr/bin /usr/bin

RUN apk add --no-cache \
    strongswan=5.9.1-r2 \
	uuidgen \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

EXPOSE 500/udp 4500/udp

ENV HOST \
	HOST_FQDN \
	SERVICE_NAME

ENTRYPOINT ["start-vpn"]

