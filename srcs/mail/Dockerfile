FROM alpine:latest

ARG WP_ADMIN
ARG WP_ADMIN_EMAIL
ARG SMTP_FORWARD

ENV WP_ADMIN ${WP_ADMIN}
ENV WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}
ENV SMTP_FORWARD=${SMTP_FORWARD}

RUN	apk update \
	&& apk upgrade \
	&& apk add \
		postfix \
		bash

COPY	./conf/main.cf /etc/postfix/main.cf
COPY	./conf/master.cf /etc/postfix/master.cf
#RUN	echo "${WP_ADMIN_EMAIL} ${SMTP_FORWARD}" > /etc/postfix/virtual
#RUN	postmap /etc/postfix/virtual
RUN	postconf maillog_file=/var/log/postfix.log

COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh

RUN	adduser -D pducloux
#RUN	echo "${WP_ADMIN}: ${WP_ADMIN_EMAIL}" >/etc/aliases
RUN	newaliases
