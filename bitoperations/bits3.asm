extern printb
extern printf
section .data
    msg1    db "No bits are set:",10,0
    msg2    db "Set bit #4,that is the 5th bit:",10,0
    msg3    db "Set bit #7,that is the 8th bit:",10,0
    msg4    db "Set bit #8,that is the 9th bit:",10,0
    msg5    db "Set bit #61,that is the 62th bit:",10,0
    msg6    db "Clear bit #8,that is the 9th bit:",10,0
    msg7    db "Test bit #61,that is the 62th bit:",10,0
    bitflags dq 0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rdi,msg1
    mov rax,0
    call printf
    mov rdi,[bitflags]
    call printb

    ;set bit4
    mov rdi,msg2
    mov rax,0
    call printf
    bts qword [bitflags],4
    mov rdi,[bitflags]
    call printb
    
    ;set bit7
    mov rdi,msg3
    mov rax,0
    call printf
    bts qword [bitflags],7
    mov rdi,[bitflags]
    call printb

    ;set bit8
    mov rdi,msg4
    xor rax,rax
    call printf
    bts qword [bitflags],8
    mov rdi,[bitflags]
    call printb

    ;set bit61
    mov rdi,msg5
    xor rax,rax
    call printf
    bts qword [bitflags],61
    mov rdi,[bitflags]
    call printb

    ;clear bit8
    mov rdi,msg6
    xor rax,rax
    call printf
    btc qword [bitflags],8
    mov rdi,[bitflags]
    call printb
    ;test bit61
    mov rdi,msg7
    xor rax,rax
    call printf
    xor rdi,rdi
    bt qword [bitflags],61
    setc dil        ;iif cf 是1 ，则设置rdi低位
    call printb

    leave
    ret