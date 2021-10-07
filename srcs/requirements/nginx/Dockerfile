# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 10:29:24 by tanguy            #+#    #+#              #
#    Updated: 2021/10/07 10:36:32 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get install openssl

COPY conf/nginx_conf ./

RUN openssl -req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/tbillon.crt -keyout /etc/ssl/tbillon.key -suj "/C=FR/ST=Lyon/L=Lyon/O=42School/OU=tbillon/CN=tbillon"

RUN cp ./default etc/nginx/sites-available
RUN chown -R www-data /var/www/* 
RUN chmod -R 755 /var/www/*

CMD ["nginx", "-g", "deamon off;"]

EXPOSE 443