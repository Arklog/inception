FROM alpine:latest

RUN	apk update && \
	apk upgrade && \
	apk add	wget \
		unzip \
		bash \
		php \
		php-curl \
		php-json \
		php-iconv \
		php-xml \
		php-dom \
		php-phar \
		php-openssl \
		php-mysqli \
		php-mbstring \
		php-gd \
		php-exif \
		php-zip \
		php-fileinfo \
		php-intl \
		php-fpm \
		mysql-client \
		sed \
		curl

#install wp-cli
RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		-o /usr/sbin/wp && \
	chmod +x /usr/sbin/wp

#copy config files
COPY	./conf/entrypoint.sh /tmp/entrypoint.sh
COPY	./conf/php-fpm.conf /etc/php82/php-fpm.d/www.conf
RUN	sed -ri 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/1' /etc/php82/php.ini

RUN	adduser --disabled-password --uid 1000 --gecos "" www www-data

RUN	chmod +x /tmp/entrypoint.sh
