# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:57:03 by tanguy            #+#    #+#              #
#    Updated: 2021/10/08 12:01:58 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install unzip
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-common php7.3-json php7.3-readline

COPY conf/wp-config.php ./
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/start.sh ./




CMD bash /start.sh

EXPOSE 9000