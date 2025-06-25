section .text
  global ft_strcpy
  extern __errno_location

; ==========================================================
; char *ft_strcpy(char *dst, const char *src);
; Inputs
;   rdi = destination string
;   rsi = string to copy from
; Returns
;   rax = pointer to destination string
; ==========================================================
ft_strcpy:
  mov rdx, rdi
  call .loop
  mov rax, rdx
  ret

.loop:
  mov al, [rsi]
  mov [rdi], al
  inc rdi
  inc rsi
  cmp byte [rdi], 0
  jne .loop
  cmp byte [rsi], 0
  jne .loop
  ret

section .note.GNU-stack noalloc noexec nowrite
