# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_db.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:06:20 by tanguy            #+#    #+#              #
#    Updated: 2021/10/28 10:44:08 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service start mysql

echo "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';" | mysql -u root
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');" | mysql -u root -proot
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root -proot
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DB} .* TO '${MYSQL_USR}'@'%' IDENTIFIED BY '${MYSQL_PSWD}';" | mysql -u root -proot
echo "FLUSH PRIVILEGES;" | mysql -u root -proot

exec mysqld -u root -proot --datadir="/var/lib/mysql"