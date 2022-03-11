# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/08 12:02:22 by tanguy            #+#    #+#              #
#    Updated: 2021/10/14 11:22:25 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mv /wordpress/* /var/www/html/.

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/votre_nom_de_bdd/'$WORDPRESS_DB_NAME'/' /var/www/html/wp-config.php
sed -i 's/votre_utilisateur_de_bdd/'$WORDPRESS_USR'/' /var/www/html/wp-config.php
sed -i 's/votre_mdp_de_bdd/'$WORDPRESS_PSWD'/' /var/www/html/wp-config.php
sed -i 's/localhost/'$WORDPRESS_DB_HOST'/' /var/www/html/wp-config.php
sed -i 's/wp_/'$WORDPRESS_TABLE_PREFIX'/' /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html

exec php-fpm7.3 -F