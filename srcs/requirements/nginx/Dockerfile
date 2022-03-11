FROM	debian:buster

RUN 	apt-get update -y && apt-get upgrade -y

RUN 	apt-get install -y	\
		nginx				\
		vim					\
		openssl				\
		wget				

RUN 	rm -rf ./etc/nginx/sites-available/default
RUN 	rm -rf ./etc/nginx/sites-enabled/default
COPY 	/conf/nginx.conf ./etc/nginx/sites-available
RUN 	ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


#Create folders for ssl keys 
RUN		mkdir /etc/nginx/ssl
RUN		mkdir /etc/nginx/ssl/certs
RUN		mkdir /etc/nginx/ssl/private

#Generate ssl certificates
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048		\
		-keyout /etc/nginx/ssl/private/tbillon.key 				\
		-out /etc/nginx/ssl/certs/tbillon.crt					\
		-subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=tbillon/CN=tbillon.42.fr"

#Open rights
RUN		chmod -R 755 /etc/nginx/ssl/*

EXPOSE	443

CMD		["nginx","-g", "daemon off;"]