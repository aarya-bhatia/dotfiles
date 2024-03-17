CC=gcc
CFLAGS=-c -Wall -g -std=c99 -O0 -D_GNU_SOURCE

SRC=$(wildcard src/*.c)
OBJS=$(SRC:src/%.c=obj/%.o)

all: bin/main # bin/top_bar bin/bottom_bar

bin/main: $(OBJS)
	mkdir -p bin/
	$(CC) $^ -o $@

bin/top_bar: obj/eventloop.o obj/module.o obj/top_bar.o
	mkdir -p bin/
	$(CC) $^ -o $@

bin/bottom_bar: obj/eventloop.o obj/module.o obj/bottom_bar.o
	mkdir -p bin/
	$(CC) $^ -o $@

obj/%.o: src/%.c
	mkdir -p obj/
	$(CC) $(CFLAGS) $< -o $@

clean:
	/bin/rm -rf obj/ bin/
