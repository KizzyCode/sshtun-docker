FROM alpine:latest

RUN apk add --no-cache openssh shadow
COPY ./files/ssh_config /etc/ssh/ssh_config
COPY ./files/start.sh /usr/libexec/start.sh

CMD ["/usr/libexec/start.sh"]
