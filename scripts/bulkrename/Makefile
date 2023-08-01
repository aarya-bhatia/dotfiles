all: main

main: main.o hashtable.o common.o
	gcc -std=gnu99 $^ -o $@

%.o: %.c
	gcc -std=gnu99 -D_GNU_SOURCE -Wall -Werror -g -c $< -o $@

memcheck:
	valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
				 ./main $(shell ls)

clean:
	rm -rf *.o main
