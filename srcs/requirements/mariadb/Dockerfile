# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Tanguy <Tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:50:22 by tanguy            #+#    #+#              #
#    Updated: 2021/11/02 11:07:47 by Tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update
RUN apt-get -y update

#install mariadb
RUN apt-get install -y mariadb-server mariadb-client

#Copy confg files
COPY	conf/install_db.sh ./
#RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/mariadb.cnf /etc/mysql/mariadb.conf.d/

#Open rights
RUN     chown -R mysql:mysql /var/lib/mysql
RUN     chmod 777 /var/lib/*

#Start server
CMD	    ["bash", "install_db.sh"]

#Ports
EXPOSE		3306