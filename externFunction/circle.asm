extern pi
section .data
section .bss
section .text
;--------------------------
global c_area
c_area:
    push rbp
    mov rbp,rsp
    movsd xmm1,[pi]
    mulsd xmm0,xmm0
    mulsd xmm0,xmm1
    leave
    ret
;-----------------------
global c_circum
c_circum:
    push rbp
    mov rbp,rsp
    movsd xmm1,[pi]
    addsd xmm0,xmm0
    mulsd xmm0,xmm1
    leave
    ret
