extern printf
section .data
    msg db "The command and arguments: ",10,0
    fmt db "%s",10,0
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov r12,rdi
    mov r13,rsi
    mov rdi,msg
    call printf
    mov r14,0
.ploop:
    mov rdi,fmt
    mov rsi,[r13+r14*8]
    call printf
    inc r14
    cmp r14,r12
    jl .ploop

    leave
    ret