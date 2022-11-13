FROM alpine:latest

RUN apk add --no-cache openssh shadow
COPY ./files/sshd_config /etc/ssh/sshd_config
COPY ./files/start.sh /usr/libexec/start.sh

CMD ["/usr/libexec/start.sh"]
