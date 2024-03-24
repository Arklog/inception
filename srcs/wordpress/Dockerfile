FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add 	wget \
		unzip \
		bash \
		php-fpm findutils

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	rm latest.zip && \
	mkdir -p /var/www/html && \
	mv wordpress /var/www/html

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN chmod +x /tmp/entrypoint.sh
