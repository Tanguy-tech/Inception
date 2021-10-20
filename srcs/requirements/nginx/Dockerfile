# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 10:29:24 by tanguy            #+#    #+#              #
#    Updated: 2021/10/20 13:12:46 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster
LABEL   maintainer="tbillon"

#update
RUN apt-get -y update
#install nginx
RUN apt-get -y install nginx

#install openssl
RUN apt-get install openssl

#generate keys
RUN openssl req -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -out /etc/ssl/tbillon.crt \
    -keyout /etc/ssl/tbillon.key \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42School/OU=tbillon/CN=tbillon"

# Copy confile files
COPY		conf/nginx.conf /etc/nginx/sites-available
#RUN			ln -fs /etc/nginx/http.d/default.conf /etc/nginx/conf.d/default.conf

# Start server
CMD			["nginx", "-g", "daemon off;"]

# Ports
EXPOSE		443