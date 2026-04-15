#!/bin/sh
set -e

if [ "${CADDY_TLS_SNIPPET}" = "traefik_me" ]; then
	mkdir -p /etc/caddy/certs
	wget -qO /etc/caddy/certs/cert.pem https://traefik.me/cert.pem
	wget -qO /etc/caddy/certs/privkey.pem https://traefik.me/privkey.pem
fi

exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
