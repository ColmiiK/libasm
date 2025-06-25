#include "testing.h"

void test_success_read(char *file, int bytes) {
  char c_buffer[1024], o_buffer[1024];
  int c_fd = open(file, O_RDONLY);
  int o_fd = open(file, O_RDONLY);
  int c_n = ft_read(c_fd, c_buffer, bytes);
  int o_n = read(o_fd, o_buffer, bytes);
  char buf[4096 * 2];
  snprintf(buf, 4096, "\tOutput:\t%15.15s -> %4d\tExpected:\t%15.15s -> %4d",
           c_buffer, c_n, o_buffer, o_n);
  if (c_n != o_n || strcmp(c_buffer, o_buffer))
    failure(buf);
  else
    success(buf);
  memset(c_buffer, 0, 1024);
  memset(o_buffer, 0, 1024);
  close(c_fd);
  close(o_fd);
}

void test_error_read(char *file, int bytes) {
  errno = 0;

  char c_buffer[1024], o_buffer[1024];
  int c_fd = open(file, O_RDONLY);
  int o_fd = open(file, O_RDONLY);
  int c_n = ft_read(c_fd, c_buffer, bytes);
  int o_n = read(o_fd, o_buffer, bytes);
  if (c_n != o_n || strcmp(c_buffer, o_buffer)) {
    char buf[4096 * 2];
    snprintf(buf, 4096, "\tOutput:\t\t'%s' -> %d\n\tExpected:\t'%s' -> %d",
             c_buffer, c_n, o_buffer, o_n);
    failure(buf);
  } else {
    success_error();
  }
  memset(c_buffer, 0, 1024);
  memset(o_buffer, 0, 1024);
  close(c_fd);
  close(o_fd);
}

void test_ft_read(void) {
  printf(CYAN "========== Testing ft_read ==========\n" RESET);
  printf(YELLOW " Correct Usage\n" RESET);

  test_success_read("testfile.txt", 1);
  test_success_read("testfile.txt", 3);
  test_success_read("testfile.txt", 5);
  test_success_read("testfile.txt", 10);
  test_success_read("testfile.txt", 200);
  test_success_read("testfile2.txt", 9999);
  test_success_read("testfile.txt", 0);

  printf(YELLOW "\n Error Cases\n" RESET);

  test_error_read("testfile.txt", -1);
  test_error_read(0x0, 1);
}
