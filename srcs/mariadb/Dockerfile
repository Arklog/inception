FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get upgrade
RUN apt-get install -y \
	mariadb-server \
	mariadb-client

COPY ./conf/entrypoint.sh /usr/bin/entrypoint.sh
