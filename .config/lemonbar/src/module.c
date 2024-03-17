#include "module.h"

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/epoll.h>
#include <sys/select.h>
#include <unistd.h>
#include <wait.h>

struct Module *modules = NULL;
extern int epoll_fd;

unsigned int num_modules()
{
    int num_modules = 0;
    for (struct Module *module = modules; module; module = module->next) {
        num_modules++;
    }
    return num_modules;
}

void add_module(const char *args[], bool escape, const char *prefix)
{
    assert(args);

    struct Module *module = calloc(1, sizeof *module);
    if (!module) {
        die("calloc");
    }

    memset(module->buffer, 0, sizeof(module->buffer));
    memset(module->buffer, 0, sizeof(module->read_buf));

    module->args = args;
    module->id = num_modules();
    module->escape = escape;
    module->prefix = prefix;

    if (pipe(module->fd) < 0) {
        die("pipe");
    }

    int pid = fork();
    if (pid < 0) {
        die("fork");
    }

    if (pid == 0) {
        dup2(module->fd[1], 1);
        close(module->fd[0]);
        close(module->fd[1]);
        execvp(module->args[0], (char **)module->args);
        exit(1);
    }

    fprintf(stderr, "started module: %d\n", module->id);
    close(module->fd[1]);

    struct epoll_event ev;
    ev.events = EPOLLIN | EPOLLET;
    ev.data.ptr = module;

    if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, module->fd[0], &ev) < 0) {
        die("epoll_ctl");
    }

    if (!modules) {
        modules = module;
    } else {
        struct Module *tail = modules;
        while (tail->next != NULL) {
            tail = tail->next;
        }
        tail->next = module;
    }

    module->pid = pid;
}

void remove_module(struct Module *module)
{
    if (modules == module) {
        modules = module->next;
    } else {
        struct Module *itr = modules;
        while (itr && itr->next != module) {
            itr = itr->next;
        }
        if (itr->next == module) {
            itr->next = module->next;
        }
    }

    fprintf(stderr, "module %u removed...\n", module->id);
    free_module(module);
}

void free_module(struct Module *module)
{
    epoll_ctl(epoll_fd, EPOLL_CTL_DEL, module->fd[0], NULL);
    close(module->fd[0]);
    free(module);
}
