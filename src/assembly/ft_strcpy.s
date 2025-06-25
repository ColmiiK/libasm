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
  mov rdx, rdi ; Store the original ptr
.loop:
  mov al, [rsi] ; Take a byte
  mov [rdi], al ; Move that byte to dst
  inc rdi ; Advance dst
  inc rsi ; Advance src
  test al, al ; Is dst at null?
  jne .loop
  mov rax, rdx
  ret

section .note.GNU-stack noalloc noexec nowrite
