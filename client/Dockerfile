FROM alpine:latest

RUN apk add --no-cache openssh shadow
RUN adduser --shell=/sbin/nologin --uid=10000 --system --disabled-password --no-create-home sshtun

COPY ./files/ssh_config /etc/ssh/ssh_config

USER sshtun
CMD ["/usr/bin/ssh", "sshtun"]
