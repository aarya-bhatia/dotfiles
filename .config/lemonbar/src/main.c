#include "module.h"
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/epoll.h>
#include <sys/select.h>
#include <unistd.h>
#include <wait.h>

#define SPACING "   "
#define PYTHON3 "python3"
#define MAX_EVENTS 10
#define SHELL "/bin/sh"

int epoll_fd;

volatile sig_atomic_t sigint_received = 0;
volatile sig_atomic_t sigchld_received = 0;

void display()
{
    char *display_buffer = calloc(1, (MAX_BUFFER_SIZE + strlen(SPACING)) * num_modules() + 1);
    int index = 0;

    display_buffer[index++] = ' ';

    for (struct Module *module = modules; module; module = module->next) {
        if (strlen(module->buffer) == 0) {
            continue;
        }

        if (module->prefix) {
            memcpy(display_buffer + index, module->prefix, strlen(module->prefix));
            index += strlen(module->prefix);
        }

        memcpy(display_buffer + index, module->buffer, strlen(module->buffer));
        index += strlen(module->buffer);

        memcpy(display_buffer + index, SPACING, strlen(SPACING));
        index += strlen(SPACING);
    }

    display_buffer[index++] = '\n';
    display_buffer[index] = 0;

    write(1, display_buffer, index);
}

void on_sigchld(int sig)
{
    sigchld_received = 1;
}

void on_sigint(int sig)
{
    sigint_received = 1;
}

void handle_events(struct epoll_event events[MAX_EVENTS], int num_events)
{
    for (int i = 0; i < num_events; ++i) {
        if (events[i].events & EPOLLIN) {
            struct Module *module = events[i].data.ptr;
            int flag = 0;
            for (struct Module *found = modules; found; found = found->next) {
                if (found == module) {
                    flag = 1;
                    break;
                }
            }

            if (flag == 0) {
                fprintf(stderr, "invalid module: %p (id=%d)\n", module, module->id);
                continue;
            }

            int num_bytes = read(module->fd[0], module->read_buf + module->nread, MAX_BUFFER_SIZE - module->nread - 1);
            if (num_bytes > 0) {
                module->read_buf[num_bytes] = 0;
                char *s;
                if ((s = strstr(module->read_buf, "\n"))) {
                    *s = 0;
                    strcpy(module->buffer, module->read_buf);
                    module->nread = 0;

                    /* if (module->escape) {
                        for (int j = 0; j < num_bytes; j++) {
                            if (module->buffer[j] == '%') {
                                module->buffer[j] = '_';
                            }
                        }
                    } */

                } else {
                    module->nread += num_bytes;
                }
            }
        }
    }
}

void handle_sigchld()
{
    // Reap dead child processes
    int status;
    pid_t pid;

    while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
        if (WIFEXITED(status)) {
            fprintf(stderr, "Child process %d exited with status %d\n", pid, WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            fprintf(stderr, "Child process %d terminated by signal %d\n", pid, WTERMSIG(status));
        }

        for (struct Module *itr = modules; itr; itr = itr->next) {
            if (itr->pid == pid) {
                epoll_ctl(epoll_fd, EPOLL_CTL_DEL, itr->fd[0], NULL);
                // remove_module(itr);
                break;
            }
        }
    }

    sigchld_received = 0;
}

int main()
{
    signal(SIGCHLD, on_sigchld);
    signal(SIGINT, on_sigint);
    signal(SIGTERM, on_sigint);

    epoll_fd = epoll_create1(0);
    if (epoll_fd == -1) {
        die("epoll_create1");
    }

    // add_module((const char *[]){"/home/aarya/scripts/lemonbar/apps.sh", NULL}, false, NULL);
    add_module((const char *[]){"/home/aarya/scripts/lemonbar/kernel.sh", NULL}, false, "%{l}");
    add_module((const char *[]){"/home/aarya/scripts/lemonbar/uptime.sh", NULL}, false, "%{c}");
    add_module((const char *[]){PYTHON3, "/home/aarya/scripts/lemonbar/disk.py", NULL}, false, "%{r}");
    add_module((const char *[]){"/home/aarya/scripts/lemonbar/packages.sh", NULL}, false, NULL);
    add_module((const char *[]){PYTHON3, "/home/aarya/scripts/cpu.py", NULL}, false, NULL);
    add_module((const char *[]){PYTHON3, "/home/aarya/scripts/memory.py", NULL}, false, NULL);
    add_module((const char *[]){PYTHON3, "/home/aarya/scripts/weather.py", NULL}, false, NULL);
    add_module((const char *[]){"/home/aarya/scripts/lemonbar/wifi.sh", NULL}, false, NULL);

    int n = num_modules();
    if (n == 0) {
        fputs("no modules are avilable", stderr);
        exit(0);
    }

    fprintf(stderr, "num modules added: %u\n", num_modules());

    while (!sigint_received) {
        struct epoll_event events[MAX_EVENTS];
        memset(events, 0, sizeof events);
        int num_events = epoll_wait(epoll_fd, events, MAX_EVENTS, -1);
        if (num_events == -1) {
            perror("epoll_wait");
            if (errno != EINTR) {
                fprintf(stderr, "errno=%d\n", errno);
                exit(1);
            }
        }

        if (num_events > 0) {
            handle_events(events, num_events);
            display();
        }

        if (sigchld_received) {
            handle_sigchld();
        }
    }

    for (struct Module *module = modules; module; module = module->next) {
        fprintf(stderr, "sending SIGTERM to module %d\n", module->id);
        kill(module->pid, SIGTERM);
    }

    while (modules) {
        struct Module *tmp = modules->next;
        waitpid(modules->pid, NULL, 0);
        free_module(modules);
        modules = tmp;
    }

    fputs("goodbye!", stderr);
    close(epoll_fd);
    return 0;
}
