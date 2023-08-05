;hello.asm
section .data
    msg db "hello,world",0x0a,0
section .bss
section .text
    global main
main:
    mov rax,1   ;1表示write调用号
    mov rdi,1   ;1表示标准输出
    mov rsi,msg
    mov rdx,12  ;字符串长度
    syscall     ;系统调用 rax 调用号。rdi 参数1 rsi 参数2 rdx 参数3
    mov rax, 60 ;调用号 exit
    mov rdi,0 
    syscall
