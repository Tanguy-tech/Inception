# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/06 09:35:58 by tanguy            #+#    #+#              #
#    Updated: 2021/10/06 09:39:28 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMP_FILE = srcs/docker-compose.yml

all: up

#run and build
up:
		@ docker-compose -f $(COM_FILE) up -d --build

# stop services
stop:
		@ docker-compose -f $(COM_FILE) stop

# stop service and remove containers, networks
down:
		@ docker-compose -f $(COMP_FILE) down