section .data
section .bss
section .text
    global sreverse
sreverse:
    push rbp
    mov rbp,rsp
    push rbx
    push r12
.pushing:
    mov rcx,rsi
    mov rbx,rdi
    mov r12,0
.pushLoop:
    mov rax,[rbx+r12]
    push rax
    inc r12
    loop .pushLoop
.popping:
    mov rcx,rsi
    mov rbx,rdi
    mov r12,0
.popLoop:
    pop rax
    mov [rbx+r12],al
    inc r12
    loop .popLoop

    mov rax,rdi
    pop r12
    pop rbx
    leave
    ret
