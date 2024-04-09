FROM alpine:latest

ENV PHPVERSION ${PHPVERSION:-82}

RUN	apk update \
	&& apk upgrade \
	&& apk add \
		php${PHPVERSION}-fpm \
		php${PHPVERSION}-mysqli \
		php${PHPVERSION}-mbstring \
		php${PHPVERSION}-session \
		curl \
		bash

#install adminer
RUN	mkdir -p /var/www/html/adminer \
	&& curl https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -Lo /var/www/html/adminer/index.php \
	&& adduser --disabled-password 'www' www-data \
	&& chown -R www:www-data /var/www/html/adminer
COPY	./conf/www.conf /etc/php82/php-fpm.d/www.conf
RUN	sed -ri 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/1' /etc/php82/php.ini

#install entrypoint
COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
