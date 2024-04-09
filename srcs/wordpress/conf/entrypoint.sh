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
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_DB_USER}" \
		--dbpass="${MYSQL_PASSWORD}" \
		--dbhost=mariadb \
		--dbprefix=wp_ \
		&& echo 'wp config created') || delete_wp 'wp config failed'

	(wp core install --url=pducloux.42.fr \
		--title=Pducloux \
		--admin_user="${WP_ADMIN}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--admin_email="${WP_ADMIN_EMAIL}" \
		&& echo 'wp core installed') || delete_wp 'wp core install failed'

	(wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
		--user_pass="${WP_USER_PASSWORD}" \
		--role=author \
		--allow-root \
		&& echo 'wp user created') || echo 'wp user create failed'

	(wp plugin install redis-cache --activate \
		&& echo 'redis-cache installed') || delete_wp 'redis-cache install failed'

	REDIS_HOST="define( 'WP_REDIS_HOST', 'redis');"
	REDIS_PORT="define( 'WP_REDIS_PORT', 6379);"
	#sed -i "/DB_COLLATE/a ${REDIS_HOST}" wp-config.php
	#sed -i "/WP_REDIS_HOST/a ${REDIS_PORT}" wp-config.php
	wp config set WP_REDIS_HOST redis --add --type=constant --allow-root \
		|| delete_wp 'wp config set WP_REDIS_HOST failed'
	wp config set WP_REDIS_PORT 6379 --add --type=constant --allow-root \
		|| delete_wp 'wp config set WP_REDIS_PORT failed'

	wp plugin install wp-mail-smtp --activate
fi

chown -R www:www-data /var/www
chmod -R 777 /var/www/html/wordpress

exec "$@"
