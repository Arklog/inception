FROM alpine:latest

# Install dependencies
RUN apk update && apk upgrade
RUN apk add 	nginx \
		nginx-debug \
		bash \
		openssl

# Copy the configuration file
RUN mkdir -p /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/pducloux.42.fr.crt /etc/nginx/ssl/pducloux.42.fr.crt
COPY ./conf/pducloux.42.fr.key /etc/nginx/ssl/pducloux.42.fr.key

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
