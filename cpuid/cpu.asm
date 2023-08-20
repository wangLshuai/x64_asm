; eax赋值 调用cpuid指令，结果保存在edx,ecx中
; ecx 的0，19，20.edx 的25 26说明处理器支持的sse版本
extern printf
section .data
    fmt_no_sse      db "This cpu does not support SSE",10,0
    fmt_sse42       db "This cpu supports SSE 4.2",10,0
    fmt_sse41       db "This cpu supports SSE 4.1",10,0
    fmt_ssse3       db "This cpu supports SSSE 3",10,0
    fmt_sse3        db "This cpu supports SSE 3",10,0
    fmt_sse2        db "This cpu supports SSE 2",10,0
    fmt_sse         db "This cpu supports SSE",10,0
section .bss
section .text
    global main

main:
    push rbp
    mov rbp,rsp
    call cpu_sse
    leave
    ret

cpu_sse:
    push rbp
    mov rbp,rsp
    xor r12,r12
    mov eax,1
    cpuid
    test edx,1<<25  ;bit 25 (SSE)
    jz fmt_sse2
    xor rax,rax
    mov rdi,fmt_sse
    push rcx
    push rdx
    call printf
    pop rdx
    pop rcx
sse2:
    test edx,1<<26 ; bit 26 sse 2
    jz sse3
    mov r12,1
    xor rax,rax
    mov rdi,fmt_sse2
    push rcx
    push rdx
    call printf
    pop rdx
    pop rcx
sse3:
    test ecx,1  ;bit 0  sse3
    jz ssse3
    mov r12,1
    xor rax,rax
    mov rdi,fmt_sse3
    push rcx
    call printf
    pop rcx
ssse3:
    test ecx,9h
    jz sse41
    mov r12,1
    mov rdi,fmt_ssse3
    xor rax,rax
    push rcx
    call printf
    pop rcx
sse41:
    test ecx,1<<19
    jz sse42 
    mov r12,1
    xor rax,rax
    mov rdi,fmt_sse41
    push rcx
    call printf
    pop rcx
sse42:
    test ecx,1<<20
    jz wrapup
    mov r12,1
    xor rax,rax
    mov rdi,fmt_sse42
    call printf
wrapup:
    cmp r12,1
    je sse_ok
    mov rdi,fmt_no_sse
    xor rax,rax
    call printf
    jmp exit
sse_ok:
    mov rax,r12
exit:
    leave
    ret