section .text
  global ft_read
  extern __errno_location

; ==========================================================
; ssize_t ft_read(int fd, void *buf, size_t count);
; Inputs
;   rdi = file descriptor to read from
;   rsi = where to write the bytes
;   rdx = how many bytes to read
; Returns
;   rax = amount of bytes read
; ==========================================================
ft_read:
  mov rax, 0
  syscall
  cmp rax, 0
  jl .handle_error
  ret

.handle_error:
  neg rax
  push rdi
  mov rdi, rax
  call __errno_location wrt ..plt
  mov [rax], rdi
  mov rax, -1
  pop rdi
  ret

section .note.GNU-stack noalloc noexec nowrite
