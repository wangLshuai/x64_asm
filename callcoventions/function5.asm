;调用约定规定传参方法，linux使用system v 调用约定https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf
;非浮点数
; 第一个参数rdi
; 第二个参数rsi
; 第三个参数rdx
; 第四个参数rcx
; 第五个参数r8
; 第六个参数r9
; 更多的参数通过反向压栈传递
; 压入第十个参数 压入第九个参数 压入第八个参数 压入第七个参数
; 浮点数通过xmm寄存器传递
; 第一个参数放在xmm0
; 第二个参数放在xmm1
; ............
; 第八个参数放在xmm8
; 更多参数通过栈传递
extern printf
section .data
    first   db "A",0
    second  db "B",0
    third   db "C",0
    fourth   db "D",0
    fifth   db "E",0
    sixth   db "F",0
    seventh db "G",0
    eighth  db "H",0
    ninth   db "I",0
    tenth   db "J",0
    fmt1    db "The string is: %s%s%s%s%s%s%s%s%s%s",10,0
    fmt2    db "PI = %f",10,0
    pi      dq 3.14
section .bss
section .text
global main
main:
    push rbp
    mov rbp,rsp
    mov rdi,fmt1
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
    mov rax,0
    call printf
    and rsp,0xfffffffffffffff0 ;16字节对齐
    movsd xmm0,[pi]
    mov rax,1
    mov rdi,fmt2
    call printf

    leave
    ret