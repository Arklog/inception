FROM alpine:latest

RUN	apk update \
	&& apk upgrade \
	&& apk add \
		lighttpd \
		bash

COPY	./conf/lighttpd.conf	/etc/lighttpd/lighttpd.conf
COPY	./conf/index.html	/var/www/html/static/index.html
COPY	./conf/entrypoint.sh	/usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
