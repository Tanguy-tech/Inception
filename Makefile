# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/06 09:35:58 by tanguy            #+#    #+#              #
#    Updated: 2021/10/08 12:25:50 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMP_FILE = srcs/docker-compose.yml
CLEAN = srcs/requirements/tools/clean.sh

all: up

up:
		@docker-compose -f $(COM_FILE) up -d --build

stop:
		@docker-compose -f $(COM_FILE) stop

down:
		@docker-compose -f $(COMP_FILE) down

clean:
		@sh $(CLEAN)

prune :
		@docker system prune

ps :
		@docker-compose -f $(COMP_FILE) ps