#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>
#include "log.h"

void mkdirs(char *dirname) {
  assert(dirname);
  assert(strlen(dirname));
  assert(dirname[0] == '/');
  assert(!strstr(dirname, ".."));
  assert(!strstr(dirname, "./"));
  assert(!strstr(dirname, "~/"));

  if(strcmp(dirname, "/") == 0) {
    return;
  }

  char *s = strstr(dirname, "/");

  while(s) {
    char *tmp = strndup(dirname, s - dirname);
    s = strstr(s + 1, "/");
    if(mkdir(tmp, 0750) == -1) {
      free(tmp);
      if(errno == EEXIST) { continue; }
      perror("mkdir");
      return;
    }
    free(tmp);
  }

  mkdir(dirname, 0750);
}

char *get_dirname(char *filepath) {
  assert(filepath);
  assert(strlen(filepath) > 0);

  char *s = strstr(filepath, "/");

  if(!s) {
    return getcwd(NULL, 0);
  }

  char *t = NULL;
  while(s) {
    t = s;
    s = strstr(s + 1, "/");
  }

  // Root directory
  if(t == filepath) {
    return strdup("/");
  }

  char *dir = strndup(filepath, t - filepath + 1);

  // Home directory
  if(dir[0] == '~' && dir[1] == '/'){
    char *homedir = getenv("HOME");
    char *dirnew = NULL;
    asprintf(&dirnew, "%s/%s", homedir, dir+2);
    free(dir);
    dir = dirnew;
  }

  // puts(dir);

  char *result = calloc(1, 256);
  if(realpath(dir, result) == NULL) {
    perror("realpath");
    free(dir);
    free(result);
    return NULL;
  }

  free(dir);
  return result;
}

void test(char *path) {
  log_info("get_dirname(\"%s\"): \"%s\"", path, get_dirname(path));
}

int main() {
  // test("../hello");
  // test("./../hello.txt");
  // test("~/test/test1/../hello");
  // test("~/test/test1/hello");
  // test("data/test1/test2/hello");
  // test("/Users/aaryab/hello");
  // test("~/hello");
  // test("/hello");
  // test(".../hello");

  mkdirs(get_dirname("data/test1/test2/test3/test4/file"));
}

