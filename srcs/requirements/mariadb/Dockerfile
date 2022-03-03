# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:50:22 by tanguy            #+#    #+#              #
#    Updated: 2022/03/03 16:48:38 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update
RUN apt-get update -y

#install mariadb
RUN apt-get install -y mariadb-server mariadb-client

RUN sed -i 's/bind-address/bind-address = 0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/myconf.sql /tmp/

ARG MYSQL_ROOT_PWD
ARG WP_DB_NAME
ARG WP_DB_USR
ARG WP_DB_PWD

RUN sed -i 's/MYSQL_ROOT_PWD/'"${MYSQL_ROOT_PWD}"'/i' /tmp/myconf.sql \
    && sed -i 's/WP_DB_NAME/'"${WP_DB_NAME}"'/i' /tmp/myconf.sql \
    && sed -i 's/WP_DB_USR/'"${WP_DB_USR}"'/i' /tmp/myconf.sql \
    && sed -i 's/WP_DB_PWD/'"${WP_DB_PWD}"'/i' /tmp/myconf.sql

RUN /etc/init.d/mysql start && mysql -u root --password="root" -e "source /tmp/myconf.sql"
CMD mysql_safe