#include "testing.h"

void test_success_strcpy(char *dst, char *src) {
  char c_dst[1024], o_dst[1024];
  strcpy(c_dst, dst);
  strcpy(o_dst, dst);
  char *c_buffer = ft_strcpy(c_dst, src);
  char *o_buffer = strcpy(o_dst, src);
  char buf[1024];
  sprintf(buf, "\tOutput:%15s\tExpected:%15s", c_buffer, o_buffer);
  if (strcmp(c_buffer, o_buffer))
    failure(buf);
  else
    success(buf);
  memset(c_buffer, 0, 1024);
  memset(o_buffer, 0, 1024);
}

void test_ft_strcpy(void) {
  printf(CYAN "========== Testing ft_strcpy ==========\n" RESET);
  printf(YELLOW " Correct Usage\n" RESET);

  test_success_strcpy("Hello", "World");
  test_success_strcpy("Lorem ipsum", "A");
  test_success_strcpy("H", "Lorem Ipsum");
  test_success_strcpy("", "World");
  test_success_strcpy("Hello", "");
  test_success_strcpy("", "");
  char buf[1024] = "Hello World!";
  test_success_strcpy(buf, buf + 5);
  char buf2[1024] = "Hello World!";
  test_success_strcpy(buf2 + 5, buf2);
}
