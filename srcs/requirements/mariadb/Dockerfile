
FROM debian:buster

#Updating packages
RUN apt-get update

#Install mariadb 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server mariadb-client apt-utils

#Copy configuration files
COPY /conf/db.sql /etc/mysql/
COPY /tools/setup.sh /

CMD bash setup.sh
