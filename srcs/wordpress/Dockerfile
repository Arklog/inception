FROM alpine:latest

ENV PHPVERSION ${PHPVERSION:-82}

RUN	apk update && \
	apk upgrade && \
	apk add	wget \
		unzip \
		bash \
		php${PHPVERSION} \
		php${PHPVERSION}-curl \
		php${PHPVERSION}-json \
		php${PHPVERSION}-iconv \
		php${PHPVERSION}-xml \
		php${PHPVERSION}-dom \
		php${PHPVERSION}-phar \
		php${PHPVERSION}-openssl \
		php${PHPVERSION}-mysqli \
		php${PHPVERSION}-mbstring \
		php${PHPVERSION}-gd \
		php${PHPVERSION}-exif \
		php${PHPVERSION}-zip \
		php${PHPVERSION}-fileinfo \
		php${PHPVERSION}-intl \
		php${PHPVERSION}-fpm \
		php${PHPVERSION}-cgi \
		php${PHPVERSION}-redis \
		php${PHPVERSION}-ctype \
		php${PHPVERSION}-tokenizer \
		redis \
		mysql-client \
		sed \
		curl

#install wp-cli
RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		-o /usr/sbin/wp && \
	chmod +x /usr/sbin/wp

#copy config files
COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
COPY	./conf/php-fpm.conf /etc/php${PHPVERSION}/php-fpm.d/www.conf
RUN	sed -ri 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/1' /etc/php${PHPVERSION}/php.ini

RUN	adduser --disabled-password --uid 1000 --gecos "" www www-data

