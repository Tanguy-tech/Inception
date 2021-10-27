# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:57:03 by tanguy            #+#    #+#              #
#    Updated: 2021/10/27 15:12:21 by tbillon          ###   ########.fr        #
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
RUN     apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-common php7.3-json php7.3-readline

COPY    conf/wp-config.php ./
COPY    conf/www.conf /etc/php/7.3/fpm/pool.d
COPY    conf/start.sh ./

#download config && open rights 
RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp

#Open rights on start.sh file
RUN     chmod +x start.sh

# Start server
CMD	["/start.sh"]

# Ports
EXPOSE		9000