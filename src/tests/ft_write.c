#include "testing.h"

void invalid_fd(int n, int fd, const char *msg, size_t len) {
  errno = 0;
  n = ft_write(-1, msg, len);
  if (n < 0)
    success_error();
  else
    success("Unexpectedly succeeded with fd = -1");
}

void null_buffer(int n, int fd, const char *msg, size_t len) {
  errno = 0;
  n = ft_write(fd, NULL, len);
  if (n < 0)
    success_error();
  else
    success("Unexpectedly succeeded with NULL buffer");
}
void zero_length_write(int n, int fd, const char *msg, size_t len) {
  errno = 0;
  n = ft_write(fd, msg, 0);
  if (n == 0)
    success("Correctly wrote 0 bytes");
  else if (n < 0)
    success_error();
  else
    success("Non-zero write with len = 0 (might be OK)");
}

void test_ft_write(void) {
  printf(CYAN "========== Testing ft_write ==========\n" RESET);
  const char *msg = "Hello World!\n";
  const size_t len = strlen(msg);
  const int fd = 1;

  int n = ft_write(fd, msg, len);
  if (n == -1)
    success_error();
  else
    success("Wrote 'Hello World!' to stdout");

  printf(YELLOW "\n Error Cases\n" RESET);

  invalid_fd(n, fd, msg, len);
  null_buffer(n, fd, msg, len);
  zero_length_write(n, fd, msg, len);
}
