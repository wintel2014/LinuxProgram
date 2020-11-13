#include <stdio.h>
/*
Dump of assembler code for function main():
   0x00000000000007fa <+0>:     push   %rbp
   0x00000000000007fb <+1>:     mov    %rsp,%rbp
   0x00000000000007fe <+4>:     sub    $0x10,%rsp
   0x0000000000000802 <+8>:     nopl   0x0(%rax,%rax,1)  //opcode is 0x0F1F440000
   0x0000000000000807 <+13>:    nopl   0x0(%rax,%rax,1)
   0x000000000000080c <+18>:    nopl   0x0(%rax,%rax,1)
   0x0000000000000811 <+23>:    nopl   0x0(%rax,%rax,1)
   0x0000000000000816 <+28>:    nopl   0x0(%rax,%rax,1)
   0x000000000000081b <+33>:    nopl   0x0(%rax,%rax,1)
   0x0000000000000820 <+38>:    nopl   0x0(%rax,%rax,1)
   0x0000000000000825 <+43>:    nopl   0x0(%rax,%rax,1)
   0x000000000000082a <+48>:    nopl   0x0(%rax,%rax,1)
  ........
End of assembler dump.
(gdb) x/5bx 0x0000000000000802
0x802 <main()+8>:       0x0f    0x1f    0x44    0x00    0x00

*/

// Inset 5-byte noll instruction 
// Add File/Line/Func into section NOOPDESC in address [__start_NOOPDESC, __stop_NOOPDESC]
#define INSERT_NOOP_IMPL(LINE) \
asm __volatile__(                                \
  ".byte 0x0F, 0x1F, 0x44, 0x00, 0x00\n"         \
  ".pushsection NOOPDESC, \"wa?\", @progbits \n" \
  ".quad %P[File]\n"                             \
  ".quad %P[Line]\n"                             \
  ".quad %P[Func]\n"                             \
  ".popsection\n"                                \
  :                                              \
  : [File] "i" (__FILE__),                       \
    [Line] "i" (LINE),                           \
    [Func] "i" (__PRETTY_FUNCTION__) :"flags"    \
)
struct NOOPDESC
{
    const char* mFileName;
    long int mLine;
    const char* mFunc;
};

//Section range are generated automatically by compiler
extern struct NOOPDESC __start_NOOPDESC;
extern struct NOOPDESC __stop_NOOPDESC;

//in case "30" is extended into macro
#define INSERT_NOOP() INSERT_NOOP_IMPL(__LINE__)
int main()
{
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    INSERT_NOOP();
    struct NOOPDESC *iter = &__start_NOOPDESC;
    for ( ; iter < &__stop_NOOPDESC; ++iter) {
           printf("%s %ld\n", iter->mFileName, iter->mLine);
    }
}

