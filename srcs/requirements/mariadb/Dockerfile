# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:50:22 by tanguy            #+#    #+#              #
#    Updated: 2021/10/20 10:50:07 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update
RUN apt-get -y update
#install mariadb
RUN apt-get install -y mariadb-server mariadb-client

# Copy confg files
COPY		conf/entrypoint.sh /entrypoint-mariadb.sh
COPY		conf/install_db.sh /install_db.sh
COPY		conf/base.sql /base.sql
RUN			chmod +x /entrypoint-mariadb.sh
RUN			chmod +x /install_db.sh
COPY		conf/mariadb.cnf /etc/mysql/my.cnf

# Start server
ENTRYPOINT	["/conf/entrypoint.sh"]

# Ports
EXPOSE		3306