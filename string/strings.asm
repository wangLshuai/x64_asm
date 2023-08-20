extern printf
section .data
    string1     db "This is the 1st string.",10,0
    string2     db "This is the 2nd string.",10,0
    strlen2    equ $-string2-2
    string21    db "Comparing strings:The strings do not differ.",10,0
    string22    db "Comparing strings:The strings differ, starting at position: %d.",10,0
    string3     db "The quick brown fox jumps over the lazy dog.",0
    strlen3     equ $-string3-2
    string33    db "Now look at this string: %s",10,0
    string4     db "z",0
    string44    db "The character '%s' was found ast position: %d.",10,0
    string45    db "The character '%s' was not found.",10,0
    string46    db "Scanning for the character '%s'.",10,0
section .bss
section .text
    global main
main:
    push rsp
    mov rbp,rsp
    xor rax,rax
    mov rdi,string1
    call printf
    mov rdi,string2
    call printf
;
    lea rdi,[string1]
    lea rsi,[string2]
    mov rdx,strlen2
    call compare1
    cmp rax,0
    jnz not_eaual1
    mov rdi,string21
    call printf
    jmp otherversion
not_eaual1:
    mov rdi,string22
    mov rsi,rax
    xor rax,rax
    call printf
otherversion:
    lea rdi,[string1]
    lea rsi,[string2]
    mov rdx,strlen2
    call compare2
    cmp rax,0
    jnz not_equal2
    mov rdi,string21
    call printf
    jmp scanning
not_equal2:
    mov rdi,string22
    mov rsi,rax
    xor rax,rax
    call printf
scanning:
    mov rdi,string33
    mov rsi,string3
    xor rax,rax
    call printf

    mov rdi,string46
    mov rsi,string4
    xor rax,rax
    call printf
    lea rdi,[string3]
    lea rsi,[string4]
    mov rdx,strlen3
    call cscan
    cmp rax,0
    jz char_not_found
    mov rdi,string44
    mov rsi,string4
    mov rdx,rax
    xor rax,rax
    call printf
    jmp exit
char_not_found:
    mov rdi,string45
    mov rsi,string4
    xor rax,rax

exit:
    leave
    ret

;-------------------------------------
compare1:
    mov rcx,rdx
    cld ;clear df
cmpr:
    cmpsb
    jne notequal
    loop cmpr
    xor rax,rax
    ret
notequal:
    mov rax,strlen2
    sub rax,rcx
    ret
;------------------------------------------
compare2:
    mov rcx,rdx
    cld
    repe cmpsb  ;if eauall repeate
    je equal12
    mov rax,strlen2
    inc rcx
    sub rax,rcx
    ret
equal12:
    xor rax,rax
    ret
;--------------------------------------------
cscan:
    mov rcx,rdx
    lodsb      ;al = [rsi]
    cld
    repne scasb  ;al == [rdi]
    jne char_notfound
    mov rax,strlen3
    sub rax,rcx
    ret
char_notfound:
    xor rax,rax
    ret
