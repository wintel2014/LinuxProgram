.file "switch_stack.S"
.text
.globl switch_stack
.type switch_stack,@function
.align 16
switch_stack:
    movq %rsp, (%rdi)
    movq %rdi, %rsp
    movq (%rdi), %rdi
    movq (%rdi), %rdi
    jmpq *%rdi


.size switch_stack,.-switch_stack

/* Mark that we don't need executable stack.  */
.section .note.GNU-stack,"",%progbits
