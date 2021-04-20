#include <stdio.h>
#include <sys/mman.h>

int main()
{
  char* c = (char*) mmap(nullptr, 7, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

  c[0] = 0b11000111; //0xc7 mov
  c[1] = 0b11000000; //0xc0
  //c[2] = ImmediateNumber
  c[6] = 0b11000011; //ret

  for(c[2]=0; c[2]<10; c[2]++)
  {
    printf("%d ", ((int(*)(void))c) ());
  }
  printf("\n");
}
/*
Dump of assembler code from 0x7ffff7ff7000 to 0x7ffff7ff7010:
=> 0x00007ffff7ff7000:  mov    $0x0,%eax
   0x00007ffff7ff7006:  retq
(gdb) x/7bx 0x00007ffff7ff7000
0x7ffff7ff7000: 0xc7    0xc0    0x00    0x00    0x00    0x00    0xc3


(gdb) disassemble 0x00007ffff7ff7000,+16
Dump of assembler code from 0x7ffff7ff7000 to 0x7ffff7ff7010:
=> 0x00007ffff7ff7000:  mov    $0x2,%eax
   0x00007ffff7ff7006:  retq
Breakpoint 2, 0x00007ffff7ff7000 in ?? ()
(gdb) x/7bx 0x00007ffff7ff7000
0x7ffff7ff7000: 0xc7    0xc0    0x02    0x00    0x00    0x00    0xc3

*/
