#!/bin/bash

chmod 555 /var/www/html/wordpress
IPADDR="$(ifconfig | grep 'eth0' -A 5 | grep 'inet ' | awk '{print $2}')"
echo "pasv_address=$IPADDR" >> /etc/vsftpd.conf

exec "$@"
