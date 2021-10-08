# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 11:06:20 by tanguy            #+#    #+#              #
#    Updated: 2021/10/08 12:31:41 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Configure MYSQL
services mysql start
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root 
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root -proot #proot les utilisateur n'ont pas besoin d.'aucuns privileges pour utiliser des dir arbitraires ou autres
echo "GRANT ALL PRIVILEGES ON $MYSQL_DB .* TO $MYSQL_USR'@'%'IDENTIFIED BY '$MYSQL_PSWD';" | mysql -u proot # Donne tous les privilèges d'accès a l'utilisateur root
echo "FLUSH PRIVILEGES;" | mysql -u proot #Facultatif car Mysql remarque les changements quand il y en a et recharge les GRANTS (autorisations)

exec mysqld -u root -proot --datadir="/var/lib/mysql"