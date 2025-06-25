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
  sub al, bl ; Get the difference
  movsx rax, al ; Move al into rax, padding with zeroes
  ret

.loop:
  mov al, [rdi] ; Take a byte
  mov bl, [rsi] ; Take a byte
  inc rdi ; Prepare for the next iteration
  inc rsi
  test al, al ; Check if s1 is done
  je .done
  test bl, bl ; Check if s2 is done
  je .done
  cmp al, bl ; Check if the bytes are different
  je .loop
  ret

.done:
  ret

section .note.GNU-stack noalloc noexec nowrite
