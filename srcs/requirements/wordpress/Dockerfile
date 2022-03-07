# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:57:03 by tanguy            #+#    #+#              #
#    Updated: 2022/03/07 09:49:44 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update 
RUN apt-get -y update

#install independents packages needed
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install unzip

#install php and all packages
RUN     apt-get -y install php7.4 php7.4-fpm php7.4-mysql \
        php-common php7.4-zlib php7.4-xmlwrtier php7.4-simplexml \
        php7.4-pdo php7.4-common php7.4-json php7.4-readline php7.4-phar php7.4-openssl \
        php7.4-pdo_mysql php7.4-mysqli php7.4-session php7.4-gd php7.4 -iconv \
        php7.4-mcrypt php7.4-gmp php7.4-zip php7.4-curl php7.4-opcache \
        php7.4-ctype php7.4-apcu php7.4-intl php7.4-bmatch php7.4-dom \
        php7.4-mbstring php7.4-xmlreaderß

#download config && open rights
RUN     mysql mysql-client openrc \
        && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/bin/wp

#Copy config files for php
COPY conf/php-fpm.conf /etc/php7.4/php-fpm.conf
COPY conf/www.conf /etc/php7.4/php-fpm.d/www.conf

#Define working directory (Define the working directory of the container)
WORKDIR  /var/www/html/wordpress

#Configure wordpress (700 code = rwx for the owner only)
COPY    tools/init.sh ./
RUN     chmod 700 init.sh

#Open rights on start.sh file
RUN     chmod +x start.sh

#execute init.sh
CMD	bash init.sh