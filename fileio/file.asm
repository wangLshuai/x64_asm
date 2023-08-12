section .data
    CREATE  equ 1
    OVERWRITE   equ 1
    APPEND  equ 1
    O_WRITE equ 1
    READ    equ 1
    O_READ  equ 1
    DELETE  equ 1
;系统调用号
    NR_read     equ 0
    NR_write    equ 1
    NR_open     equ 2
    NR_close    equ 3
    NR_lseek    equ 8
    NR_create   equ 85
    NR_unlink   equ 87
;创建和状态标志
    O_CREATE    equ 00000100q
    O_APPEND    equ 00002000q
;访问模式
    O_RDONLY    equ 000000q
    O_WRONLY    equ 000001q
    O_RDWR      equ 000002q
;创建模式
    S_IRUSR     equ 00400q  ;用户读取权限
    S_IWUSR     equ 00200q  ;用户写入权限

    NL      equ 0xa
    bufferlen   equ 64
    fileName db "testfile.txt",0
    FD  dq 0    ;文件描述符

    text1   db "1. Hello...to everyone!",NL,0
    len1    dq $-text1-1
    text2   db "2. Here I am!",NL,0
    len2   dq $-text2-1
    text3   db "3. Alife and kicking!",NL,0
    len3    dq $-text3-1
    text4   db "Adios !!!",NL,0
    len4    dq $-text4-1

    error_Create    db "error creating file",NL,0
    error_Close     db "error closing file",NL,0
    error_Write     db "error writing to file",NL,0
    error_Open      db "error opening to file",NL,0
    error_Append    db "error appending to file",NL,0
    error_Delete    db "error deleting file",NL,0
    error_Read      db "error reading file",NL,0
    error_Print     db "error printing string",NL,0
    error_Position  db "error positioning in file",NL,0

    success_Create  db "File created and opened",NL,0
    success_Close   db "File closed",NL,0
    success_Write  db "Written to file",NL,0
    success_Open    db "File opened for R/W",NL,0
    success_Append  db "File opened for appending",NL,0
    success_Delete  db "File deleted",NL,0
    success_Read    db "Reading file",NL,0
    success_Position db "Positioned in file",NL,0

section .bss
    buffer resb bufferlen
section .text
    global main
main:
    push rbp
    mov rbp,rsp
%IF CREATE
    ;创建并打开文件，然后关闭
    mov rdi,fileName
    call createFile
    mov [FD],rax
    ;写入
    mov rdi,[FD]
    mov rsi,text1
    mov rdx,[len1]
    call writeFile
    ;关闭
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF OVERWRITE
    mov rdi,fileName
    call openFile
    mov [FD],rax
    ;写入
    mov rdi,[FD]
    mov rsi,text2
    mov rdx,[len2]
    call writeFile
    ;关闭
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF APPEND
    mov rdi,fileName
    call appendFile
    mov [FD],rax
    mov rdi,[FD]
    mov rsi,text3
    mov rdx,[len3]
    call writeFile
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF O_WRITE
    mov rdi,fileName
    call openFile
    mov [FD],rax
    mov rdi,[FD]
    mov rsi,[len2]
    mov rdx,0     ; SEEK_SET
    call positionFile
    mov rdi,[FD]
    mov rsi,text4
    mov rdx,[len4]
    call writeFile
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF READ
    mov rdi,fileName
    call openFile
    mov [FD],rax
    mov rdi,[FD]
    mov rsi,buffer
    mov rdx,bufferlen
    call readFile
    mov rdi,rax
    call printString
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF O_READ
    mov rdi,fileName
    call openFile
    mov [FD],rax
    mov rdi,[FD]
    mov rsi,[len2]
    mov rdx,0
    call positionFile
    mov rdi,[FD]
    mov rsi,buffer
    mov rdx,bufferlen
    call readFile
    mov rdi,rax
    call printString
    mov rdi,[FD]
    call closeFile
%ENDIF
%IF DELETE
    mov rdi,fileName
    call deleteFile
%ENDIF
    leave
    ret

;-------------------------------------
printString:
    push rbp
    mov rbp,rsp
    push r12
    mov r12,rdi
    xor rdx,rdx
.strLoop:
    mov al,[r12]
    cmp al,0
    je .done
    inc rdx
    inc r12
    jmp .strLoop

.done:
    pop r12
    mov rax,1
    mov rsi,rdi
    mov rdi,1
    syscall
    leave
    ret
;------------------------
deleteFile:
    mov rax,NR_unlink
    syscall
    cmp rax,0
    jl .deleteerror
    mov rdi,success_Delete
    call printString
    ret
.deleteerror:
    mov rdi,error_Delete
    call printString
    ret
;------------------------
readFile:
    mov rax,NR_read
    syscall
    cmp rax,0
    jl .readFileerror
    mov byte [rsi+rax],0
    ; mov rax,rsi
    push rsi
    mov rdi,success_Read
    call printString
    pop rax
    ret
.readFileerror:
    mov rdi,error_Read
    call printString
    mov byte [rsi],0
    mov rax,rsi
    ret
;---------------------------
positionFile:
    mov rax,NR_lseek
    syscall
    cmp rax,0
    push rax
    jl .positionFileerror
    mov rdi,success_Position
    call printString
    pop rax
    ret
.positionFileerror:
    mov rdi,error_Position
    call printString
    pop rax
    ret
;-----------------------
appendFile:
    mov rax,NR_open
    mov rsi,O_RDWR | O_APPEND
    syscall
    cmp rax,0
    push rax
    jl .appendfileerror
    mov rdi,success_Append
    call printString
    pop rax
    ret
.appendfileerror:
    mov rdi,error_Append
    call printString
    pop rax 
    ret
;-------------------------------
openFile:
    mov rax,NR_open
    mov rsi,O_RDWR
    syscall
    cmp rax,0
    push rax
    jl .openerror
    mov rdi,success_Open
    call printString
    pop rax
    ret
.openerror:
    mov rdi,error_Open
    call printString
    pop rax
    ret
;----------------------------------
createFile:
    mov rax,NR_create
    mov rsi,S_IRUSR | S_IWUSR
    syscall
    cmp rax,0
    jl .createerror
    mov rdi,success_Create
    push rax
    call printString
    pop rax
    ret
.createerror:
    mov rdi,error_Create
    call printString
    ret
;---------------------------------
writeFile:
    mov rax,NR_write
    syscall
    cmp rax,0
    jl .writeerror
    mov rdi,success_Write
    push rax
    call printString
    pop rax
    ret
.writeerror:
    mov rdi,error_Write
    call printString
    ret

closeFile:
    mov rax,NR_close
    syscall
    cmp rax,0
    jl .closeerror
    mov rdi,success_Close
    push rax
    call printString
    pop rax
    ret
.closeerror:
    mov rdi,error_Close
    push rax
    call printString
    pop rax
    ret

