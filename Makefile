# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tanguy <tanguy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 09:55:25 by tanguy            #+#    #+#              #
#    Updated: 2021/10/05 09:56:30 by tanguy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ERASE       =   \033[2K\r
GREY        =   \033[30m
RED         =   \033[31m
GREEN       =   \033[32m
YELLOW      =   \033[33m
BLUE        =   \033[34m
PINK        =   \033[35m
CYAN        =   \033[36m
WHITE       =   \033[37m
BOLD        =   \033[1m
UNDER       =   \033[4m
SUR         =   \033[7m
END         =   \033[0m

all:

norme:

clean:

fclean:

re:			fclean all

.PHONY:		all clean fclean re