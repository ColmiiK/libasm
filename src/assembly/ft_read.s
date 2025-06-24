section .text
  global ft_read
  extern __errno_location

; ==========================================================
; ssize_t ft_read(int fd, void *buf, size_t count);
; Inputs
; Returns
; ==========================================================
ft_read:

section .note.GNU-stack noalloc noexec nowrite
