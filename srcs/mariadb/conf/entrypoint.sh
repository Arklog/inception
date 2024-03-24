#!/bin/bash

 mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql || mariadb-upgrade
 
 # create dir for daemon communication
 mkdir -p /run/mysqld && \
	 chown -R mysql:mysql /run/mysqld && \
	 chmod 777 /run/mysqld

 #setup data dir
 chown -R mysql:mysql /var/lib/mysql
 chmod -R 777 /var/lib/mysql

 mysql -u mysql </tmp/database.sql

 exec "$@"
