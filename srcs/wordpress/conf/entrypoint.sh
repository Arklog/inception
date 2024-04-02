#!/bin/bash

cd /var/www/html/wordpress || exit 1

function delete_wp() {
	if [ $# -gt 0 ]; then
		echo "$1" 1>&2
	fi
	rm -rf /var/www/html/wordpress/*
	exit 1
}

if [ ! -f wp-config.php ]; then
	wp core download --allow-root --path=/var/www/html/wordpress --locale=en_US

	(wp config create --allow-root --path=/var/www/html/wordpress \
		--dbname=${MYSQL_DATABASE} \
		--dbuser=${MYSQL_DB_USER} \
		--dbpass=${MYSQL_PASSWORD} \
		--dbhost=mariadb \
		--dbprefix=wp_ \
		&& echo 'wp config created') || delete_wp 'wp config failed'

	(wp core install --url=pducloux.42.fr \
		--title=Pducloux \
		--admin_user=admin \
		--admin_password=admin \
		--admin_email=pducloux@42paris.fr \
		&& echo 'wp core installed') || delete_wp 'wp core install failed'
fi

chown -R www:www-data /var/www

exec "$@"
