
FROM debian:buster

#Updating packages
RUN apt-get update

#Install mariadb 
RUN apt-get install -y mariadb-server mariadb-client

#Copy configuration files
COPY /conf/db.sql /etc/mysql/
COPY /tools/setup.sh /

CMD bash setup.sh