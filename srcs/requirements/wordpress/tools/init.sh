#!/bin/bash

wp core download

wp core config \
    --dbname=$WP_DB_NAME \
    --dbuser=$WP_DB_USR \
    --dbpass=$WP_DB_PWD \
    --dbprefix=wp_ \
    --dbhost=$MYSQL_HOST:3306

wp core install \
    --url=tbillon.42.fr \
    --title=Inception \
    --admin_user=$WP_ADMIN_USR \
    --admin_password=$WP_ADMIN_PWD \
    --admin_email=$WP_ADMIN_MAIL

/usr/sbin/php7.4-fpm