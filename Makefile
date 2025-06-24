# Variables
SRC_ASM_DIR := src/assembly
OBJ_ASM_DIR := obj/assembly
SRC_C_DIR := src/tests
OBJ_C_DIR := obj/tests

SRC_ASM := $(wildcard $(SRC_ASM_DIR)/*.s)
OBJ_ASM := $(patsubst $(SRC_ASM_DIR)/%.s, $(OBJ_ASM_DIR)/%.o, $(SRC_ASM))

SRC_C := $(wildcard $(SRC_C_DIR)/*.c)
OBJ_C := $(patsubst $(SRC_C_DIR)/%.c, $(OBJ_C_DIR)/%.o, $(SRC_C))

NAME := libasm.a
NASM := nasm
NASMFLAGS := -f elf64
AR := ar rcs
CC := gcc
CFLAGS := -Wall -Wextra -Werror -Wno-unused-parameter  -g

# Colors
DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# Rules

test: $(NAME) $(OBJ_C) | $(OBJ_C_DIR)
	@echo "$(MAGENTA)Linking tests...$(DEF_COLOR)"
	@$(CC) $(CFLAGS) $^ -L. -lasm -o test_exec
	@echo "$(MAGENTA)Running tests...$(DEF_COLOR)"
	@./test_exec

all: $(NAME)

$(NAME): $(OBJ_ASM)
	@$(AR) $@ $^
	@echo "$(GREEN)$(NAME) compiled!$(DEF_COLOR)"

$(OBJ_ASM_DIR)/%.o: $(SRC_ASM_DIR)/%.s | $(OBJ_ASM_DIR)
	@echo "$(YELLOW)Compiling assembly $<...$(DEF_COLOR)"
	@$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_ASM_DIR):
	@mkdir -p $@

$(OBJ_C_DIR)/%.o: $(SRC_C_DIR)/%.c | $(OBJ_C_DIR)
	@echo "$(BLUE)Compiling C $<...$(DEF_COLOR)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_C_DIR):
	@mkdir -p $@

valgrind: test
	@echo "$(MAGENTA)Running valgrind on tests...$(DEF_COLOR)"
	@valgrind ./test_exec

clean:
	@rm -rf obj/
	@echo "$(CYAN)Object files removed!$(DEF_COLOR)"

fclean: clean
	@rm -f $(NAME) test_exec
	@echo "$(CYAN)$(NAME) and test executable removed!$(DEF_COLOR)"

.PHONY: all clean fclean test valgrind
