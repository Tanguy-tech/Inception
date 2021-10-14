# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:57:03 by tanguy            #+#    #+#              #
#    Updated: 2021/10/14 11:37:05 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update 
RUN apt-get -y update
#install packages needed
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install unzip
#install php
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-common php7.3-json php7.3-readline

ADD			https://fr.wordpress.org/wordpress-5.7.2-fr_FR.tar.gz /wp.tar.gz
RUN			tar -xf /wp.tar.gz && rm -f /wp.tar.gz

# Copy confile files
RUN			mkdir -p /run/php
COPY		conf/start.sh /entrypoint-wordpress.sh
RUN			chmod +x /entrypoint-wordpress.sh
COPY		conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR		/var/www/html

# Start server
ENTRYPOINT	["/conf/start.sh"]

# Ports
EXPOSE		9000