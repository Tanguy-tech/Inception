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

#update and upgrade system
RUN apt-get -y update && apt-get -y upgrade

#install independents packages needed
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install unzip

#install php and all packages
RUN     apt-get -y install php php-common

#download config && open rights
RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
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

#execute init.sh
CMD	bash init.sh
