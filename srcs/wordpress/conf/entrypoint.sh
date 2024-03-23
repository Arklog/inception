#!/bin/bash

# check wordpress installed
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	mkdir -p /var/www/html
	cd /var/www/html
	if ! wget https://wordpress.org/latest.zip && unzip latest.zip && rm latest.zip; then
		exit 1
	fi
	mv /tmp/wp-config.php /var/www/html/wordpress/wp-config.php
fi

exec "$@"
