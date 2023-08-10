extern printb
extern printf
section .data
    msgn1   db "Number 1",10,0
    msgn2   db "Number 2",10,0
    msg1    db "XOR",10,0
    msg2    db "OR",10,0
    msg3    db "AND",10,0
    msg4    db "NOT number 1",10,0
    msg5    db "SHL 2 lower byte of number 1",10,0
    msg6    db "SHR 2 lower byte of number 1",10,0
    msg7    db "SAL 2 lower byte of number 1",10,0
    msg8    db "SAR 2 lower byte of number 1",10,0
    msg9    db "ROL 2 lower byte of number 1",10,0
    msg10   db "ROL 2 lower byte of number 2",10,0
    msg11   db "ROR 2 lower byte of number 1",10,0
    msg12   db "ROR 2 lower byte of number 2",10,0
    number1 dq -72
    number2 dq 1064
section .bss
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    ;打印number1
    mov rsi,msgn1
    call printmsg
    mov rdi,[number1]
    call printb
    ;打印number2
    mov rsi,msgn1
    call printmsg
    mov rdi,[number2]
    call printb

    ;xor异或
    mov rsi,msg1
    call printmsg
    mov rax,[number1]
    xor rax,[number2]
    mov rdi,rax
    call printb

    ;or
    mov rsi,msg2
    call printmsg
    mov rax,[number1]
    or rax,[number2]
    mov rdi,rax
    call printb

    ;and
    mov rsi,msg3
    call printmsg
    mov rax,[number1]
    and rax,[number2]
    mov rdi,rax
    call printb

    ;not
    mov rsi,msg4
    call printmsg
    mov rax,[number1]
    not rax
    mov rdi,rax
    call printb

    ;shl shift left
    mov rsi,msg5
    call printmsg
    mov rax,[number1]
    shl al,2
    mov rdi,rax
    call printb

    ;shr shift right
    mov rsi,msg6
    call printmsg
    mov rax,[number1]
    shr al,2
    mov rdi,rax
    call printb

    ;sal shift arithetic left 算术左移
    mov rsi,msg7
    call printmsg
    mov rax,[number1]
    sal al,2
    mov rdi,rax
    call printb

    ;sar shift arithetic right 算术右移
    mov rsi,msg8
    call printmsg
    mov rax,[number1]
    sar al,2
    mov rdi,rax
    call printb

    ;rol rotate left 循环左移
    mov rsi,msg9
    call printmsg
    mov rax,[number1]
    rol al,2
    mov rdi,rax
    call printb
    mov rsi,msg10
    call printmsg
    mov rax,[number2]
    rol al,2
    mov rdi,rax
    call printb

    ;ror 循环右移
    mov rsi,msg11
    call printmsg
    mov rax,[number1]
    ror al,2
    mov rdi,rax
    call printb
    mov rsi,msg12
    call printmsg
    mov rax,[number2]
    ror al,2
    mov rdi,rax
    call printb


    leave
    ret

;-------------------
printmsg:
section .data
    .fmtstr db "%s",0
section .text
    mov rdi,.fmtstr
    mov rax,0
    call printf
    ret
