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
  push rdi ; Save the string to compare it later
  dec rdi ; Decrement it once in case the string is 0 chars
  call .loop
  sub rdi, [rsp] ; New ptr - old ptr
  mov rax, rdi ; Return value
  pop rdi ; Restore string
  ret

.loop:
  inc rdi ; Advance the pointer
  mov al, [rdi] ; Take the byte
  test al, al ; Is the byte null
  jne .loop ; Repeat the loop
  ret

section .note.GNU-stack noalloc noexec nowrite
