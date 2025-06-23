section .text
  global print_string

; ==========================================================
;
; int print_string(const char *buf, size_t len);
;
; rdi = buffer
; rsi = buffer length
; rax = number of bytes written
;
; ==========================================================
print_string:

  mov rax, 1    ; Load the sys_call for write

  mov rdx, rsi  ; Load the length of the buffer
  mov rsi, rdi  ; Load the buffer
  mov rdi, 1    ; Load the file descriptor

  syscall
  ret

section .note.GNU-stack noalloc noexec nowrite
