CC=gcc
INCLUDES=-Isrc/ -Isrc/Aarya
CFLAGS=-std=gnu99 -Wall -Wextra -Wno-pointer-arith -pedantic -gdwarf-4 -MMD -MP -O0 -D_GNU_SOURCE -c $(INCLUDES)
FILES=$(shell find src/Aarya -type f -name "*.c")
OBJ=$(FILES:src/%.c=obj/%.o)

all: main

main: obj/main.o $(OBJ)
	$(CC) -std=gnu99 $^ -o $@

files_test: obj/files_test.o $(OBJ)
	$(CC) -std=gnu99 $^ -o $@

obj/%.o: src/%.c
	@mkdir -p $(dir $@);
	$(CC) $(CFLAGS) $< -o $@

.PHONY: memcheck
memcheck:
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./main $(shell ls)

.PHONY: clean
clean:
	rm -rf obj main

-include obj/*.d

