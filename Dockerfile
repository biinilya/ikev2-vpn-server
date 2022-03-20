FROM alpine:3.14

LABEL tags="alpine-3.15" \
      build_ver="18-03-2021"

COPY etc /etc
COPY usr/bin /usr/bin

RUN apk add --no-cache \
    strongswan=5.9.1-r3 \
	uuidgen bash nss-tools \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

EXPOSE 500/udp 4500/udp

ENV HOST \
	HOST_FQDN \
	SERVICE_NAME

ENTRYPOINT ["start-vpn"]

