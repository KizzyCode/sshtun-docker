FROM alpine:latest

RUN apk add --no-cache openssh shadow
RUN adduser --shell=/sbin/nologin --uid=10000 --system --disabled-password --no-create-home sshtun
RUN usermod -p "*" sshtun

COPY ./files/sshd_config /etc/ssh/sshd_config

USER sshtun
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
