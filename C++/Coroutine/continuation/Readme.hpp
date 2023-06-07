

template< typename Record, typename StackAlloc, typename Fn >
fcontext_t create_context1( StackAlloc salloc, Fn && fn) {
    auto sctx = salloc.allocate();
    // reserve space for control structure
	  void * storage = reinterpret_cast< void * >((reinterpret_cast< uintptr_t >( sctx.sp) - static_cast< uintptr_t >( sizeof( Record) ) ) & ~static_cast< uintptr_t >( 0xff) );
    // placment new for control structure on context stack
    Record * record = new ( storage) Record{ sctx, salloc, std::forward< Fn >( fn) };
    // 64byte gab between control structure and stack top. should be 16byte aligned
    void * stack_top = reinterpret_cast< void * >(reinterpret_cast< uintptr_t >( storage) - static_cast< uintptr_t >( 64) );
    void * stack_bottom = reinterpret_cast< void * >(reinterpret_cast< uintptr_t >( sctx.sp) - static_cast< uintptr_t >( sctx.size) );
    // create fast-context
    const std::size_t size = reinterpret_cast< uintptr_t >( stack_top) - reinterpret_cast< uintptr_t >( stack_bottom);
    const fcontext_t fctx = make_fcontext( stack_top, size, & context_entry< Record >);
    BOOST_ASSERT( nullptr != fctx);
    // transfer control structure to context-stack
    return jump_fcontext( fctx, record).fctx;
}

ptype fcontext_t
type = void *
(gdb) p sctx
$5 = {
  size = 65536,
  sp = 0x626e70
}

(gdb) p stack_bottom
$2 = (void *) 0x616e70
(gdb) p stack_top
$1 = (void *) 0x626dc0
(gdb) p/x size
$4 = 0xff50
(gdb) p storage
$6 = (void *) 0x626e00

(gdb) p fctx
$10 = (const boost::context::detail::fcontext_t) 0x626d80
(gdb) x/12gx 0x626d80
0x626d80:       0x0000037f00001f80      0x0000000000000000
0x626d90:       0x0000000000000000      0x0000000000000000
0x626da0:       0x0000000000000000      0x000000000040130c  <---context_entry
0x626db0:       0x0000000000401c0f      0x0000000000401c0c


=> 0x0000000000401245 <+220>:   mov    -0x60(%rbp),%rax
   0x0000000000401249 <+224>:   lea    0xbc(%rip),%rdx        # 0x40130c <boost::context::detail::context_entry<boost::context::detail::record<boost::context::continuation, 
                                                                          boost::context::basic_fixedsize_stack<boost::context::stack_traits>, main()::<lambda(boost::context::continuation&&)>>>(boost::context::detail::transfer_t)>
   0x0000000000401250 <+231>:   mov    %rcx,%rsi
   0x0000000000401253 <+234>:   mov    %rax,%rdi
   0x0000000000401256 <+237>:   callq  0x401be0 <make_fcontext>


fcontext is used to store the coroutine's context, 56 byte (mxcsr/fnstcw, r12-15, rbx, rbp). RIP is pushed by (call jump_fcontext)
make_fcontext: initialize the fcontext on "stack_top". the fcontext is used for new cotoutine. (entry point is set to context_entry<T>)
jump_fcontext: save fcontext to curent rsp, and restore the prevoius fcontext from argument of "fctx", and jump to "fctx" (target rip = fctx+0x38).


                                        make_fcontext( stack_top, size, &context_entry< Record >);          jump_fcontext( fctx, record).fctx
                                                          rdi      rsi          rdx                                         rdi    rsi

