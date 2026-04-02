; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    myString: db "Hello, World!", 0
    goodbyeString: db "Goodbye, World!", 0
    N: dq 6                         ; N = 6

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]              ; rcx will store the value of N
    PRINTF64 `%d\n\x0`, rcx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov rax, 2
    mov r8, 1
    cmp rax, r8
    jg print                        ; TODO1: rax > r8?
    xor rax, rax

    leave
    ret

print:
    bucla:
      push rcx                     ; salvezi rcx pe stivă (PRINTF64 îl poate strica)
      PRINTF64 `%s\n\x0`, myString ; printează "Hello, World!"
      pop rcx                      ; restaurezi rcx
      dec rcx                      ; rcx = rcx - 1
      jnz bucla                    ; dacă rcx != 0, sari înapoi la bucla

      PRINTF64 `%s\n\x0`, goodbyeString  ; printează"Goodbye, World!"

      xor rax, rax
      leave
      ret
