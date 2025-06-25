section .text
  global ft_write
  extern __errno_location

; ==========================================================
; ssize_t ft_write(int fd, const void *buf, size_t count);
; Inputs
;   rdi = file descriptor
;   rsi = buffer
;   rdx = buffer lenght
; Returns
;   rax = number of bytes written, or -1 and sets errno 
; ==========================================================
ft_write:
  mov rax, 1 ; Set the syscall for write
  syscall
  cmp rax, 0 ; Set the CPU Sign flag (SF) if rax is negative
  jl .handle_error ; Jump if SF is set
  ret

.handle_error:
  neg rax ; Make error code positive
  mov rdi, rax ; Store error code
  call __errno_location wrt ..plt ; Get location of errno
  mov [rax], rdi ; Put the error code in errno
  mov rax, -1 ; Return -1
  ret

section .note.GNU-stack noalloc noexec nowrite
