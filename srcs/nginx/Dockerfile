FROM alpine:latest

# Install dependencies
RUN apk update && apk upgrade
RUN apk add 	nginx \
		bash

# Copy the configuration file
RUN mkdir -p /etc/nginx/
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
