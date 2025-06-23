# Variables
SRC_DIR := src
OBJ_DIR := obj
SRC := $(wildcard $(SRC_DIR)/*.asm)
OBJ := $(patsubst $(SRC_DIR)/%.asm, $(OBJ_DIR)/%.o, $(SRC))
NAME := libasm.a
NASM := nasm
NASMFLAGS := -f elf64
AR := ar rcs

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
test: all
	@gcc -g main.c -L. -lasm -o main
	@./main

valgrind: all
	@gcc -g main.c -L. -lasm -o main
	@valgrind ./main

all: $(NAME)

$(NAME): $(OBJ)
	@$(AR) $@ $^
	@echo "$(GREEN)$(NAME) compiled!$(DEF_COLOR)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling $<...$(DEF_COLOR)"
	@$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@rm -rf obj/
	@echo "$(CYAN)Object files removed!$(DEF_COLOR)"

fclean: clean
	@rm $(NAME)
	@echo "$(CYAN)$(NAME) removed!$(DEF_COLOR)"

.PHONY: all clean fclean test valgrind
