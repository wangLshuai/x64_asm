section .data
    msg1    db "Hello, World!",10,0
    msg2    db "Your trun (only a-z): ",0
    msg3    db "You ansered: ",0
    inputlen    equ 10
    NL      db 0xa
section .bss
    input resb inputlen+1
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rdi,msg1
    call prints
    mov rdi,msg2
    call prints
    mov rdi,input
    mov rsi,inputlen
    call reads
    mov rdi,msg3
    call prints
    mov rdi,input
    mov rsi,inputlen
    call prints
    mov rdi,NL
    call prints

    leave
    ret
;-------------------------
prints:
    push rbp
    mov rbp,rsp
    push r12
    ;字符计数
    xor rdx,rdx
    mov r12,rdi
.lengthloop:
    cmp byte [r12],0
    je .lengthfound
    inc rdx
    inc r12
    jmp .lengthloop
.lengthfound:
    cmp rdx,0
    je .done
    mov rsi,rdi
    mov rax,1
    mov rdi,1
    syscall
.done:
    pop r12
    leave
    ret
;------------------------
reads:
    push rbp
    mov rbp,rsp
    push r12
    push r13
    push r14
    sub rsp, 8   ; inputchar buffer 在栈顶
    mov r12,rdi
    mov r13,rsi
    xor r14,r14
.readc:
    mov rax,0   ;read
    mov rdi,0
    lea rsi, [rsp]
    mov rdx,1   ;1个字符
    syscall
    mov al,[rsp]
    cmp al,[NL]
    je .done
    cmp al,97 ; 'a'
    jl  .readc
    cmp al,122 ;'z'
    jg .readc
    inc r14
    cmp r14,r13
    ja .readc
    mov [r12],al
    inc r12
    jmp .readc
.done:
    inc r12
    mov byte [r12],0
    add rsp,8
    pop r14
    pop r13
    pop r12


    leave
    ret