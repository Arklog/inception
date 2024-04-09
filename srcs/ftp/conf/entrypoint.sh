#!/bin/bash

mkdir -p /var/log/vsftpd
touch /var/log/vsftpd/vsftpd.log  /var/log/vsftpd/xferlog.log
tail -f /var/log/vsftpd/vsftpd.log /var/log/vsftpd/xferlog.log >>/dev/stdout &
chown -R ftp:ftp /var/www/html/wordpress

exec "$@"
