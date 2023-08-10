extern printf
section .data
    first   db "A"
    second  db "B"
    third   db "C"
    fourth  db "D"
    fifth   db "E"
    sixth   db "F"
    seventh db "G"
    eighth  db "H"
    ninth   db "I"
    tenth   db "J"
    fmt     db "The string is: %s",10,0
section .bss
    flist resb 11
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rdi,flist
    mov rsi,first
    mov rdx,second
    mov rcx,third
    mov r8,fourth
    mov r9,fifth
    push tenth
    push ninth
    push eighth
    push seventh
    push sixth
    call lfunc
    mov rdi,fmt
    mov rsi,flist
    mov rax,0
    call printf
    leave
    ret
;----------------------------------
lfunc:
    push rbp
    mov rbp,rsp
    xor rax,rax
    mov al,[rsi]
    mov [rdi],al
    mov al,[rdx]
    mov [rdi+1],al
    mov al,[rcx]
    mov [rdi+2],al
    mov al,[r8]
    mov [rdi+3],al
    mov al,[r9]
    mov [rdi+4],al
    ;栈
    push rbx
    xor rbx,rbx
    mov rax,[rbp+16]
    mov bl,[rax]
    mov [rdi+5],bl
    mov rax,[rbp+24]
    mov bl,[rax]
    mov [rdi+6],bl
    mov rax,[rbp+32]
    mov bl,[rax]
    mov [rdi+7],bl
    mov rax,[rbp+40]
    mov bl,[rax]
    mov [rdi+8],bl
    mov rax,[rbp+48]
    mov bl,[rax]
    mov [rdi+9],bl
    mov al,0
    mov [rdi+10],al
    pop rbx
    leave
    ret