/*
                     _____________
 Low                |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
     sctx.size=128K |_____________|
   stack_bottom --> |             |
                    |             |
                    |             |
                    |_____________|
                    |mxcsr/fnstcw |  <---- rax = (stack_top& ~0xFF)-0x40   fctx=rax !!!             <------------------ restore contex from previous stack            
                    |             |  <---- 0x8(rax)
                    |             |
                    |             |
                    |context_entry|  <---- 0x28(rax)                                                 <------------------ mov    0x28(%rsp),%rbx(contex_entry is here for new fcontext)
                    |  0x08(rip)  |  <---- 0x30(rax)  xor    %rdi,%rdi; callq  0x400db0 <_exit@plt>
                    |__0x10(rip)__|  <---- 0x38(rax)  push   %rbp; jmpq *%rbx                        <------------------ mov    0x38(%rsp),%r8; mov %rsi,%rdx; mov %rax,%rdi; jmpq  *%r8
      stack_top --> |             |                                                                                                                       resume to the previous task
                    |   64Byte    |
                    |_____________|
        storage --> |             |
                    |   Record    |
        sctx.sp --> |_____________|
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |             |
                    |mxcsr/fnstcw | <--------------------------------------------------------------------------------------rsp-=0x38  rax = rsp(return value1)
                    |    r12      | <--------------------------------------------------------------------------------------8(rsp)
                    |    r13      |
                    |    r14      |
                    |    r15      |
                    |    rbx      |
                    |____rbp______| <--------------------------------------------------------------------------------------0x30(rsp)
                    |    RIP      | <--------------------------------------------------------------------------------------origin rsp(schedule from, e.g 0x7fffffffe258 for main thread)
High                |_____________|                                                                                        RIP is pushed by call jump_fcontext

            


Dump of assembler code for function make_fcontext:
=> 0x0000000000401be0 <+0>:     mov    %rdi,%rax
   0x0000000000401be3 <+3>:     and    $0xfffffffffffffff0,%rax
   0x0000000000401be7 <+7>:     lea    -0x40(%rax),%rax
   0x0000000000401beb <+11>:    mov    %rdx,0x28(%rax)
   0x0000000000401bef <+15>:    stmxcsr (%rax)
   0x0000000000401bf2 <+18>:    fnstcw 0x4(%rax)
   0x0000000000401bf5 <+21>:    lea    0x10(%rip),%rcx        # 0x401c0c <make_fcontext+44>
   0x0000000000401bfc <+28>:    mov    %rcx,0x38(%rax)
   0x0000000000401c00 <+32>:    lea    0x8(%rip),%rcx        # 0x401c0f <make_fcontext+47>
   0x0000000000401c07 <+39>:    mov    %rcx,0x30(%rax)
   0x0000000000401c0b <+43>:    retq
   0x0000000000401c0c <+44>:    push   %rbp
   0x0000000000401c0d <+45>:    jmpq   *%rbx
   0x0000000000401c0f <+47>:    xor    %rdi,%rdi
   0x0000000000401c12 <+50>:    callq  0x400db0 <_exit@plt>



Dump of assembler code for function jump_fcontext:
=> 0x0000000000401c20 <+0>:     lea    -0x38(%rsp),%rsp                              //store context to current RSP. RIP is pushed into 0x38(%rsp) by "call jump_fcontext"
   0x0000000000401c25 <+5>:     stmxcsr (%rsp)
   0x0000000000401c29 <+9>:     fnstcw 0x4(%rsp)
   0x0000000000401c2d <+13>:    mov    %r12,0x8(%rsp)
   0x0000000000401c32 <+18>:    mov    %r13,0x10(%rsp)
   0x0000000000401c37 <+23>:    mov    %r14,0x18(%rsp)
   0x0000000000401c3c <+28>:    mov    %r15,0x20(%rsp)
   0x0000000000401c41 <+33>:    mov    %rbx,0x28(%rsp)
   0x0000000000401c46 <+38>:    mov    %rbp,0x30(%rsp)
   0x0000000000401c4b <+43>:    mov    %rsp,%rax
   0x0000000000401c4e <+46>:    mov    %rdi,%rsp                                   // rsp points to ftx since now
   0x0000000000401c51 <+49>:    mov    0x38(%rsp),%r8                              //ftx[0x38] contains the RIP of previous task
   0x0000000000401c56 <+54>:    ldmxcsr (%rsp)                                     //restore previous context
   0x0000000000401c5a <+58>:    fldcw  0x4(%rsp)
   0x0000000000401c5e <+62>:    mov    0x8(%rsp),%r12
   0x0000000000401c63 <+67>:    mov    0x10(%rsp),%r13
   0x0000000000401c68 <+72>:    mov    0x18(%rsp),%r14
   0x0000000000401c6d <+77>:    mov    0x20(%rsp),%r15
   0x0000000000401c72 <+82>:    mov    0x28(%rsp),%rbx
   0x0000000000401c77 <+87>:    mov    0x30(%rsp),%rbp
   0x0000000000401c7c <+92>:    lea    0x40(%rsp),%rsp
   0x0000000000401c81 <+97>:    mov    %rsi,%rdx
   0x0000000000401c84 <+100>:   mov    %rax,%rdi
   0x0000000000401c87 <+103>:   jmpq   *%r8


*/
