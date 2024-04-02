#!/bin/bash

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
	echo "Database not found, creating database"

	#Clearing data dir
	#rm -rf /var/lib/mysql/*

	#Setup MariaDB and start service
	mariadb-install-db 	--user=root \
				--basedir=/usr \
				--datadir=/var/lib/mysql

	rc-status && rc-service mariadb status
	echo "Starting MariaDB" && rc-service mariadb start || exit 1

	#SQL statements
	CREATE_DB="CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
	CREATE_USER="CREATE USER IF NOT EXISTS '${MYSQL_DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	GRANT_PRIVILEGES="GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_DB_USER}'@'%';"
	echo "${CREATE_DB}${CREATE_USER}${GRANT_PRIVILEGES}FLUSH PRIVILEGES;" >/tmp/init.sql
	mysql -u root < /tmp/init.sql

	#Stop service
	rc-service mariadb stop
fi

 exec "$@"
