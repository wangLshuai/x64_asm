extern printf
section .data
    number1 dq 128
    number2 dq 19
    neg_num dq -12
    fmt db "The number are %ld and %ld",10,0
    fmtint db "%s %ld",10,0
    sumi db "The sum is",0
    difi db "The difference is",0
    inci db "Number 1 Incremented:",0
    deci db "Number 1 Decremented:",0
    sali db "Number 1 Shift left 2 (*4):",0
    sari db "Number 1 Shift right 2 (/4):",0
    sariex db "Number 1 Shift right 2 (/4) with sign extension:",0
    multi db "The product is",0
    divi db "The integer quotient is",0
    remi db "The modulo is",0
section .bss
    resulti resq 1
    modulo resq 1
section .text
    global main
main:
    push rbp
    mov rbp,rsp
; 显示数字--------------------
    mov rdi,fmt
    mov rsi,[number1]
    mov rdx,[number2]
    mov rax,0
    call printf

;加法--------------------------
    mov rax,[number1]
    add rax,[number2]
    mov [resulti],rax
    mov rsi,sumi
    call printresult

;减法---------------------------
    mov rax,[number1]
    sub rax,[number2]
    mov [resulti],rax
    mov rsi,difi
    call printresult

;递增--------------------
    mov rax,[number1]
    inc rax
    mov [resulti],rax
    mov rsi,inci
    call printresult

;递减-------------------------
    mov rax,[number1]
    dec rax
    mov [resulti],rax
    mov rsi,deci
    call printresult

;左移运算------------------
    mov rax,[number1]
    sal rax,2
    mov [resulti],rax
    mov rsi,sali
    call printresult
    
;右移运算---------------
    mov rax,[number1]
    sar rax,2
    mov [resulti],rax
    mov rsi,sari
    call printresult

;带符号的右移运算----------------------
    mov rax,[neg_num]
    sar rax,2
    mov [resulti],rax
    mov rsi,sariex
    call printresult

;乘法---------------------------
    mov rax,[number1]
    imul qword [number2]
    mov [resulti],rax
    mov rsi,multi
    call printresult

;除法 rdx:rax / -----------------
    xor rdx,rdx
    mov rax,[number1]
    idiv qword [number2]
    mov [resulti],rax
    mov rsi,divi
    call printresult

    mov rsi,remi
    mov [resulti],rdx
    call printresult

    leave
    ret

; function printresult-------------------- rsi [resulti]
printresult:
    push rbp
    mov rbp,rsp
    push rax
    push rdx
    push rdi
    mov rdi,fmtint
    mov rdx,[resulti]
    mov rax,0
    call printf
    pop rdi
    pop rdx
    pop rax
    leave
    ret