
#ifndef TESTING_H
#define TESTING_H

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define RESET "\033[0m"
#define RED "\033[1;31m"
#define GREEN "\033[1;32m"
#define YELLOW "\033[1;33m"
#define CYAN "\033[1;36m"

// Assembly
ssize_t ft_write(int fd, const void *buf, size_t count);
size_t ft_strlen(const char *s);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strcpy(char *dst, const char *src);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strdup(const char *s);

// Test wrappers
void test_ft_write(void);
void test_ft_strlen(void);
void test_ft_read(void);
void test_ft_strcpy(void);
void test_ft_strcmp(void);
void test_ft_strdup(void);

// Utils
void print_error_success(void);
void print_success(const char *msg);
void print_error(void);
void print_custom_error(const char *msg);

#endif
