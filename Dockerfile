FROM alpine:3.18

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV PASSWORD=
ENV METHOD=aes-256-gcm
ENV TIMEOUT=300
ENV DNS_ADDRS="8.8.8.8,8.8.4.4"
ENV TZ=UTC
ENV ARGS=

COPY . /tmp/repo

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk update ;\
    apk add --no-cache ca-certificates ;\
    apk add --no-cache curl bash tree tzdata busybox-extras;\
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# RUN apk add --no-cache nginx nginx-mod-stream



STOPSIGNAL SIGTERM
WORKDIR /var/www/html/
EXPOSE 80 443 8080
CMD ["tail", "-f", "/dev/null"]

