section .text
  global ft_strlen
  extern __errno_location

; ==========================================================
; size_t ft_strlen(const char *s);
; Inputs
;   rdi = string
; Returns
;   rax = length of the string, or -1 and sets errno 
; ==========================================================
ft_strlen:
  push rdi
  call .loop
  sub rdi, [rsp]
  mov rax, rdi
  pop rdi
  ret

.loop:
  inc rdi
  cmp byte [rdi], 0
  jne .loop
  ret

