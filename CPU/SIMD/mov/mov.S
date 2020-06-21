//long mov(long* src, long* dest);

.file "mov.S"
.text
.globl mova
.type mova,@function
.align 16
mova:
    movdqa (%rdi), %xmm0 #mov double quad-word ->2*4*16=128bit
    movdqa  %xmm0, (%rsi)
    ret

.globl movu
.type movu,@function
.align 16
movu:
    movdqu (%rdi), %xmm0
    movdqu  %xmm0, (%rsi)
    ret

.globl movnt
.type movnt,@function
.align 16
movnt:
    vmovntdqa (%rdi), %xmm0
    vmovntdq  %xmm0, (%rsi)
    vmovntdqa 16(%rdi), %xmm0
    vmovntdq  %xmm0, (%rsi)
    ret
.size movnt,.-movnt



/* Mark that we don't need executable stack.  */
.section .note.GNU-stack,"",%progbits
