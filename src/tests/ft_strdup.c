#include "testing.h"

void test_success_strdup(char *str) {
  char *c_buffer = ft_strdup(str);
  char *o_buffer = strdup(str);

  char buf[1024];
  sprintf(buf, "\tOutput:%15s\tExpected:%15s", c_buffer, o_buffer);
  if (strcmp(c_buffer, o_buffer))
    failure(buf);
  else
    success(buf);

  free(c_buffer);
  free(o_buffer);
}

void test_ft_strdup(void) {
  printf(CYAN "========== Testing ft_strdup ==========\n" RESET);
  printf(YELLOW " Correct Usage\n" RESET);

  test_success_strdup("Hello World!");
  test_success_strdup("a");
  test_success_strdup("");
}
