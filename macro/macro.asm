extern printf
%define double_it(r)    sal r,1

%macro prntf 2     ;两个参数的多行宏
    section .data
        %%arg1  db %1,0
        %%fmtint    db "%s %ld",10,0
    section .text
        mov rdi,%%fmtint
        mov rsi,%%arg1
        mov rdx,[%2]
        xor rax,rax
        call printf
%endmacro

section .data
    number dq -15
section .bss
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    prntf "The number is",number
    mov rax,[number]
    double_it(rax)
    mov [number],rax
    prntf "The number is",number
    leave
    ret