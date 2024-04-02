FROM alpine:latest

# Install dependencies
RUN 	apk update && \
	apk upgrade && \
	apk add	mariadb \
		mariadb-client \
		bash \
		mysql \
		openrc

# copy config files
COPY 	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
COPY	./conf/my.cnf /etc/my.cnf
COPY	./conf/database.sql /tmp/database.sql

# create mysqld folder
RUN 	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 -R /var/run/mysqld

# create openrc folder and file
RUN	mkdir -p /run/openrc && touch /run/openrc/softlevel
