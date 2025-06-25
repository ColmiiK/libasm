# libasm

## Requirements

- Functions should not quit unexpectedly (`seg fault`)
- Makefile must contain `$(NAME)`, `all`, `clean`, `fclean` and `re`
- For bonus, add a `bonus` rule that will compile `_bonus.c/.h` files
- Write 64 bit assembly. Beware of the calling convention
- Do not use inline assembly, use `.s` files
- Compile your code with `nasm`
- Use the Intel syntax, not the AT&T syntax
- It's forbidden to use the `-no-pie` compilation flag
- Library must be called `libasm.a`
- Must submit a main function that will test the functions,
  compile the library to demonstrate that it's functional
- Check for errors during syscalls and handle them properly when needed
- Must set the variable `errno` properly.
  You're allowed to call the `extern ___error` or `errno_location`

## Functions to rewrite

- `ft_strcpy` (`man 3 strcpy`)
- `ft_strcmp` (`man 3 strcmp`)
- `ft_read` (`man 2 read`)
- `ft_strdup` (`man 3 strdup`, `malloc` allowed)
- `ft_strlen` (`man 3 strlen`)
- `ft_write` (`man 2 write`)
