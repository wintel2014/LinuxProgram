.file "restore_stack.S"
.text
.globl restore_stack
.type restore_stack,@function
.align 16
restore_stack:
    pop %rdi
    movq (%rsp), %rsp
    jmpq *%rdi
    

.size restore_stack,.-restore_stack

/* Mark that we don't need executable stack.  */
.section .note.GNU-stack,"",%progbits
