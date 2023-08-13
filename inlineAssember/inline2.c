#include <stdio.h>
int a = 12;
int b = 13;
int bsum;

// asm (
//     assembler code
//     : output oprands
//     : input operands
//     : list of clobbered registers
//     );
//     寄存器映射
//     a -> rax,eax,ax,al
//     b -> rbx,ebx,bx,bl
//     c -> rcx,ecx,cx,cl
//     d -> rdx,edx,dx,dl
//     S -> rsi,esi,si
//     D -> rdi,edi,di
//     r -> any register
int main(void) {
  printf("The global variables are %d and %d\n", a, b);
  __asm__(".intel_syntax noprefix\n"
          "mov rax,a\n"
          "add rax,b\n"
          "mov bsum,rax \n" ::
              : "rax");
  printf("The extended inline sum of global variables is %d.\n\n", bsum);

  int x = 14, y = 16, esum, eproduct, edif;
  printf("The local variables are %d and %d\n", x, y);
  __asm__(".intel_syntax noprefix;"
          "mov rax,rdx;"
          "add rax,rcx;"
          : "=a"(esum)
          : "d"(x), "c"(y));
  printf("The extended inline sum is %d.\n", esum);
  __asm__(".intel_syntax noprefix;"
          "mov rbx,rdx;"
          "imul rbx,rcx;"
          "mov rax,rbx;"
          : "=a"(eproduct)
          : "d"(x), "c"(y)
          : "rbx");
  printf("The extended inline product is %d.\n", eproduct);

  __asm__(".intel_syntax noprefix;"
          "mov rax,rdx;"
          "sub rax,rcx;"
          : "=a"(edif)
          : "d"(x), "c"(y));
  printf("The extended inline asm difference is %d.\n", edif);
}