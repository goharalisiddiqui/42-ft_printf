# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsiddiqu <gsiddiqu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/25 18:39:04 by gsiddiqu          #+#    #+#              #
#    Updated: 2021/07/01 16:28:03 by gsiddiqu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

NAME = libftprintf.a

FTLIB = ./libft/libft.a

OBJECTS = ft_printf.o ft_printf_hfuncs.o ft_printf_hfuncs2.o ft_printf_spec.o ft_printf_spec2.o ft_printf_flags.o ft_printf_flags2.o ft_printf_flags3.o

all: $(NAME)

$(NAME): $(FTLIB) $(OBJECTS)
	cp $(FTLIB) .
	mv libft.a $(NAME)
	ar rvs $(NAME) $(OBJECTS) $(FTLIB)

$(FTLIB):
	cd libft && $(MAKE)
	cd libft && $(MAKE) bonus

$(OBJECTS): libftprintf.h

clean:
	cd libft && $(MAKE) clean
	/bin/rm -f *.o

fclean: clean
	cd libft && $(MAKE) fclean
	/bin/rm -f $(NAME)

re: fclean all

test: $(FTLIB)
	gcc main.c $(OBJECTS:.o=.c) -Llibft -lft	