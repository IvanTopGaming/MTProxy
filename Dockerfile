FROM debian:bookworm-slim

RUN apt update && apt install -y git curl build-essential libssl-dev zlib1g-dev xxd

WORKDIR /mtproxy

COPY . .

RUN make

WORKDIR /mtproxy/objs/bin

RUN curl -s https://core.telegram.org/getProxySecret -o proxy-secret
RUN curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

CMD ["./entrypoint.sh"]