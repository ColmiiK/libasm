section .text
  global ft_strlen
  extern __errno_location

; ==========================================================
; size_t ft_strlen(const char *s);
; Inputs
;   rdi = string
; Returns
;   rax = length of the string
; ==========================================================
ft_strlen:
  xor rax, rax ; Set counter to 0

.loop:
  cmp byte [rdi + rax], 0 ; Check if ptr + counter is 0
  je .done
  inc rax
  jmp .loop

.done:
  ret

section .note.GNU-stack noalloc noexec nowrite
