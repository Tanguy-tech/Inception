#!/bin/sh
mkdir var/www/wordpress
cd /var/www/wordpress
mv /wp-config.php ./
wp core download --allow-root
wp core install --url="https://tbillon.42.fr" --title="ENFIN/ $1" --admin_user=$WORDPRESS_USR --admin_password=$WORDPRESS_PSWD --admin_email=$WORDPRESS_EMAIL --allow-root
wp user create $USER_NAME $USER_EMAIL --user_pass=$USER_PSWD --role=editor --allow-root

chown www-data:www-data /var/www
chmod 744 /var/www

mkdir -p /run/php/
exec php-fpm7.3 -F