#include "testing.h"

// void invalid_fd(int n, int fd, const char *msg, size_t len) {
//   errno = 0;
//   n = ft_write(-1, msg, len);
//   if (n < 0)
//     print_error_success();
//   else
//     print_success("Unexpectedly succeeded with fd = -1");
// }
//
// void null_buffer(int n, int fd, const char *msg, size_t len) {
//   errno = 0;
//   n = ft_write(fd, NULL, len);
//   if (n < 0)
//     print_error_success();
//   else
//     print_success("Unexpectedly succeeded with NULL buffer");
// }
// void zero_length_write(int n, int fd, const char *msg, size_t len) {
//   errno = 0;
//   n = ft_write(fd, msg, 0);
//   if (n == 0)
//     print_success("Correctly wrote 0 bytes");
//   else if (n < 0)
//     print_error_success();
//   else
//     print_success("Non-zero write with len = 0 (might be OK)");
// }

void test_string(const char *msg) {
  int n = ft_strlen(msg);
  if (n == -1)
    print_error();
  else {
    if (n != (int)strlen(msg)) {
      char buf[1024];
      sprintf(buf, "%s -> Output: %d, Expected: %ld", msg, n, strlen(msg));
      print_custom_error(buf);
    } else {
      char buf[1024];
      sprintf(buf, "%s -> Output: %d, Expected: %ld", msg, n, strlen(msg));
      print_success(buf);
    }
  }
}

void test_ft_strlen(void) {
  printf(CYAN "========== Testing ft_strlen ==========\n" RESET);
  printf(YELLOW " Correct Usage\n" RESET);
  test_string("Hello World!");
  test_string("Very long and very full string of characters that is very long "
              "and very complicated with a lot of characters that are full");
  test_string("a");
  test_string("");
  test_string("😂⛔🐒🦊🌏");
  test_string("Cut\0String");

  printf(YELLOW "\n Error Cases\n" RESET);

  // invalid_fd(n, fd, msg, len);
  // null_buffer(n, fd, msg, len);
  // zero_length_write(n, fd, msg, len);
}
