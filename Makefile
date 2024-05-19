# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: okoca <okoca@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: Invalid date        by okoca             #+#    #+#              #
#    Updated: 2024/05/19 16:01:57 by okoca            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc

SRC_DIR = ./src/

INCLUDES_DIR = ./includes/

CFLAGS = -Wall -Werror -Wextra -I ${INCLUDES_DIR} -c

SRC_FILES = ft_atoi.c \
	ft_bzero.c \
	ft_isalnum.c \
	ft_isalpha.c \
	ft_isascii.c \
	ft_isdigit.c \
	ft_isprint.c \
	ft_memcpy.c \
	ft_memmove.c \
	ft_memset.c \
	ft_memchr.c \
	ft_memcmp.c \
	ft_strchr.c \
	ft_strlcat.c \
	ft_strlcpy.c \
	ft_strlen.c \
	ft_strrchr.c \
	ft_tolower.c \
	ft_toupper.c \
	ft_strncmp.c \
	ft_strnstr.c \
	ft_strdup.c \
	ft_calloc.c \
	ft_substr.c \
	ft_strjoin.c \
	ft_strtrim.c \
	ft_split.c \
	ft_itoa.c \
	ft_strmapi.c \
	ft_striteri.c \
	ft_putchar_fd.c \
	ft_putstr_fd.c \
	ft_putendl_fd.c \
	ft_putnbr_fd.c

LIB = libft.a

SRC = ${addprefix ${SRC_DIR}, ${SRC_FILES}}

# TESTS_DIR = ./tests/

# TESTS_FILES = test_str.c \
# 	      test_mem.c \
# 	      test_is.c \
# 	      test_put.c \
# 	      tests.c

# TESTS = ${addprefix ${TESTS_DIR}, ${TESTS_FILES}}

OBJS = ${SRC:.c=.o} #${TESTS:.c=.o}

# TARGET = main

%.o: %.c
	${CC} ${CFLAGS} $< -o ${<:.c=.o}

# ${TARGET}: main.c ${LIB}
# 	${CC} ${CFLAGS} main.c -L. -lft -lbsd -o ${TARGET}

${LIB}: ${OBJS}
	ar rcs ${LIB} ${OBJS}

all: ${LIB} #${TARGET}

so:
	$(CC) -fPIC $(CFLAGS) $(SRC)
	gcc -shared -o libft.so $(OBJS)

clean:
	rm -f ${OBJS}
	rm -f put*.txt
	rm -f ${SRC_DIR}*.out

fclean: clean
	rm -f ${LIB}
#	${TARGET}

re: fclean all

.PHONY: all clean fclean re

