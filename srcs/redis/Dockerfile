FROM alpine:latest

RUN	apk update \
	&& apk upgrade \
	&& apk add \
		redis \
		bash

COPY	./conf/redis.conf /etc/redis.conf
COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
