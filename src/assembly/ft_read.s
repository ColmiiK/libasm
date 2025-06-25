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
;   rax = amount of bytes read, or -1 and sets errno
; ==========================================================
ft_read:
  mov rax, 0 ; System call for read
  syscall
  cmp rax, 0 ; Set the SF flag
  jl .handle_error ; Jump if flag is set
  ret

.handle_error:
  neg rax ; Turn error code positive
  mov rdi, rax ; Store error code
  call __errno_location wrt ..plt ; Get location of errno
  mov [rax], rdi ; Put error code in errno
  mov rax, -1 ; Return -1
  ret

section .note.GNU-stack noalloc noexec nowrite
