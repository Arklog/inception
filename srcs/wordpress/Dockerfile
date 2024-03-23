FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add 	wget \
		unzip \
		php-fpm

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	rm latest.zip && \
	mkdir -p /var/www/html && \
	mv wordpress /var/www/html

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh
