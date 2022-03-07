# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbillon <tbillon@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/06 09:35:58 by tanguy            #+#    #+#              #
#    Updated: 2022/03/07 10:24:27 by tbillon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMP_FILE = srcs/docker-compose.yml
CLEAN = srcs/requirements/tools/clean.sh

start:
		sed -i 's/localhost/tbillon.42.fr/i' /etc/hosts
		mkdir -p /home/tbillon/data/db_data
		mkdir -p /home/tbillon/data/wp_data
		docker-compose --project-directory srcs -f srcs/docker-compose.yml up -d --build

stop:
		docker-compose --project-directory srcs -f srcs/docker-compose.yml down

rm:
		docker volume prune --force
		docker volume rm srcs_db_data srcs_wp_data
		rm -rf /home/tbillon/data

restart:
		make -s stop
		make -s start

restartrm:
		make -s stop
		make -s rm
		make -s start

clear:
		docker-compose --project-directory srcs -f srcs/docker-compose.yml down --remove-orphans
		docker image prune --all --force
		make -s rm

status:
		docker ps -a
		docker images
		docker volume ls
		docker network ls

ngnix:
		docker container exec -ti nginx sh

wp:
		docker container exec -ti wordpress sh

db:
		docker container exec -ti mariadb sh

.PHONY: start stop
