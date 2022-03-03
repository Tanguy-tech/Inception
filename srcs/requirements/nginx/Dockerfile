# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 10:29:24 by tanguy            #+#    #+#              #
#    Updated: 2022/03/03 16:57:54 by tbillon          ###   ########.fr        #
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

#Ports
EXPOSE		443

#Open access Rights
# RUN     chown -R www-data /var/www/*
# RUN     chmod -R 755 /var/www/*

#Generate keys and self signed SSL Certificates
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -out /etc/nginx/ssl/tbillon.crt \
    -keyout /etc/nginx/ssl/tbillon.key \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42 School/OU=tbillon/CN=tbillon"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#Start server
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]