#include "testing.h"

void print_error_success(void) {
  fprintf(stdout, GREEN "  [OK] %s\n" RESET, strerror(errno));
}

void print_success(const char *msg) { printf(GREEN "  [OK] %s\n" RESET, msg); }
void print_custom_error(const char *msg) {
  printf(RED "  [KO] %s\n" RESET, msg);
}

void print_error(void) {
  fprintf(stderr, RED "  [ERROR] %s\n" RESET, strerror(errno));
}
