#include "testing.h"

void test_string(const char *msg) {
  int n = ft_strlen(msg);
  if (n == -1)
    err();
  else {
    char buf[1024];
    sprintf(buf, "%s -> Output: %d, Expected: %ld", msg, n, strlen(msg));
    if (n != (int)strlen(msg))
      failure(buf);
    else
      success(buf);
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
}
