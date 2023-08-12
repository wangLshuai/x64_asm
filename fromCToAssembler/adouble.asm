section .data
section .bss
section .text
    global adouble
adouble:
    mov rcx,rsi
    mov rbx,rdi
    mov r12,0
.aloop:
    movsd xmm0,[rbx+r12*8]
    addsd xmm0,xmm0
    movsd [rbx+r12*8],xmm0
    inc r12
    loop .aloop
    ret