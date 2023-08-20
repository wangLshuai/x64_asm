%macro prnt 2
    mov rax,1
    mov rdi,1
    mov rsi,%1
    mov rdx,%2
    syscall
    mov rax,1
    mov rdi,1
    mov rsi,NL
    mov rdx,1
    syscall
%endmacro

section .data
    lenght equ 95
    NL db 0x0a
    string1 db "my_string of ASCII:"
    string2 db 10,"my_string of zeros:"
    string3 db 10,"my_string of ones:"
    string4 db 10,"again my_string of ASCII:"
    string5 db 10,"copy my_string to other_string:"
    string6 db 10,"reverse copy my_string to other_string:"
section .bss
    my_string resb lenght
    other_string resb lenght
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    prnt string1,18
    mov rax,32  ;' '
    mov rdi,my_string
    mov rcx,lenght
.str_loop1:
    mov [rdi],al
    inc rdi
    inc al
    loop .str_loop1
    prnt my_string,lenght

    prnt string2,string3-string2
    mov rax,48
    mov rdi,my_string
    mov rcx,lenght
.str_loop2:
    ; mov [rdi],al
    ; inc rdi
    stosb   
    loop .str_loop2
    prnt my_string,lenght
    
    prnt string3,string4-string3
    mov rax,49 ;'1'
    mov rdi,my_string
    mov rcx,lenght
    rep stosb   ;repeat rcx
    prnt my_string,lenght

    prnt string4,string5-string4
    mov rax,32  ;' '
    mov rdi,my_string
    mov rcx,lenght
.str_loop3:
    mov [rdi],al
    inc rdi
    inc al
    loop .str_loop3
    prnt my_string,lenght
;copy
    prnt string5,32
    mov rsi,my_string
    mov rdi,other_string
    mov rcx,lenght
    rep movsb
    prnt other_string,lenght
; 反向copy
    prnt string6,40
    mov rax,48
    mov rdi,other_string
    mov rcx,lenght
    rep stosb   ;stosb 储存al到rsi中,改变rsi.rep重复rcx
    ; prnt other_string,lenght
    lea rsi,[my_string+lenght-4]
    lea rdi,[other_string+lenght]
    mov rcx,27
    std ;set cflags df ,反向，movsb 复制rsi地址到rdi，之后rsi rdi减小
    rep movsb
    prnt other_string,lenght

    leave
    ret