#pragma once

#include <stdbool.h>

#define MAX_BUFFER_SIZE 256

#define die(msg)                                                                                                       \
    perror(msg);                                                                                                       \
    exit(1);

struct Module {
    unsigned id;
    int pid;
    int fd[2];
    char read_buf[MAX_BUFFER_SIZE];
    char buffer[MAX_BUFFER_SIZE];
    int nread;
    const char **args;
    struct Module *next;
    bool escape;
    const char *prefix;
    char *ul_color;
    char *bg_color;
    char *fg_color;
};

unsigned int num_modules();
void add_module(const char *args[], bool escape, const char *prefix);
void free_module(struct Module *module);
void remove_module(struct Module *module);

extern struct Module *modules;
