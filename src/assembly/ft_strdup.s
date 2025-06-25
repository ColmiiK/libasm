section .text
  global ft_strdup
  extern __errno_location
  extern malloc
  extern ft_strlen
  extern ft_strcpy

; ==========================================================
; char *ft_strdup(const char *s);
; Inputs
;   rdi = string to copy
; Returns
;   rax = ptr to the string
; ==========================================================
ft_strdup:
  push rdi ; Save the original string
  call ft_strlen ; Get the length
  add rax, 1 ; Add space for the null terminator
  mov rdi, rax ; Set the argument for malloc
  call malloc wrt ..plt
  test rax, rax ; Check if malloc failed
  je .handle_error
  pop rsi ; Restore the original string
  mov rdi, rax ; Set the malloc'd ptr fo dst
  call ft_strcpy ; Copy the original string into the new space
  ret

.handle_error:
  mov rax, 0 ; Return null
  ret

section .note.GNU-stack noalloc noexec nowrite
