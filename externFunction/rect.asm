section .data
section .bss
section .text
;-----------------------
global r_area
r_area:
    push rbp
    mov rbp,rsp
    mov rax,rsi
    imul rax,rdi
    leave
    ret
;-----------------------
global r_circum
r_circum:
    push rbp
    mov rbp,rsp
    mov rax,rsi
    add rax,rdi
    add rax,rax
    leave
    ret