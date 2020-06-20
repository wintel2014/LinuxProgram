//long mov(long* src, long* dest);

.file "mov.S"
.text
.globl mov
.type mov,@function
.align 16
mov:
#if 1
    movdqa (%rdi), %xmm0 #mov double quad-word ->2*4*16=128bit
    movdqa  %xmm0, (%rsi)
#else
    movdqu (%rdi), %xmm0
    movdqu  %xmm0, (%rsi)
#endif
    ret


.size mov,.-mov

/* Mark that we don't need executable stack.  */
.section .note.GNU-stack,"",%progbits
