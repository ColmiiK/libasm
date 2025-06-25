section .text
  global ft_strcmp
  extern __errno_location

; ==========================================================
; int ft_strcmp(const char *s1, const char *s2);
; Inputs
;   rdi = first string to compare
;   rsi = second string to compare
; Returns
;   rax = difference between s1 and s2
; ==========================================================
ft_strcmp:
  call .loop
  sub al, bl
  movsx rax, al
  ret

.loop:
  mov al, [rdi]
  mov bl, [rsi]
  cmp al, bl
  inc rdi
  inc rsi
  je .loop
  ret

section .note.GNU-stack noalloc noexec nowrite
