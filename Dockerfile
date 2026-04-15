FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/desec \
    --with github.com/mholt/caddy-l4

FROM caddy:2.11.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
