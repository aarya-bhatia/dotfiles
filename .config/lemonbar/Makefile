CC=gcc
CFLAGS=-c -Wall -g -std=c99 -O0 -D_GNU_SOURCE

SRC=$(wildcard src/*.c)
OBJS=$(SRC:src/%.c=obj/%.o)

bin/main: $(OBJS)
	mkdir -p bin/
	$(CC) $^ -o $@

obj/%.o: src/%.c
	mkdir -p obj/
	$(CC) $(CFLAGS) $< -o $@

clean:
	/bin/rm -rf obj/ bin/
