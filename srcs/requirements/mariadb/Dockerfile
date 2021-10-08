# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:50:22 by tanguy            #+#    #+#              #
#    Updated: 2021/10/08 11:53:13 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update
RUN apt-get install -y mariadb-server mariadb-client

COPY conf/start.sh ./
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/

RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod 777 /var/lib/*

CMD bash /start.sh

EXPOSE 3306