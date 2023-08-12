section .data
section .bss
section .text
    global asum
asum:
    push rbp
    mov rbp,rsp
    push rbx
    push r12
    xor rcx,rsi
    mov rbx,rdi
    mov r12,0
    movsd xmm0,[rbx+r12*8]
    dec rcx
sumloop:
    inc r12
    addsd xmm0,[rbx+r12*8]
    loop sumloop

    pop r12
    pop rbx
    leave
    ret