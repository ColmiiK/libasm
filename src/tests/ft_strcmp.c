#include "testing.h"

void test_success_strcmp(char *s1, char *s2) {
  int c_n = ft_strcmp(s1, s2);
  int c_o = strcmp(s1, s2);

  char buf[1024];
  sprintf(buf, "%5s - %-5s\tOutput:%4d\tExpected:%4d", s1, s2, c_n, c_o);
  if (c_n != c_o)
    failure(buf);
  else
    success(buf);
  memset(buf, 0, 1024);
}

void test_ft_strcmp(void) {
  printf(CYAN "========== Testing ft_strcmp ==========\n" RESET);
  printf(YELLOW " Correct Usage\n" RESET);

  test_success_strcmp("World", "World");
  test_success_strcmp("Hello", "World");
  test_success_strcmp("World", "Hello");
  test_success_strcmp("1", "2");
  test_success_strcmp("2", "1");
  test_success_strcmp("", "");
  test_success_strcmp("ab", "a");
  test_success_strcmp("a", "ab");
  test_success_strcmp("", "abcd");
  test_success_strcmp("abcd", "");
}
