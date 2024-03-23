FROM alpine:latest

# Install dependencies
RUN apk update && apk upgrade
RUN apk add mariadb \
	mariadb-client \
	bash

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
COPY ./conf/database.sql /tmp/database.sql

RUN chmod +x /tmp/entrypoint.sh
