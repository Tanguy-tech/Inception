# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 10:29:24 by tanguy            #+#    #+#              #
#    Updated: 2021/10/27 13:02:19 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#Update
RUN apt-get -y update

#Install nginx
RUN apt-get -y install nginx

#Install openssl
RUN apt-get install openssl

#Open access Rights
RUN     chown -R www-data /var/www/*
RUN     chmod -R 755 /var/www/*

#Generate keys and self signed SSL Certificates
RUN openssl req -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -out /etc/ssl/tbillon.crt \
    -keyout /etc/ssl/tbillon.key \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42School/OU=tbillon/CN=tbillon"

#Generate website folder
RUN     mkdir /var/www/mywebsite

#Configure Nginx
COPY    conf/nginx.conf /etc/nginx/sites-available/mywebsite
RUN     ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/mywebsite	
RUN     rm -rf /etc/nginx/sites-enabled/default 
RUN     mkdir /var/www/mywebsite/nginx
#COPY    /var/www/html/index.nginx-debian.html /var/www/mywebsite/nginx/index.nginx-debian.html

#Start server
CMD			["nginx", "-g", "daemon off;"]

#Ports
EXPOSE		443