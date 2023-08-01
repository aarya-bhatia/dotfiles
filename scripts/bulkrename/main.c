// TODO: File names are relative to cwd
// Compute actual path before renaming files.

#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#include "common.h"
#include "hashtable.h"
#include "log.h"

#define xfree(ptr)                                                             \
  free(ptr);                                                                   \
  ptr = NULL;

// void create_directories(const char *path) {
//   assert(path);
//
//   char *pre = calloc(1, strlen(path) + 1);
//   struct stat st;
//   while(s) {
//     strncpy(pre, path, s-path);
//     memset(&st, 0, sizeof st);
//
//     if(stat(pre, &st) == -1) {
//     }
//
//     s = strstr(s+1, "/");
//   }
// }

/**
 * To rename the original filenames to the modified filenames.
 * Note: Each filename is given by the relative path.
 *
 * The number of filenames in the tmpfile must match the num_files,
 * or else this operation will fail.
 *
 * TODO: Check if modified filename is a filename or a directory.
 * TODO: Check if all filenames are unique
 *
 * @param tmpfile The temporary file containing the modified file names line by
 * line
 * @param filenames The original filenames given by their relative paths
 * @param num_files Length of the original filenames array
 */
void check_and_rename_files(const char *tmpfile, char **filenames,
                            int num_files) {
  FILE *handle = fopen(tmpfile, "r");

  if (!handle) {
    log_error("Failed to open temp file: %s", tmpfile);
    return;
  }

  char *line = NULL;
  size_t line_cap = 0;
  ssize_t n_read = 0;
  int flag = 1;

  // An array to store the names of modified file names
  char **names = calloc(8, sizeof *names);
  size_t cap = 8;
  size_t size = 0;

  // A hashmap to check if all file names are unique
  Hashtable *hashtable = ht_alloc(shallow_copy, shallow_free, shallow_compare, string_hash, shallow_copy, shallow_free);

  // Read file line by line
  while ((n_read = getline(&line, &line_cap, handle)) > 0) {
    assert(line);

    int n = strlen(line);
    assert(n > 0);

    if (line[n - 1] == '\n') {
      line[n - 1] = 0;
    }

    // Resize the array if required
    if (size == cap) {
      names = realloc(names, (size + 8) * sizeof(*names));
      cap += 8;
    }

    names[size] = strdup(line);
    log_debug("Recevied file: %s", names[size]);

    if (ht_get(hashtable, names[size]) != NULL) {
      log_error("Error: File names must be unique");
      flag = 0;
      break;
    }

    ht_set(hashtable, names[size], NULL);

    size++;
    assert(ht_size(hashtable) == size);

    if (size > num_files) {
      log_error("Error: The number of files have changed");
      flag = 0;
      break;
    }
  }

  ht_free(hashtable);
  hashtable = NULL;

  fclose(handle);

  if (flag) {
    log_info("OK to rename (%zu files)", size);

    for (int i = 0; i < size; i++) {
      // TODO: Check if file is being moved to a different directory
      // Check if file name ends with a '/'

      char *original_filepath = filenames[i];
      char *new_filepath = names[i];

      log_info("before:%s\tafter:%s\n", original_filepath, new_filepath);

      if(strcmp(original_filepath, new_filepath) == 0) { continue; }

      create_directories(new_filepath);

      if (rename(filenames[i], names[i]) == -1) {
        log_error("Failed to rename file: %s", filenames[i]);
      }
    }
  }

  for (int i = 0; i < size; i++) {
    xfree(names[i]);
  }

  xfree(names);
  xfree(line);
}

int main(int argc, char *argv[]) {
  // char *selected = getenv("fx");
  //
  // if (!selected) {
  //   log_error("The env variable $fx was not set");
  //   return 1;
  // }
  //

  if (argc == 1) {
    log_warn("No files specified in arguments...");
    return 0;
  }

  struct stat st = {0};
  if (stat("/tmp/lf", &st) == -1) {
    int fd = mkdir("/tmp/lf", 0700);
    if (fd == -1) {
      log_error("Failed to create temporary directory");
      return 1;
    }
    close(fd);
    log_info("Created temporary directory");
  }

  char *tmpfile = NULL;
  asprintf(&tmpfile, "/tmp/lf/bulkrename-edit-XXXXXX");
  assert(tmpfile);
  int fd = mkstemp(tmpfile);

  if (fd == -1) {
    log_error("Failed to create temporary file");
    return 1;
  }

  log_info("Created temporary file: %s", tmpfile);

  assert(argc > 1);
  int num_files = argc - 1;
  char **filenames = calloc(num_files, sizeof(*filenames));
  assert(filenames);

  // Write filenames to temp file
  for (int i = 1; i < argc; i++) {
    char *filename = argv[i];
    filenames[i - 1] = realpath(filename, NULL);
    assert(filenames[i-1]);
    log_debug("%s", filenames[i-1]);
    write(fd, filenames[i-1], strlen(filenames[i-1]));
    write(fd, "\n", 1);
  }

  close(fd);

  int pid = fork();

  if (pid < 0) {
    perror("fork");
    exit(1);
  }

  if (pid == 0) {
    char *editor = getenv("EDITOR");
    if (!editor) {
      editor = "vim";
    }
    execlp(editor, editor, tmpfile, NULL);
    perror("execlp");
    exit(1);
  } else {
    int status;
    waitpid(pid, &status, 0);

    if (WIFEXITED(status)) {
      log_debug("Process has exited with status: %d\n", WEXITSTATUS(status));

      if (WEXITSTATUS(status) == 0) {
        check_and_rename_files(tmpfile, filenames, num_files);
      }
    }
  }

  for (int i = 0; i < num_files; i++) {
    xfree(filenames[i]);
  }
  xfree(filenames);

  remove(tmpfile);
  xfree(tmpfile);

  return 0;
}
