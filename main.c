#include <stddef.h>
#include <stdio.h>
#include <string.h>
extern int print_string(const char *str, size_t len);

int main() {
  const char *str = "Hello World!\n";
  size_t len = strlen(str);
  const int result = print_string(str, len);
  printf("result: %d\n", result);
}
