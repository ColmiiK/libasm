#include "testing.h"

void success_error(void) {
  fprintf(stdout, GREEN "  [OK] %s\n" RESET, strerror(errno));
}

void success(const char *msg) { printf(GREEN "  [OK] %s\n" RESET, msg); }
void failure(const char *msg) { printf(RED "  [KO] %s\n" RESET, msg); }

void err(void) { fprintf(stderr, RED "  [ERROR] %s\n" RESET, strerror(errno)); }
