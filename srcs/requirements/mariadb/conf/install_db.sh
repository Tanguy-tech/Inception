# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_db.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:06:20 by tanguy            #+#    #+#              #
#    Updated: 2021/10/14 11:36:12 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

until mysql
do
	echo "NO_UP"
done

mysql -e "CREATE USER '${MYSQL_USR}'@'localhost' IDENTIFIED BY '${MYSQL_PSWD}';"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USR}'@'%' IDENTIFIED BY '${MYSQL_PSWD}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DB < /base.sql