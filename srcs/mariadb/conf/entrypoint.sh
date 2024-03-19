#!/bin/bash

 mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql || mariadb-upgrade
 
 # create dir for daemon communication
 if [ ! -f '/run/mysql' ]; then
	 mkdir /run/mysql
	 chown -R mysql:mysql /run/mysql
	 chmod -R 777 /run/mysql
 fi

 #setup data dir
 chown -R mysql:mysql /val/lib/mysql
 chmod -R 777 /var/lib/mysql

 mysqld
 exit 0
