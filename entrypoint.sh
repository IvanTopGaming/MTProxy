#!/bin/sh
set -e

MT_PROXY_SECRET=$(head -c 16 /dev/urandom | xxd -ps)

exec ./mtproto-proxy \
    -u nobody \
    -p 8888 \
    -H 443 \
    -S "$MT_PROXY_SECRET" \
    --aes-pwd proxy-secret proxy-multi.conf \
    -M 1
