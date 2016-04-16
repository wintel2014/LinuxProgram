
stack:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x2e3>
  400248:	78 38                	js     400282 <_init-0x2d6>
  40024a:	36                   	ss
  40024b:	2d 36 34 2e 73       	sub    $0x732e3436,%eax
  400250:	6f                   	outsl  %ds:(%rsi),(%dx)
  400251:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.ABI-tag:

0000000000400254 <.note.ABI-tag>:
  400254:	04 00                	add    $0x0,%al
  400256:	00 00                	add    %al,(%rax)
  400258:	10 00                	adc    %al,(%rax)
  40025a:	00 00                	add    %al,(%rax)
  40025c:	01 00                	add    %eax,(%rax)
  40025e:	00 00                	add    %al,(%rax)
  400260:	47                   	rex.RXB
  400261:	4e 55                	rex.WRX push %rbp
  400263:	00 00                	add    %al,(%rax)
  400265:	00 00                	add    %al,(%rax)
  400267:	00 02                	add    %al,(%rdx)
  400269:	00 00                	add    %al,(%rax)
  40026b:	00 06                	add    %al,(%rsi)
  40026d:	00 00                	add    %al,(%rax)
  40026f:	00 18                	add    %bl,(%rax)
  400271:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000400274 <.note.gnu.build-id>:
  400274:	04 00                	add    $0x0,%al
  400276:	00 00                	add    %al,(%rax)
  400278:	14 00                	adc    $0x0,%al
  40027a:	00 00                	add    %al,(%rax)
  40027c:	03 00                	add    (%rax),%eax
  40027e:	00 00                	add    %al,(%rax)
  400280:	47                   	rex.RXB
  400281:	4e 55                	rex.WRX push %rbp
  400283:	00 ad a9 b7 00 99    	add    %ch,-0x66ff4857(%rbp)
  400289:	c7                   	(bad)  
  40028a:	aa                   	stos   %al,%es:(%rdi)
  40028b:	3d 42 55 41 62       	cmp    $0x62415542,%eax
  400290:	38 79 5a             	cmp    %bh,0x5a(%rcx)
  400293:	68 70 ba 84 48       	pushq  $0x4884ba70

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	02 00                	add    (%rax),%al
  40029a:	00 00                	add    %al,(%rax)
  40029c:	08 00                	or     %al,(%rax)
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
  4002a2:	00 00                	add    %al,(%rax)
  4002a4:	06                   	(bad)  
  4002a5:	00 00                	add    %al,(%rax)
  4002a7:	00 00                	add    %al,(%rax)
  4002a9:	00 10                	add    %dl,(%rax)
  4002ab:	00 00                	add    %al,(%rax)
  4002ad:	01 00                	add    %eax,(%rax)
  4002af:	00 08                	add    %cl,(%rax)
  4002b1:	00 00                	add    %al,(%rax)
  4002b3:	00 00                	add    %al,(%rax)
  4002b5:	00 00                	add    %al,(%rax)
  4002b7:	00 29                	add    %ch,(%rcx)
  4002b9:	45 d5                	rex.RB (bad) 
  4002bb:	4c                   	rex.WR

Disassembly of section .dynsym:

00000000004002c0 <.dynsym>:
	...
  4002d8:	10 00                	adc    %al,(%rax)
  4002da:	00 00                	add    %al,(%rax)
  4002dc:	20 00                	and    %al,(%rax)
	...
  4002ee:	00 00                	add    %al,(%rax)
  4002f0:	1f                   	(bad)  
  4002f1:	00 00                	add    %al,(%rax)
  4002f3:	00 20                	add    %ah,(%rax)
	...
  400305:	00 00                	add    %al,(%rax)
  400307:	00 81 00 00 00 12    	add    %al,0x12000000(%rcx)
	...
  40031d:	00 00                	add    %al,(%rax)
  40031f:	00 b0 00 00 00 12    	add    %dh,0x12000000(%rax)
	...
  400335:	00 00                	add    %al,(%rax)
  400337:	00 a3 00 00 00 12    	add    %ah,0x12000000(%rbx)
	...
  40034d:	00 00                	add    %al,(%rax)
  40034f:	00 33                	add    %dh,(%rbx)
  400351:	00 00                	add    %al,(%rax)
  400353:	00 20                	add    %ah,(%rax)
	...
  400365:	00 00                	add    %al,(%rax)
  400367:	00 4f 00             	add    %cl,0x0(%rdi)
  40036a:	00 00                	add    %al,(%rax)
  40036c:	20 00                	and    %al,(%rax)
	...
  40037e:	00 00                	add    %al,(%rax)
  400380:	69 00 00 00 12 00    	imul   $0x120000,(%rax),%eax
  400386:	00 00                	add    %al,(%rax)
  400388:	d0 05 40 00 00 00    	rolb   0x40(%rip)        # 4003ce <_init-0x18a>
	...

Disassembly of section .dynstr:

0000000000400398 <.dynstr>:
  400398:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  40039c:	73 74                	jae    400412 <_init-0x146>
  40039e:	64 63 2b             	movslq %fs:(%rbx),%ebp
  4003a1:	2b 2e                	sub    (%rsi),%ebp
  4003a3:	73 6f                	jae    400414 <_init-0x144>
  4003a5:	2e 36 00 5f 5f       	cs add %bl,%cs:%ss:0x5f(%rdi)
  4003aa:	67 6d                	insl   (%dx),%es:(%edi)
  4003ac:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003ad:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003ae:	5f                   	pop    %rdi
  4003af:	73 74                	jae    400425 <_init-0x133>
  4003b1:	61                   	(bad)  
  4003b2:	72 74                	jb     400428 <_init-0x130>
  4003b4:	5f                   	pop    %rdi
  4003b5:	5f                   	pop    %rdi
  4003b6:	00 5f 4a             	add    %bl,0x4a(%rdi)
  4003b9:	76 5f                	jbe    40041a <_init-0x13e>
  4003bb:	52                   	push   %rdx
  4003bc:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%ebx),%esi
  4003c3:	43 6c 
  4003c5:	61                   	(bad)  
  4003c6:	73 73                	jae    40043b <_init-0x11d>
  4003c8:	65                   	gs
  4003c9:	73 00                	jae    4003cb <_init-0x18d>
  4003cb:	5f                   	pop    %rdi
  4003cc:	49 54                	rex.WB push %r12
  4003ce:	4d 5f                	rex.WRB pop %r15
  4003d0:	64                   	fs
  4003d1:	65                   	gs
  4003d2:	72 65                	jb     400439 <_init-0x11f>
  4003d4:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  4003db:	4d 
  4003dc:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  4003de:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003df:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003e0:	65                   	gs
  4003e1:	54                   	push   %rsp
  4003e2:	61                   	(bad)  
  4003e3:	62                   	(bad)  
  4003e4:	6c                   	insb   (%dx),%es:(%rdi)
  4003e5:	65 00 5f 49          	add    %bl,%gs:0x49(%rdi)
  4003e9:	54                   	push   %rsp
  4003ea:	4d 5f                	rex.WRB pop %r15
  4003ec:	72 65                	jb     400453 <_init-0x105>
  4003ee:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  4003f5:	4d 
  4003f6:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  4003f8:	6f                   	outsl  %ds:(%rsi),(%dx)
  4003f9:	6e                   	outsb  %ds:(%rsi),(%dx)
  4003fa:	65                   	gs
  4003fb:	54                   	push   %rsp
  4003fc:	61                   	(bad)  
  4003fd:	62                   	(bad)  
  4003fe:	6c                   	insb   (%dx),%es:(%rdi)
  4003ff:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
  400403:	4e 53                	rex.WRX push %rbx
  400405:	74 38                	je     40043f <_init-0x119>
  400407:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
  40040e:	65                   	gs
  40040f:	34 49                	xor    $0x49,%al
  400411:	6e                   	outsb  %ds:(%rsi),(%dx)
  400412:	69 74 44 31 45 76 00 	imul   $0x5f007645,0x31(%rsp,%rax,2),%esi
  400419:	5f 
  40041a:	5a                   	pop    %rdx
  40041b:	4e 53                	rex.WRX push %rbx
  40041d:	74 38                	je     400457 <_init-0x101>
  40041f:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
  400426:	65                   	gs
  400427:	34 49                	xor    $0x49,%al
  400429:	6e                   	outsb  %ds:(%rsi),(%dx)
  40042a:	69 74 43 31 45 76 00 	imul   $0x6c007645,0x31(%rbx,%rax,2),%esi
  400431:	6c 
  400432:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%rdx),%esp
  400439:	36 00 5f 5f          	add    %bl,%ss:0x5f(%rdi)
  40043d:	63 78 61             	movslq 0x61(%rax),%edi
  400440:	5f                   	pop    %rdi
  400441:	61                   	(bad)  
  400442:	74 65                	je     4004a9 <_init-0xaf>
  400444:	78 69                	js     4004af <_init-0xa9>
  400446:	74 00                	je     400448 <_init-0x110>
  400448:	5f                   	pop    %rdi
  400449:	5f                   	pop    %rdi
  40044a:	6c                   	insb   (%dx),%es:(%rdi)
  40044b:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  400452:	72 74                	jb     4004c8 <_init-0x90>
  400454:	5f                   	pop    %rdi
  400455:	6d                   	insl   (%dx),%es:(%rdi)
  400456:	61                   	(bad)  
  400457:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
  40045e:	43 5f                	rex.XB pop %r15
  400460:	32 2e                	xor    (%rsi),%ch
  400462:	32 2e                	xor    (%rsi),%ch
  400464:	35 00 47 4c 49       	xor    $0x494c4700,%eax
  400469:	42                   	rex.X
  40046a:	43 58                	rex.XB pop %r8
  40046c:	58                   	pop    %rax
  40046d:	5f                   	pop    %rdi
  40046e:	33 2e                	xor    (%rsi),%ebp
  400470:	34 00                	xor    $0x0,%al

Disassembly of section .gnu.version:

0000000000400472 <.gnu.version>:
  400472:	00 00                	add    %al,(%rax)
  400474:	00 00                	add    %al,(%rax)
  400476:	00 00                	add    %al,(%rax)
  400478:	02 00                	add    (%rax),%al
  40047a:	03 00                	add    (%rax),%eax
  40047c:	03 00                	add    (%rax),%eax
  40047e:	00 00                	add    %al,(%rax)
  400480:	00 00                	add    %al,(%rax)
  400482:	02 00                	add    (%rax),%al

Disassembly of section .gnu.version_r:

0000000000400488 <.gnu.version_r>:
  400488:	01 00                	add    %eax,(%rax)
  40048a:	01 00                	add    %eax,(%rax)
  40048c:	99                   	cltd   
  40048d:	00 00                	add    %al,(%rax)
  40048f:	00 10                	add    %dl,(%rax)
  400491:	00 00                	add    %al,(%rax)
  400493:	00 20                	add    %ah,(%rax)
  400495:	00 00                	add    %al,(%rax)
  400497:	00 75 1a             	add    %dh,0x1a(%rbp)
  40049a:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
  4004a0:	c2 00 00             	retq   $0x0
  4004a3:	00 00                	add    %al,(%rax)
  4004a5:	00 00                	add    %al,(%rax)
  4004a7:	00 01                	add    %al,(%rcx)
  4004a9:	00 01                	add    %al,(%rcx)
  4004ab:	00 01                	add    %al,(%rcx)
  4004ad:	00 00                	add    %al,(%rax)
  4004af:	00 10                	add    %dl,(%rax)
  4004b1:	00 00                	add    %al,(%rax)
  4004b3:	00 00                	add    %al,(%rax)
  4004b5:	00 00                	add    %al,(%rax)
  4004b7:	00 74 29 92          	add    %dh,-0x6e(%rcx,%rbp,1)
  4004bb:	08 00                	or     %al,(%rax)
  4004bd:	00 02                	add    %al,(%rdx)
  4004bf:	00 ce                	add    %cl,%dh
  4004c1:	00 00                	add    %al,(%rax)
  4004c3:	00 00                	add    %al,(%rax)
  4004c5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

00000000004004c8 <.rela.dyn>:
  4004c8:	f8                   	clc    
  4004c9:	0f 60 00             	punpcklbw (%rax),%mm0
  4004cc:	00 00                	add    %al,(%rax)
  4004ce:	00 00                	add    %al,(%rax)
  4004d0:	06                   	(bad)  
  4004d1:	00 00                	add    %al,(%rax)
  4004d3:	00 01                	add    %al,(%rcx)
	...

Disassembly of section .rela.plt:

00000000004004e0 <.rela.plt>:
  4004e0:	18 10                	sbb    %dl,(%rax)
  4004e2:	60                   	(bad)  
  4004e3:	00 00                	add    %al,(%rax)
  4004e5:	00 00                	add    %al,(%rax)
  4004e7:	00 07                	add    %al,(%rdi)
  4004e9:	00 00                	add    %al,(%rax)
  4004eb:	00 01                	add    %al,(%rcx)
	...
  4004f5:	00 00                	add    %al,(%rax)
  4004f7:	00 20                	add    %ah,(%rax)
  4004f9:	10 60 00             	adc    %ah,0x0(%rax)
  4004fc:	00 00                	add    %al,(%rax)
  4004fe:	00 00                	add    %al,(%rax)
  400500:	07                   	(bad)  
  400501:	00 00                	add    %al,(%rax)
  400503:	00 03                	add    %al,(%rbx)
	...
  40050d:	00 00                	add    %al,(%rax)
  40050f:	00 28                	add    %ch,(%rax)
  400511:	10 60 00             	adc    %ah,0x0(%rax)
  400514:	00 00                	add    %al,(%rax)
  400516:	00 00                	add    %al,(%rax)
  400518:	07                   	(bad)  
  400519:	00 00                	add    %al,(%rax)
  40051b:	00 04 00             	add    %al,(%rax,%rax,1)
	...
  400526:	00 00                	add    %al,(%rax)
  400528:	30 10                	xor    %dl,(%rax)
  40052a:	60                   	(bad)  
  40052b:	00 00                	add    %al,(%rax)
  40052d:	00 00                	add    %al,(%rax)
  40052f:	00 07                	add    %al,(%rdi)
  400531:	00 00                	add    %al,(%rax)
  400533:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 400539 <_init-0x1f>
  400539:	00 00                	add    %al,(%rax)
  40053b:	00 00                	add    %al,(%rax)
  40053d:	00 00                	add    %al,(%rax)
  40053f:	00 38                	add    %bh,(%rax)
  400541:	10 60 00             	adc    %ah,0x0(%rax)
  400544:	00 00                	add    %al,(%rax)
  400546:	00 00                	add    %al,(%rax)
  400548:	07                   	(bad)  
  400549:	00 00                	add    %al,(%rax)
  40054b:	00 08                	add    %cl,(%rax)
	...

Disassembly of section .init:

0000000000400558 <_init>:
  400558:	48 83 ec 08          	sub    $0x8,%rsp
  40055c:	48 8b 05 95 0a 20 00 	mov    0x200a95(%rip),%rax        # 600ff8 <_DYNAMIC+0x1e0>
  400563:	48 85 c0             	test   %rax,%rax
  400566:	74 05                	je     40056d <_init+0x15>
  400568:	e8 23 00 00 00       	callq  400590 <__gmon_start__@plt>
  40056d:	48 83 c4 08          	add    $0x8,%rsp
  400571:	c3                   	retq   

Disassembly of section .plt:

0000000000400580 <__gmon_start__@plt-0x10>:
  400580:	ff 35 82 0a 20 00    	pushq  0x200a82(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400586:	ff 25 84 0a 20 00    	jmpq   *0x200a84(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40058c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400590 <__gmon_start__@plt>:
  400590:	ff 25 82 0a 20 00    	jmpq   *0x200a82(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400596:	68 00 00 00 00       	pushq  $0x0
  40059b:	e9 e0 ff ff ff       	jmpq   400580 <_init+0x28>

00000000004005a0 <_ZNSt8ios_base4InitC1Ev@plt>:
  4005a0:	ff 25 7a 0a 20 00    	jmpq   *0x200a7a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4005a6:	68 01 00 00 00       	pushq  $0x1
  4005ab:	e9 d0 ff ff ff       	jmpq   400580 <_init+0x28>

00000000004005b0 <__libc_start_main@plt>:
  4005b0:	ff 25 72 0a 20 00    	jmpq   *0x200a72(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4005b6:	68 02 00 00 00       	pushq  $0x2
  4005bb:	e9 c0 ff ff ff       	jmpq   400580 <_init+0x28>

00000000004005c0 <__cxa_atexit@plt>:
  4005c0:	ff 25 6a 0a 20 00    	jmpq   *0x200a6a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  4005c6:	68 03 00 00 00       	pushq  $0x3
  4005cb:	e9 b0 ff ff ff       	jmpq   400580 <_init+0x28>

00000000004005d0 <_ZNSt8ios_base4InitD1Ev@plt>:
  4005d0:	ff 25 62 0a 20 00    	jmpq   *0x200a62(%rip)        # 601038 <_GLOBAL_OFFSET_TABLE_+0x38>
  4005d6:	68 04 00 00 00       	pushq  $0x4
  4005db:	e9 a0 ff ff ff       	jmpq   400580 <_init+0x28>

Disassembly of section .text:

00000000004005e0 <_start>:
  4005e0:	31 ed                	xor    %ebp,%ebp
  4005e2:	49 89 d1             	mov    %rdx,%r9
  4005e5:	5e                   	pop    %rsi
  4005e6:	48 89 e2             	mov    %rsp,%rdx
  4005e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4005ed:	50                   	push   %rax
  4005ee:	54                   	push   %rsp
  4005ef:	49 c7 c0 60 08 40 00 	mov    $0x400860,%r8
  4005f6:	48 c7 c1 f0 07 40 00 	mov    $0x4007f0,%rcx
  4005fd:	48 c7 c7 46 07 40 00 	mov    $0x400746,%rdi
  400604:	e8 a7 ff ff ff       	callq  4005b0 <__libc_start_main@plt>
  400609:	f4                   	hlt    
  40060a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400610 <deregister_tm_clones>:
  400610:	b8 57 10 60 00       	mov    $0x601057,%eax
  400615:	55                   	push   %rbp
  400616:	48 2d 50 10 60 00    	sub    $0x601050,%rax
  40061c:	48 83 f8 0e          	cmp    $0xe,%rax
  400620:	48 89 e5             	mov    %rsp,%rbp
  400623:	77 02                	ja     400627 <deregister_tm_clones+0x17>
  400625:	5d                   	pop    %rbp
  400626:	c3                   	retq   
  400627:	b8 00 00 00 00       	mov    $0x0,%eax
  40062c:	48 85 c0             	test   %rax,%rax
  40062f:	74 f4                	je     400625 <deregister_tm_clones+0x15>
  400631:	5d                   	pop    %rbp
  400632:	bf 50 10 60 00       	mov    $0x601050,%edi
  400637:	ff e0                	jmpq   *%rax
  400639:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400640 <register_tm_clones>:
  400640:	b8 50 10 60 00       	mov    $0x601050,%eax
  400645:	55                   	push   %rbp
  400646:	48 2d 50 10 60 00    	sub    $0x601050,%rax
  40064c:	48 c1 f8 03          	sar    $0x3,%rax
  400650:	48 89 e5             	mov    %rsp,%rbp
  400653:	48 89 c2             	mov    %rax,%rdx
  400656:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40065a:	48 01 d0             	add    %rdx,%rax
  40065d:	48 d1 f8             	sar    %rax
  400660:	75 02                	jne    400664 <register_tm_clones+0x24>
  400662:	5d                   	pop    %rbp
  400663:	c3                   	retq   
  400664:	ba 00 00 00 00       	mov    $0x0,%edx
  400669:	48 85 d2             	test   %rdx,%rdx
  40066c:	74 f4                	je     400662 <register_tm_clones+0x22>
  40066e:	5d                   	pop    %rbp
  40066f:	48 89 c6             	mov    %rax,%rsi
  400672:	bf 50 10 60 00       	mov    $0x601050,%edi
  400677:	ff e2                	jmpq   *%rdx
  400679:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400680 <__do_global_dtors_aux>:
  400680:	80 3d c9 09 20 00 00 	cmpb   $0x0,0x2009c9(%rip)        # 601050 <__TMC_END__>
  400687:	75 11                	jne    40069a <__do_global_dtors_aux+0x1a>
  400689:	55                   	push   %rbp
  40068a:	48 89 e5             	mov    %rsp,%rbp
  40068d:	e8 7e ff ff ff       	callq  400610 <deregister_tm_clones>
  400692:	5d                   	pop    %rbp
  400693:	c6 05 b6 09 20 00 01 	movb   $0x1,0x2009b6(%rip)        # 601050 <__TMC_END__>
  40069a:	f3 c3                	repz retq 
  40069c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006a0 <frame_dummy>:
  4006a0:	48 83 3d 68 07 20 00 	cmpq   $0x0,0x200768(%rip)        # 600e10 <__JCR_END__>
  4006a7:	00 
  4006a8:	74 1e                	je     4006c8 <frame_dummy+0x28>
  4006aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4006af:	48 85 c0             	test   %rax,%rax
  4006b2:	74 14                	je     4006c8 <frame_dummy+0x28>
  4006b4:	55                   	push   %rbp
  4006b5:	bf 10 0e 60 00       	mov    $0x600e10,%edi
  4006ba:	48 89 e5             	mov    %rsp,%rbp
  4006bd:	ff d0                	callq  *%rax
  4006bf:	5d                   	pop    %rbp
  4006c0:	e9 7b ff ff ff       	jmpq   400640 <register_tm_clones>
  4006c5:	0f 1f 00             	nopl   (%rax)
  4006c8:	e9 73 ff ff ff       	jmpq   400640 <register_tm_clones>

00000000004006cd <_Z4funcliiiii>:
#include<iostream>
using namespace std;

double func(long arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
  4006cd:	55                   	push   %rbp
  4006ce:	48 89 e5             	mov    %rsp,%rbp
  4006d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4006d5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  4006d8:	89 55 e0             	mov    %edx,-0x20(%rbp)
  4006db:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  4006de:	44 89 45 d8          	mov    %r8d,-0x28(%rbp)
  4006e2:	44 89 4d d4          	mov    %r9d,-0x2c(%rbp)
    double local=2.0;
  4006e6:	48 b8 00 00 00 00 00 	movabs $0x4000000000000000,%rax
  4006ed:	00 00 40 
  4006f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    local=arg6/local;
  4006f4:	f2 0f 2a 45 d4       	cvtsi2sdl -0x2c(%rbp),%xmm0
  4006f9:	f2 0f 5e 45 f8       	divsd  -0x8(%rbp),%xmm0
  4006fe:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
    return (arg1+arg2+arg3+arg4+arg5+local)/1.0;
  400703:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  400706:	48 63 d0             	movslq %eax,%rdx
  400709:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40070d:	48 01 c2             	add    %rax,%rdx
  400710:	8b 45 e0             	mov    -0x20(%rbp),%eax
  400713:	48 98                	cltq   
  400715:	48 01 c2             	add    %rax,%rdx
  400718:	8b 45 dc             	mov    -0x24(%rbp),%eax
  40071b:	48 98                	cltq   
  40071d:	48 01 c2             	add    %rax,%rdx
  400720:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400723:	48 98                	cltq   
  400725:	48 01 d0             	add    %rdx,%rax
  400728:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  40072d:	f2 0f 58 45 f8       	addsd  -0x8(%rbp),%xmm0
  400732:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  400737:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
}
  40073b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  40073f:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  400744:	5d                   	pop    %rbp
  400745:	c3                   	retq   

0000000000400746 <main>:

int main()
{
  400746:	55                   	push   %rbp
  400747:	48 89 e5             	mov    %rsp,%rbp
  40074a:	48 83 ec 18          	sub    $0x18,%rsp
    double result=func(0x111222333, 0x222, 0x333, 0x444, 0x555, 0x666);
  40074e:	41 b9 66 06 00 00    	mov    $0x666,%r9d
  400754:	41 b8 55 05 00 00    	mov    $0x555,%r8d
  40075a:	b9 44 04 00 00       	mov    $0x444,%ecx
  40075f:	ba 33 03 00 00       	mov    $0x333,%edx
  400764:	be 22 02 00 00       	mov    $0x222,%esi
  400769:	48 bf 33 23 22 11 01 	movabs $0x111222333,%rdi
  400770:	00 00 00 
  400773:	e8 55 ff ff ff       	callq  4006cd <_Z4funcliiiii>
  400778:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
  40077d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400781:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    return result;
  400785:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  40078a:	f2 0f 2c c0          	cvttsd2si %xmm0,%eax
}
  40078e:	c9                   	leaveq 
  40078f:	c3                   	retq   

0000000000400790 <_Z41__static_initialization_and_destruction_0ii>:
  400790:	55                   	push   %rbp
  400791:	48 89 e5             	mov    %rsp,%rbp
  400794:	48 83 ec 10          	sub    $0x10,%rsp
  400798:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40079b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  40079e:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4007a2:	75 27                	jne    4007cb <_Z41__static_initialization_and_destruction_0ii+0x3b>
  4007a4:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
  4007ab:	75 1e                	jne    4007cb <_Z41__static_initialization_and_destruction_0ii+0x3b>
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
  4007ad:	bf 51 10 60 00       	mov    $0x601051,%edi
  4007b2:	e8 e9 fd ff ff       	callq  4005a0 <_ZNSt8ios_base4InitC1Ev@plt>
  4007b7:	ba 48 10 60 00       	mov    $0x601048,%edx
  4007bc:	be 51 10 60 00       	mov    $0x601051,%esi
  4007c1:	bf d0 05 40 00       	mov    $0x4005d0,%edi
  4007c6:	e8 f5 fd ff ff       	callq  4005c0 <__cxa_atexit@plt>
  4007cb:	c9                   	leaveq 
  4007cc:	c3                   	retq   

00000000004007cd <_GLOBAL__sub_I__Z4funcliiiii>:
  4007cd:	55                   	push   %rbp
  4007ce:	48 89 e5             	mov    %rsp,%rbp
  4007d1:	be ff ff 00 00       	mov    $0xffff,%esi
  4007d6:	bf 01 00 00 00       	mov    $0x1,%edi
  4007db:	e8 b0 ff ff ff       	callq  400790 <_Z41__static_initialization_and_destruction_0ii>
  4007e0:	5d                   	pop    %rbp
  4007e1:	c3                   	retq   
  4007e2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007e9:	00 00 00 
  4007ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007f0 <__libc_csu_init>:
  4007f0:	41 57                	push   %r15
  4007f2:	41 89 ff             	mov    %edi,%r15d
  4007f5:	41 56                	push   %r14
  4007f7:	49 89 f6             	mov    %rsi,%r14
  4007fa:	41 55                	push   %r13
  4007fc:	49 89 d5             	mov    %rdx,%r13
  4007ff:	41 54                	push   %r12
  400801:	4c 8d 25 f0 05 20 00 	lea    0x2005f0(%rip),%r12        # 600df8 <__frame_dummy_init_array_entry>
  400808:	55                   	push   %rbp
  400809:	48 8d 2d f8 05 20 00 	lea    0x2005f8(%rip),%rbp        # 600e08 <__init_array_end>
  400810:	53                   	push   %rbx
  400811:	4c 29 e5             	sub    %r12,%rbp
  400814:	31 db                	xor    %ebx,%ebx
  400816:	48 c1 fd 03          	sar    $0x3,%rbp
  40081a:	48 83 ec 08          	sub    $0x8,%rsp
  40081e:	e8 35 fd ff ff       	callq  400558 <_init>
  400823:	48 85 ed             	test   %rbp,%rbp
  400826:	74 1e                	je     400846 <__libc_csu_init+0x56>
  400828:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40082f:	00 
  400830:	4c 89 ea             	mov    %r13,%rdx
  400833:	4c 89 f6             	mov    %r14,%rsi
  400836:	44 89 ff             	mov    %r15d,%edi
  400839:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40083d:	48 83 c3 01          	add    $0x1,%rbx
  400841:	48 39 eb             	cmp    %rbp,%rbx
  400844:	75 ea                	jne    400830 <__libc_csu_init+0x40>
  400846:	48 83 c4 08          	add    $0x8,%rsp
  40084a:	5b                   	pop    %rbx
  40084b:	5d                   	pop    %rbp
  40084c:	41 5c                	pop    %r12
  40084e:	41 5d                	pop    %r13
  400850:	41 5e                	pop    %r14
  400852:	41 5f                	pop    %r15
  400854:	c3                   	retq   
  400855:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40085c:	00 00 00 00 

0000000000400860 <__libc_csu_fini>:
  400860:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400864 <_fini>:
  400864:	48 83 ec 08          	sub    $0x8,%rsp
  400868:	48 83 c4 08          	add    $0x8,%rsp
  40086c:	c3                   	retq   

Disassembly of section .rodata:

0000000000400870 <_IO_stdin_used>:
  400870:	01 00                	add    %eax,(%rax)
  400872:	02 00                	add    (%rax),%al

Disassembly of section .eh_frame_hdr:

0000000000400874 <.eh_frame_hdr>:
  400874:	01 1b                	add    %ebx,(%rbx)
  400876:	03 3b                	add    (%rbx),%edi
  400878:	48 00 00             	rex.W add %al,(%rax)
  40087b:	00 08                	add    %cl,(%rax)
  40087d:	00 00                	add    %al,(%rax)
  40087f:	00 0c fd ff ff 94 00 	add    %cl,0x94ffff(,%rdi,8)
  400886:	00 00                	add    %al,(%rax)
  400888:	6c                   	insb   (%dx),%es:(%rdi)
  400889:	fd                   	std    
  40088a:	ff                   	(bad)  
  40088b:	ff 64 00 00          	jmpq   *0x0(%rax,%rax,1)
  40088f:	00 59 fe             	add    %bl,-0x2(%rcx)
  400892:	ff                   	(bad)  
  400893:	ff                   	(bad)  
  400894:	bc 00 00 00 d2       	mov    $0xd2000000,%esp
  400899:	fe                   	(bad)  
  40089a:	ff                   	(bad)  
  40089b:	ff                   	(bad)  
  40089c:	dc 00                	faddl  (%rax)
  40089e:	00 00                	add    %al,(%rax)
  4008a0:	1c ff                	sbb    $0xff,%al
  4008a2:	ff                   	(bad)  
  4008a3:	ff                   	(bad)  
  4008a4:	fc                   	cld    
  4008a5:	00 00                	add    %al,(%rax)
  4008a7:	00 59 ff             	add    %bl,-0x1(%rcx)
  4008aa:	ff                   	(bad)  
  4008ab:	ff 1c 01             	lcallq *(%rcx,%rax,1)
  4008ae:	00 00                	add    %al,(%rax)
  4008b0:	7c ff                	jl     4008b1 <_IO_stdin_used+0x41>
  4008b2:	ff                   	(bad)  
  4008b3:	ff                   	(bad)  
  4008b4:	3c 01                	cmp    $0x1,%al
  4008b6:	00 00                	add    %al,(%rax)
  4008b8:	ec                   	in     (%dx),%al
  4008b9:	ff                   	(bad)  
  4008ba:	ff                   	(bad)  
  4008bb:	ff                   	.byte 0xff
  4008bc:	84 01                	test   %al,(%rcx)
	...

Disassembly of section .eh_frame:

00000000004008c0 <__FRAME_END__-0x150>:
  4008c0:	14 00                	adc    $0x0,%al
  4008c2:	00 00                	add    %al,(%rax)
  4008c4:	00 00                	add    %al,(%rax)
  4008c6:	00 00                	add    %al,(%rax)
  4008c8:	01 7a 52             	add    %edi,0x52(%rdx)
  4008cb:	00 01                	add    %al,(%rcx)
  4008cd:	78 10                	js     4008df <_IO_stdin_used+0x6f>
  4008cf:	01 1b                	add    %ebx,(%rbx)
  4008d1:	0c 07                	or     $0x7,%al
  4008d3:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  4008d9:	00 00                	add    %al,(%rax)
  4008db:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4008de:	00 00                	add    %al,(%rax)
  4008e0:	00 fd                	add    %bh,%ch
  4008e2:	ff                   	(bad)  
  4008e3:	ff 2a                	ljmpq  *(%rdx)
	...
  4008ed:	00 00                	add    %al,(%rax)
  4008ef:	00 14 00             	add    %dl,(%rax,%rax,1)
  4008f2:	00 00                	add    %al,(%rax)
  4008f4:	00 00                	add    %al,(%rax)
  4008f6:	00 00                	add    %al,(%rax)
  4008f8:	01 7a 52             	add    %edi,0x52(%rdx)
  4008fb:	00 01                	add    %al,(%rcx)
  4008fd:	78 10                	js     40090f <_IO_stdin_used+0x9f>
  4008ff:	01 1b                	add    %ebx,(%rbx)
  400901:	0c 07                	or     $0x7,%al
  400903:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  400909:	00 00                	add    %al,(%rax)
  40090b:	00 1c 00             	add    %bl,(%rax,%rax,1)
  40090e:	00 00                	add    %al,(%rax)
  400910:	70 fc                	jo     40090e <_IO_stdin_used+0x9e>
  400912:	ff                   	(bad)  
  400913:	ff 60 00             	jmpq   *0x0(%rax)
  400916:	00 00                	add    %al,(%rax)
  400918:	00 0e                	add    %cl,(%rsi)
  40091a:	10 46 0e             	adc    %al,0xe(%rsi)
  40091d:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400920:	0b 77 08             	or     0x8(%rdi),%esi
  400923:	80 00 3f             	addb   $0x3f,(%rax)
  400926:	1a 3b                	sbb    (%rbx),%bh
  400928:	2a 33                	sub    (%rbx),%dh
  40092a:	24 22                	and    $0x22,%al
  40092c:	00 00                	add    %al,(%rax)
  40092e:	00 00                	add    %al,(%rax)
  400930:	1c 00                	sbb    $0x0,%al
  400932:	00 00                	add    %al,(%rax)
  400934:	44 00 00             	add    %r8b,(%rax)
  400937:	00 95 fd ff ff 79    	add    %dl,0x79fffffd(%rbp)
  40093d:	00 00                	add    %al,(%rax)
  40093f:	00 00                	add    %al,(%rax)
  400941:	41 0e                	rex.B (bad) 
  400943:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400949:	02 74 0c 07          	add    0x7(%rsp,%rcx,1),%dh
  40094d:	08 00                	or     %al,(%rax)
  40094f:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400952:	00 00                	add    %al,(%rax)
  400954:	64 00 00             	add    %al,%fs:(%rax)
  400957:	00 ee                	add    %ch,%dh
  400959:	fd                   	std    
  40095a:	ff                   	(bad)  
  40095b:	ff 4a 00             	decl   0x0(%rdx)
  40095e:	00 00                	add    %al,(%rax)
  400960:	00 41 0e             	add    %al,0xe(%rcx)
  400963:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400969:	02 45 0c             	add    0xc(%rbp),%al
  40096c:	07                   	(bad)  
  40096d:	08 00                	or     %al,(%rax)
  40096f:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400972:	00 00                	add    %al,(%rax)
  400974:	84 00                	test   %al,(%rax)
  400976:	00 00                	add    %al,(%rax)
  400978:	18 fe                	sbb    %bh,%dh
  40097a:	ff                   	(bad)  
  40097b:	ff                   	(bad)  
  40097c:	3d 00 00 00 00       	cmp    $0x0,%eax
  400981:	41 0e                	rex.B (bad) 
  400983:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400989:	78 0c                	js     400997 <_IO_stdin_used+0x127>
  40098b:	07                   	(bad)  
  40098c:	08 00                	or     %al,(%rax)
  40098e:	00 00                	add    %al,(%rax)
  400990:	1c 00                	sbb    $0x0,%al
  400992:	00 00                	add    %al,(%rax)
  400994:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  400995:	00 00                	add    %al,(%rax)
  400997:	00 35 fe ff ff 15    	add    %dh,0x15fffffe(%rip)        # 1640099b <_end+0x15dff943>
  40099d:	00 00                	add    %al,(%rax)
  40099f:	00 00                	add    %al,(%rax)
  4009a1:	41 0e                	rex.B (bad) 
  4009a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  4009a9:	50                   	push   %rax
  4009aa:	0c 07                	or     $0x7,%al
  4009ac:	08 00                	or     %al,(%rax)
  4009ae:	00 00                	add    %al,(%rax)
  4009b0:	44 00 00             	add    %r8b,(%rax)
  4009b3:	00 c4                	add    %al,%ah
  4009b5:	00 00                	add    %al,(%rax)
  4009b7:	00 38                	add    %bh,(%rax)
  4009b9:	fe                   	(bad)  
  4009ba:	ff                   	(bad)  
  4009bb:	ff 65 00             	jmpq   *0x0(%rbp)
  4009be:	00 00                	add    %al,(%rax)
  4009c0:	00 42 0e             	add    %al,0xe(%rdx)
  4009c3:	10 8f 02 45 0e 18    	adc    %cl,0x180e4502(%rdi)
  4009c9:	8e 03                	mov    (%rbx),%es
  4009cb:	45 0e                	rex.RB (bad) 
  4009cd:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
  4009d3:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86701821 <_end+0xffffffff861007c9>
  4009d9:	06                   	(bad)  
  4009da:	48 0e                	rex.W (bad) 
  4009dc:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  4009e2:	6c                   	insb   (%dx),%es:(%rdi)
  4009e3:	0e                   	(bad)  
  4009e4:	38 41 0e             	cmp    %al,0xe(%rcx)
  4009e7:	30 41 0e             	xor    %al,0xe(%rcx)
  4009ea:	28 42 0e             	sub    %al,0xe(%rdx)
  4009ed:	20 42 0e             	and    %al,0xe(%rdx)
  4009f0:	18 42 0e             	sbb    %al,0xe(%rdx)
  4009f3:	10 42 0e             	adc    %al,0xe(%rdx)
  4009f6:	08 00                	or     %al,(%rax)
  4009f8:	14 00                	adc    $0x0,%al
  4009fa:	00 00                	add    %al,(%rax)
  4009fc:	0c 01                	or     $0x1,%al
  4009fe:	00 00                	add    %al,(%rax)
  400a00:	60                   	(bad)  
  400a01:	fe                   	(bad)  
  400a02:	ff                   	(bad)  
  400a03:	ff 02                	incl   (%rdx)
	...

0000000000400a10 <__FRAME_END__>:
  400a10:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600df8 <__frame_dummy_init_array_entry>:
  600df8:	a0 06 40 00 00 00 00 	movabs 0xcd00000000004006,%al
  600dff:	00 cd 
  600e01:	07                   	(bad)  
  600e02:	40 00 00             	add    %al,(%rax)
  600e05:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000600e08 <__do_global_dtors_aux_fini_array_entry>:
  600e08:	80 06 40             	addb   $0x40,(%rsi)
  600e0b:	00 00                	add    %al,(%rax)
  600e0d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .jcr:

0000000000600e10 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000600e18 <_DYNAMIC>:
  600e18:	01 00                	add    %eax,(%rax)
  600e1a:	00 00                	add    %al,(%rax)
  600e1c:	00 00                	add    %al,(%rax)
  600e1e:	00 00                	add    %al,(%rax)
  600e20:	01 00                	add    %eax,(%rax)
  600e22:	00 00                	add    %al,(%rax)
  600e24:	00 00                	add    %al,(%rax)
  600e26:	00 00                	add    %al,(%rax)
  600e28:	01 00                	add    %eax,(%rax)
  600e2a:	00 00                	add    %al,(%rax)
  600e2c:	00 00                	add    %al,(%rax)
  600e2e:	00 00                	add    %al,(%rax)
  600e30:	99                   	cltd   
  600e31:	00 00                	add    %al,(%rax)
  600e33:	00 00                	add    %al,(%rax)
  600e35:	00 00                	add    %al,(%rax)
  600e37:	00 0c 00             	add    %cl,(%rax,%rax,1)
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	58                   	pop    %rax
  600e41:	05 40 00 00 00       	add    $0x40,%eax
  600e46:	00 00                	add    %al,(%rax)
  600e48:	0d 00 00 00 00       	or     $0x0,%eax
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 64 08 40          	add    %ah,0x40(%rax,%rcx,1)
  600e53:	00 00                	add    %al,(%rax)
  600e55:	00 00                	add    %al,(%rax)
  600e57:	00 19                	add    %bl,(%rcx)
  600e59:	00 00                	add    %al,(%rax)
  600e5b:	00 00                	add    %al,(%rax)
  600e5d:	00 00                	add    %al,(%rax)
  600e5f:	00 f8                	add    %bh,%al
  600e61:	0d 60 00 00 00       	or     $0x60,%eax
  600e66:	00 00                	add    %al,(%rax)
  600e68:	1b 00                	sbb    (%rax),%eax
  600e6a:	00 00                	add    %al,(%rax)
  600e6c:	00 00                	add    %al,(%rax)
  600e6e:	00 00                	add    %al,(%rax)
  600e70:	10 00                	adc    %al,(%rax)
  600e72:	00 00                	add    %al,(%rax)
  600e74:	00 00                	add    %al,(%rax)
  600e76:	00 00                	add    %al,(%rax)
  600e78:	1a 00                	sbb    (%rax),%al
  600e7a:	00 00                	add    %al,(%rax)
  600e7c:	00 00                	add    %al,(%rax)
  600e7e:	00 00                	add    %al,(%rax)
  600e80:	08 0e                	or     %cl,(%rsi)
  600e82:	60                   	(bad)  
  600e83:	00 00                	add    %al,(%rax)
  600e85:	00 00                	add    %al,(%rax)
  600e87:	00 1c 00             	add    %bl,(%rax,%rax,1)
  600e8a:	00 00                	add    %al,(%rax)
  600e8c:	00 00                	add    %al,(%rax)
  600e8e:	00 00                	add    %al,(%rax)
  600e90:	08 00                	or     %al,(%rax)
  600e92:	00 00                	add    %al,(%rax)
  600e94:	00 00                	add    %al,(%rax)
  600e96:	00 00                	add    %al,(%rax)
  600e98:	f5                   	cmc    
  600e99:	fe                   	(bad)  
  600e9a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600e9d:	00 00                	add    %al,(%rax)
  600e9f:	00 98 02 40 00 00    	add    %bl,0x4002(%rax)
  600ea5:	00 00                	add    %al,(%rax)
  600ea7:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 600ead <_DYNAMIC+0x95>
  600ead:	00 00                	add    %al,(%rax)
  600eaf:	00 98 03 40 00 00    	add    %bl,0x4003(%rax)
  600eb5:	00 00                	add    %al,(%rax)
  600eb7:	00 06                	add    %al,(%rsi)
  600eb9:	00 00                	add    %al,(%rax)
  600ebb:	00 00                	add    %al,(%rax)
  600ebd:	00 00                	add    %al,(%rax)
  600ebf:	00 c0                	add    %al,%al
  600ec1:	02 40 00             	add    0x0(%rax),%al
  600ec4:	00 00                	add    %al,(%rax)
  600ec6:	00 00                	add    %al,(%rax)
  600ec8:	0a 00                	or     (%rax),%al
  600eca:	00 00                	add    %al,(%rax)
  600ecc:	00 00                	add    %al,(%rax)
  600ece:	00 00                	add    %al,(%rax)
  600ed0:	da 00                	fiaddl (%rax)
  600ed2:	00 00                	add    %al,(%rax)
  600ed4:	00 00                	add    %al,(%rax)
  600ed6:	00 00                	add    %al,(%rax)
  600ed8:	0b 00                	or     (%rax),%eax
  600eda:	00 00                	add    %al,(%rax)
  600edc:	00 00                	add    %al,(%rax)
  600ede:	00 00                	add    %al,(%rax)
  600ee0:	18 00                	sbb    %al,(%rax)
  600ee2:	00 00                	add    %al,(%rax)
  600ee4:	00 00                	add    %al,(%rax)
  600ee6:	00 00                	add    %al,(%rax)
  600ee8:	15 00 00 00 00       	adc    $0x0,%eax
	...
  600ef5:	00 00                	add    %al,(%rax)
  600ef7:	00 03                	add    %al,(%rbx)
	...
  600f01:	10 60 00             	adc    %ah,0x0(%rax)
  600f04:	00 00                	add    %al,(%rax)
  600f06:	00 00                	add    %al,(%rax)
  600f08:	02 00                	add    (%rax),%al
  600f0a:	00 00                	add    %al,(%rax)
  600f0c:	00 00                	add    %al,(%rax)
  600f0e:	00 00                	add    %al,(%rax)
  600f10:	78 00                	js     600f12 <_DYNAMIC+0xfa>
  600f12:	00 00                	add    %al,(%rax)
  600f14:	00 00                	add    %al,(%rax)
  600f16:	00 00                	add    %al,(%rax)
  600f18:	14 00                	adc    $0x0,%al
  600f1a:	00 00                	add    %al,(%rax)
  600f1c:	00 00                	add    %al,(%rax)
  600f1e:	00 00                	add    %al,(%rax)
  600f20:	07                   	(bad)  
  600f21:	00 00                	add    %al,(%rax)
  600f23:	00 00                	add    %al,(%rax)
  600f25:	00 00                	add    %al,(%rax)
  600f27:	00 17                	add    %dl,(%rdi)
  600f29:	00 00                	add    %al,(%rax)
  600f2b:	00 00                	add    %al,(%rax)
  600f2d:	00 00                	add    %al,(%rax)
  600f2f:	00 e0                	add    %ah,%al
  600f31:	04 40                	add    $0x40,%al
  600f33:	00 00                	add    %al,(%rax)
  600f35:	00 00                	add    %al,(%rax)
  600f37:	00 07                	add    %al,(%rdi)
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 c8                	add    %cl,%al
  600f41:	04 40                	add    $0x40,%al
  600f43:	00 00                	add    %al,(%rax)
  600f45:	00 00                	add    %al,(%rax)
  600f47:	00 08                	add    %cl,(%rax)
  600f49:	00 00                	add    %al,(%rax)
  600f4b:	00 00                	add    %al,(%rax)
  600f4d:	00 00                	add    %al,(%rax)
  600f4f:	00 18                	add    %bl,(%rax)
  600f51:	00 00                	add    %al,(%rax)
  600f53:	00 00                	add    %al,(%rax)
  600f55:	00 00                	add    %al,(%rax)
  600f57:	00 09                	add    %cl,(%rcx)
  600f59:	00 00                	add    %al,(%rax)
  600f5b:	00 00                	add    %al,(%rax)
  600f5d:	00 00                	add    %al,(%rax)
  600f5f:	00 18                	add    %bl,(%rax)
  600f61:	00 00                	add    %al,(%rax)
  600f63:	00 00                	add    %al,(%rax)
  600f65:	00 00                	add    %al,(%rax)
  600f67:	00 fe                	add    %bh,%dh
  600f69:	ff                   	(bad)  
  600f6a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f6d:	00 00                	add    %al,(%rax)
  600f6f:	00 88 04 40 00 00    	add    %cl,0x4004(%rax)
  600f75:	00 00                	add    %al,(%rax)
  600f77:	00 ff                	add    %bh,%bh
  600f79:	ff                   	(bad)  
  600f7a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f7d:	00 00                	add    %al,(%rax)
  600f7f:	00 02                	add    %al,(%rdx)
  600f81:	00 00                	add    %al,(%rax)
  600f83:	00 00                	add    %al,(%rax)
  600f85:	00 00                	add    %al,(%rax)
  600f87:	00 f0                	add    %dh,%al
  600f89:	ff                   	(bad)  
  600f8a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f8d:	00 00                	add    %al,(%rax)
  600f8f:	00 72 04             	add    %dh,0x4(%rdx)
  600f92:	40 00 00             	add    %al,(%rax)
	...

Disassembly of section .got:

0000000000600ff8 <.got>:
	...

Disassembly of section .got.plt:

0000000000601000 <_GLOBAL_OFFSET_TABLE_>:
  601000:	18 0e                	sbb    %cl,(%rsi)
  601002:	60                   	(bad)  
	...
  601017:	00 96 05 40 00 00    	add    %dl,0x4005(%rsi)
  60101d:	00 00                	add    %al,(%rax)
  60101f:	00 a6 05 40 00 00    	add    %ah,0x4005(%rsi)
  601025:	00 00                	add    %al,(%rax)
  601027:	00 b6 05 40 00 00    	add    %dh,0x4005(%rsi)
  60102d:	00 00                	add    %al,(%rax)
  60102f:	00 c6                	add    %al,%dh
  601031:	05 40 00 00 00       	add    $0x40,%eax
  601036:	00 00                	add    %al,(%rax)
  601038:	d6                   	(bad)  
  601039:	05 40 00 00 00       	add    $0x40,%eax
	...

Disassembly of section .data:

0000000000601040 <__data_start>:
	...

0000000000601048 <__dso_handle>:
	...

Disassembly of section .bss:

0000000000601050 <__bss_start>:
	...

0000000000601051 <_ZStL8__ioinit>:
  601051:	00 00                	add    %al,(%rax)
  601053:	00 00                	add    %al,(%rax)
  601055:	00 00                	add    %al,(%rax)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0x4004e0>
   a:	74 75                	je     81 <_init-0x4004d7>
   c:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
   f:	38 2e                	cmp    %ch,(%rsi)
  11:	34 2d                	xor    $0x2d,%al
  13:	32 75 62             	xor    0x62(%rbp),%dh
  16:	75 6e                	jne    86 <_init-0x4004d2>
  18:	74 75                	je     8f <_init-0x4004c9>
  1a:	31 7e 31             	xor    %edi,0x31(%rsi)
  1d:	34 2e                	xor    $0x2e,%al
  1f:	30 34 2e             	xor    %dh,(%rsi,%rbp,1)
  22:	31 29                	xor    %ebp,(%rcx)
  24:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
  27:	38 2e                	cmp    %ch,(%rsi)
  29:	34 00                	xor    $0x0,%al
  2b:	47                   	rex.RXB
  2c:	43                   	rex.XB
  2d:	43 3a 20             	rex.XB cmp (%r8),%spl
  30:	28 55 62             	sub    %dl,0x62(%rbp)
  33:	75 6e                	jne    a3 <_init-0x4004b5>
  35:	74 75                	je     ac <_init-0x4004ac>
  37:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
  3a:	38 2e                	cmp    %ch,(%rsi)
  3c:	32 2d 31 39 75 62    	xor    0x62753931(%rip),%ch        # 62753973 <_end+0x6215291b>
  42:	75 6e                	jne    b2 <_init-0x4004a6>
  44:	74 75                	je     bb <_init-0x40049d>
  46:	31 29                	xor    %ebp,(%rcx)
  48:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
  4b:	38 2e                	cmp    %ch,(%rsi)
  4d:	32 00                	xor    (%rax),%al

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 00                	or     %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	cd 06                	int    $0x6
  12:	40 00 00             	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 15 01 00 00 00    	add    %dl,0x1(%rip)        # 1e <_init-0x40053a>
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
       0:	db 13                	fistl  (%rbx)
       2:	00 00                	add    %al,(%rax)
       4:	04 00                	add    $0x0,%al
       6:	00 00                	add    %al,(%rax)
       8:	00 00                	add    %al,(%rax)
       a:	08 01                	or     %al,(%rcx)
       c:	25 06 00 00 04       	and    $0x4000006,%eax
      11:	12 02                	adc    (%rdx),%al
      13:	00 00                	add    %al,(%rax)
      15:	0e                   	(bad)  
      16:	04 00                	add    $0x0,%al
      18:	00 cd                	add    %cl,%ch
      1a:	06                   	(bad)  
      1b:	40 00 00             	add    %al,(%rax)
      1e:	00 00                	add    %al,(%rax)
      20:	00 15 01 00 00 00    	add    %dl,0x1(%rip)        # 27 <_init-0x400531>
      26:	00 00                	add    %al,(%rax)
      28:	00 00                	add    %al,(%rax)
      2a:	00 00                	add    %al,(%rax)
      2c:	00 02                	add    %al,(%rdx)
      2e:	f0 01 00             	lock add %eax,(%rax)
      31:	00 03                	add    %al,(%rbx)
      33:	1b 08                	sbb    (%rax),%ecx
      35:	00 00                	add    %al,(%rax)
      37:	04 40                	add    $0x40,%al
      39:	2d 00 00 00 04       	sub    $0x4000000,%eax
      3e:	08 07                	or     %al,(%rdi)
      40:	0e                   	(bad)  
      41:	00 00                	add    %al,(%rax)
      43:	00 05 50 0a 00 00    	add    %al,0xa50(%rip)        # a99 <_init-0x3ffabf>
      49:	18 03                	sbb    %al,(%rbx)
      4b:	00 81 00 00 00 06    	add    %al,0x6000000(%rcx)
      51:	ae                   	scas   %es:(%rdi),%al
      52:	05 00 00 03 00       	add    $0x30000,%eax
      57:	81 00 00 00 00 06    	addl   $0x6000000,(%rax)
      5d:	31 03                	xor    %eax,(%rbx)
      5f:	00 00                	add    %al,(%rax)
      61:	03 00                	add    (%rax),%eax
      63:	81 00 00 00 04 06    	addl   $0x6040000,(%rax)
      69:	86 06                	xchg   %al,(%rsi)
      6b:	00 00                	add    %al,(%rax)
      6d:	03 00                	add    (%rax),%eax
      6f:	88 00                	mov    %al,(%rax)
      71:	00 00                	add    %al,(%rax)
      73:	08 06                	or     %al,(%rsi)
      75:	4f 07                	rex.WRXB (bad) 
      77:	00 00                	add    %al,(%rax)
      79:	03 00                	add    (%rax),%eax
      7b:	88 00                	mov    %al,(%rax)
      7d:	00 00                	add    %al,(%rax)
      7f:	10 00                	adc    %al,(%rax)
      81:	04 04                	add    $0x4,%al
      83:	07                   	(bad)  
      84:	42 07                	rex.X (bad) 
      86:	00 00                	add    %al,(%rax)
      88:	07                   	(bad)  
      89:	08 03                	or     %al,(%rbx)
      8b:	07                   	(bad)  
      8c:	00 00                	add    %al,(%rax)
      8e:	00 05 d4 95 00 00    	add    %al,0x95d4(%rip)        # 9668 <_init-0x3f6ef0>
      94:	00 04 08             	add    %al,(%rax,%rcx,1)
      97:	07                   	(bad)  
      98:	3d 07 00 00 08       	cmp    $0x8000007,%eax
      9d:	2c 08                	sub    $0x8,%al
      9f:	00 00                	add    %al,(%rax)
      a1:	05 61 01 81 00       	add    $0x810161,%eax
      a6:	00 00                	add    %al,(%rax)
      a8:	09 08                	or     %ecx,(%rax)
      aa:	06                   	(bad)  
      ab:	53                   	push   %rbx
      ac:	c8 08 00 00          	enterq $0x8,$0x0
      b0:	ec                   	in     (%dx),%al
      b1:	00 00                	add    %al,(%rax)
      b3:	00 0a                	add    %cl,(%rdx)
      b5:	04 06                	add    $0x6,%al
      b7:	56                   	push   %rsi
      b8:	d3 00                	roll   %cl,(%rax)
      ba:	00 00                	add    %al,(%rax)
      bc:	0b 24 01             	or     (%rcx,%rax,1),%esp
      bf:	00 00                	add    %al,(%rax)
      c1:	06                   	(bad)  
      c2:	58                   	pop    %rax
      c3:	81 00 00 00 0b 07    	addl   $0x70b0000,(%rax)
      c9:	07                   	(bad)  
      ca:	00 00                	add    %al,(%rax)
      cc:	06                   	(bad)  
      cd:	5c                   	pop    %rsp
      ce:	ec                   	in     (%dx),%al
      cf:	00 00                	add    %al,(%rax)
      d1:	00 00                	add    %al,(%rax)
      d3:	06                   	(bad)  
      d4:	ac                   	lods   %ds:(%rsi),%al
      d5:	06                   	(bad)  
      d6:	00 00                	add    %al,(%rax)
      d8:	06                   	(bad)  
      d9:	54                   	push   %rsp
      da:	03 01                	add    (%rcx),%eax
      dc:	00 00                	add    %al,(%rax)
      de:	00 06                	add    %al,(%rsi)
      e0:	1f                   	(bad)  
      e1:	00 00                	add    %al,(%rax)
      e3:	00 06                	add    %al,(%rsi)
      e5:	5d                   	pop    %rbp
      e6:	b4 00                	mov    $0x0,%ah
      e8:	00 00                	add    %al,(%rax)
      ea:	04 00                	add    $0x0,%al
      ec:	0c fc                	or     $0xfc,%al
      ee:	00 00                	add    %al,(%rax)
      f0:	00 fc                	add    %bh,%ah
      f2:	00 00                	add    %al,(%rax)
      f4:	00 0d 3d 00 00 00    	add    %cl,0x3d(%rip)        # 137 <_init-0x400421>
      fa:	03 00                	add    (%rax),%eax
      fc:	04 01                	add    $0x1,%al
      fe:	06                   	(bad)  
      ff:	35 02 00 00 0e       	xor    $0xe000002,%eax
     104:	04 05                	add    $0x5,%al
     106:	69 6e 74 00 03 ca 08 	imul   $0x8ca0300,0x74(%rsi),%ebp
     10d:	00 00                	add    %al,(%rax)
     10f:	06                   	(bad)  
     110:	5e                   	pop    %rsi
     111:	a8 00                	test   $0x0,%al
     113:	00 00                	add    %al,(%rax)
     115:	03 cc                	add    %esp,%ecx
     117:	08 00                	or     %al,(%rax)
     119:	00 06                	add    %al,(%rsi)
     11b:	6a 0a                	pushq  $0xa
     11d:	01 00                	add    %eax,(%rax)
     11f:	00 04 02             	add    %al,(%rdx,%rax,1)
     122:	07                   	(bad)  
     123:	bb 09 00 00 0f       	mov    $0xf000009,%ebx
     128:	03 01                	add    (%rcx),%eax
     12a:	00 00                	add    %al,(%rax)
     12c:	10 08                	adc    %cl,(%rax)
     12e:	32 01                	xor    (%rcx),%al
     130:	00 00                	add    %al,(%rax)
     132:	0f fc 00             	paddb  (%rax),%mm0
     135:	00 00                	add    %al,(%rax)
     137:	11 73 74             	adc    %esi,0x74(%rbx)
     13a:	64 00 03             	add    %al,%fs:(%rbx)
     13d:	00 c4                	add    %al,%ah
     13f:	06                   	(bad)  
     140:	00 00                	add    %al,(%rax)
     142:	12 07                	adc    (%rdi),%al
     144:	40 15 01 00 00 12    	rex adc $0x12000001,%eax
     14a:	07                   	(bad)  
     14b:	8b 9c 00 00 00 12 07 	mov    0x7120000(%rax,%rax,1),%ebx
     152:	8d                   	(bad)  
     153:	c4                   	(bad)  
     154:	06                   	(bad)  
     155:	00 00                	add    %al,(%rax)
     157:	12 07                	adc    (%rdi),%al
     159:	8e da                	mov    %edx,%ds
     15b:	06                   	(bad)  
     15c:	00 00                	add    %al,(%rax)
     15e:	12 07                	adc    (%rdi),%al
     160:	8f                   	(bad)  
     161:	f6 06 00             	testb  $0x0,(%rsi)
     164:	00 12                	add    %dl,(%rdx)
     166:	07                   	(bad)  
     167:	90                   	nop
     168:	23 07                	and    (%rdi),%eax
     16a:	00 00                	add    %al,(%rax)
     16c:	12 07                	adc    (%rdi),%al
     16e:	91                   	xchg   %eax,%ecx
     16f:	3e                   	ds
     170:	07                   	(bad)  
     171:	00 00                	add    %al,(%rax)
     173:	12 07                	adc    (%rdi),%al
     175:	92                   	xchg   %eax,%edx
     176:	64                   	fs
     177:	07                   	(bad)  
     178:	00 00                	add    %al,(%rax)
     17a:	12 07                	adc    (%rdi),%al
     17c:	93                   	xchg   %eax,%ebx
     17d:	7f 07                	jg     186 <_init-0x4003d2>
     17f:	00 00                	add    %al,(%rax)
     181:	12 07                	adc    (%rdi),%al
     183:	94                   	xchg   %eax,%esp
     184:	9b                   	fwait
     185:	07                   	(bad)  
     186:	00 00                	add    %al,(%rax)
     188:	12 07                	adc    (%rdi),%al
     18a:	95                   	xchg   %eax,%ebp
     18b:	b7 07                	mov    $0x7,%bh
     18d:	00 00                	add    %al,(%rax)
     18f:	12 07                	adc    (%rdi),%al
     191:	96                   	xchg   %eax,%esi
     192:	cd 07                	int    $0x7
     194:	00 00                	add    %al,(%rax)
     196:	12 07                	adc    (%rdi),%al
     198:	97                   	xchg   %eax,%edi
     199:	d9 07                	flds   (%rdi)
     19b:	00 00                	add    %al,(%rax)
     19d:	12 07                	adc    (%rdi),%al
     19f:	98                   	cwtl   
     1a0:	ff 07                	incl   (%rdi)
     1a2:	00 00                	add    %al,(%rax)
     1a4:	12 07                	adc    (%rdi),%al
     1a6:	99                   	cltd   
     1a7:	24 08                	and    $0x8,%al
     1a9:	00 00                	add    %al,(%rax)
     1ab:	12 07                	adc    (%rdi),%al
     1ad:	9a                   	(bad)  
     1ae:	45 08 00             	or     %r8b,(%r8)
     1b1:	00 12                	add    %dl,(%rdx)
     1b3:	07                   	(bad)  
     1b4:	9b                   	fwait
     1b5:	70 08                	jo     1bf <_init-0x400399>
     1b7:	00 00                	add    %al,(%rax)
     1b9:	12 07                	adc    (%rdi),%al
     1bb:	9c                   	pushfq 
     1bc:	8b 08                	mov    (%rax),%ecx
     1be:	00 00                	add    %al,(%rax)
     1c0:	12 07                	adc    (%rdi),%al
     1c2:	9e                   	sahf   
     1c3:	a1 08 00 00 12 07 a0 	movabs 0x8c2a00712000008,%eax
     1ca:	c2 08 
     1cc:	00 00                	add    %al,(%rax)
     1ce:	12 07                	adc    (%rdi),%al
     1d0:	a1 de 08 00 00 12 07 	movabs 0xf9a20712000008de,%eax
     1d7:	a2 f9 
     1d9:	08 00                	or     %al,(%rax)
     1db:	00 12                	add    %dl,(%rdx)
     1dd:	07                   	(bad)  
     1de:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     1df:	1f                   	(bad)  
     1e0:	09 00                	or     %eax,(%rax)
     1e2:	00 12                	add    %dl,(%rdx)
     1e4:	07                   	(bad)  
     1e5:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
     1e6:	3f                   	(bad)  
     1e7:	09 00                	or     %eax,(%rax)
     1e9:	00 12                	add    %dl,(%rdx)
     1eb:	07                   	(bad)  
     1ec:	aa                   	stos   %al,%es:(%rdi)
     1ed:	64 09 00             	or     %eax,%fs:(%rax)
     1f0:	00 12                	add    %dl,(%rdx)
     1f2:	07                   	(bad)  
     1f3:	ac                   	lods   %ds:(%rsi),%al
     1f4:	84 09                	test   %cl,(%rcx)
     1f6:	00 00                	add    %al,(%rax)
     1f8:	12 07                	adc    (%rdi),%al
     1fa:	ae                   	scas   %es:(%rdi),%al
     1fb:	9f                   	lahf   
     1fc:	09 00                	or     %eax,(%rax)
     1fe:	00 12                	add    %dl,(%rdx)
     200:	07                   	(bad)  
     201:	b0 ba                	mov    $0xba,%al
     203:	09 00                	or     %eax,(%rax)
     205:	00 12                	add    %dl,(%rdx)
     207:	07                   	(bad)  
     208:	b1 e0                	mov    $0xe0,%cl
     20a:	09 00                	or     %eax,(%rax)
     20c:	00 12                	add    %dl,(%rdx)
     20e:	07                   	(bad)  
     20f:	b2 fa                	mov    $0xfa,%dl
     211:	09 00                	or     %eax,(%rax)
     213:	00 12                	add    %dl,(%rdx)
     215:	07                   	(bad)  
     216:	b3 14                	mov    $0x14,%bl
     218:	0a 00                	or     (%rax),%al
     21a:	00 12                	add    %dl,(%rdx)
     21c:	07                   	(bad)  
     21d:	b4 2e                	mov    $0x2e,%ah
     21f:	0a 00                	or     (%rax),%al
     221:	00 12                	add    %dl,(%rdx)
     223:	07                   	(bad)  
     224:	b5 48                	mov    $0x48,%ch
     226:	0a 00                	or     (%rax),%al
     228:	00 12                	add    %dl,(%rdx)
     22a:	07                   	(bad)  
     22b:	b6 62                	mov    $0x62,%dh
     22d:	0a 00                	or     (%rax),%al
     22f:	00 12                	add    %dl,(%rdx)
     231:	07                   	(bad)  
     232:	b7 22                	mov    $0x22,%bh
     234:	0b 00                	or     (%rax),%eax
     236:	00 12                	add    %dl,(%rdx)
     238:	07                   	(bad)  
     239:	b8 38 0b 00 00       	mov    $0xb38,%eax
     23e:	12 07                	adc    (%rdi),%al
     240:	b9 57 0b 00 00       	mov    $0xb57,%ecx
     245:	12 07                	adc    (%rdi),%al
     247:	ba 76 0b 00 00       	mov    $0xb76,%edx
     24c:	12 07                	adc    (%rdi),%al
     24e:	bb 95 0b 00 00       	mov    $0xb95,%ebx
     253:	12 07                	adc    (%rdi),%al
     255:	bc c0 0b 00 00       	mov    $0xbc0,%esp
     25a:	12 07                	adc    (%rdi),%al
     25c:	bd db 0b 00 00       	mov    $0xbdb,%ebp
     261:	12 07                	adc    (%rdi),%al
     263:	bf 03 0c 00 00       	mov    $0xc03,%edi
     268:	12 07                	adc    (%rdi),%al
     26a:	c1 25 0c 00 00 12 07 	shll   $0x7,0x1200000c(%rip)        # 1200027d <_end+0x119ff225>
     271:	c2 45 0c             	retq   $0xc45
     274:	00 00                	add    %al,(%rax)
     276:	12 07                	adc    (%rdi),%al
     278:	c3                   	retq   
     279:	6c                   	insb   (%dx),%es:(%rdi)
     27a:	0c 00                	or     $0x0,%al
     27c:	00 12                	add    %dl,(%rdx)
     27e:	07                   	(bad)  
     27f:	c4                   	(bad)  
     280:	8c 0c 00             	mov    %cs,(%rax,%rax,1)
     283:	00 12                	add    %dl,(%rdx)
     285:	07                   	(bad)  
     286:	c5 ab 0c             	(bad)  
     289:	00 00                	add    %al,(%rax)
     28b:	12 07                	adc    (%rdi),%al
     28d:	c6 c1 0c             	mov    $0xc,%cl
     290:	00 00                	add    %al,(%rax)
     292:	12 07                	adc    (%rdi),%al
     294:	c7                   	(bad)  
     295:	e1 0c                	loope  2a3 <_init-0x4002b5>
     297:	00 00                	add    %al,(%rax)
     299:	12 07                	adc    (%rdi),%al
     29b:	c8 01 0d 00          	enterq $0xd01,$0x0
     29f:	00 12                	add    %dl,(%rdx)
     2a1:	07                   	(bad)  
     2a2:	c9                   	leaveq 
     2a3:	21 0d 00 00 12 07    	and    %ecx,0x7120000(%rip)        # 71202a9 <_end+0x6b1f251>
     2a9:	ca 41 0d             	lret   $0xd41
     2ac:	00 00                	add    %al,(%rax)
     2ae:	12 07                	adc    (%rdi),%al
     2b0:	cb                   	lret   
     2b1:	58                   	pop    %rax
     2b2:	0d 00 00 12 07       	or     $0x7120000,%eax
     2b7:	cc                   	int3   
     2b8:	6f                   	outsl  %ds:(%rsi),(%dx)
     2b9:	0d 00 00 12 07       	or     $0x7120000,%eax
     2be:	cd 8d                	int    $0x8d
     2c0:	0d 00 00 12 07       	or     $0x7120000,%eax
     2c5:	ce                   	(bad)  
     2c6:	ac                   	lods   %ds:(%rsi),%al
     2c7:	0d 00 00 12 07       	or     $0x7120000,%eax
     2cc:	cf                   	iret   
     2cd:	ca 0d 00             	lret   $0xd
     2d0:	00 12                	add    %dl,(%rdx)
     2d2:	07                   	(bad)  
     2d3:	d0 e9                	shr    %cl
     2d5:	0d 00 00 13 07       	or     $0x7130000,%eax
     2da:	08 01                	or     %al,(%rcx)
     2dc:	84 0f                	test   %cl,(%rdi)
     2de:	00 00                	add    %al,(%rax)
     2e0:	13 07                	adc    (%rdi),%eax
     2e2:	09 01                	or     %eax,(%rcx)
     2e4:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
     2e5:	0f 00 00             	sldt   (%rax)
     2e8:	13 07                	adc    (%rdi),%eax
     2ea:	0a 01                	or     (%rcx),%al
     2ec:	cd 0f                	int    $0xf
     2ee:	00 00                	add    %al,(%rax)
     2f0:	14 73                	adc    $0x73,%al
     2f2:	08 00                	or     %al,(%rax)
     2f4:	00 0f                	add    %cl,(%rdi)
     2f6:	30 03                	xor    %al,(%rbx)
     2f8:	07                   	(bad)  
     2f9:	00 00                	add    %al,(%rax)
     2fb:	00 08                	add    %cl,(%rax)
     2fd:	ba 95 00 00 00       	mov    $0x95,%edx
     302:	12 09                	adc    (%rcx),%cl
     304:	35 23 10 00 00       	xor    $0x1023,%eax
     309:	12 09                	adc    (%rcx),%cl
     30b:	36                   	ss
     30c:	50                   	push   %rax
     30d:	11 00                	adc    %eax,(%rax)
     30f:	00 12                	add    %dl,(%rdx)
     311:	09 37                	or     %esi,(%rdi)
     313:	6a 11                	pushq  $0x11
     315:	00 00                	add    %al,(%rax)
     317:	03 3b                	add    (%rbx),%edi
     319:	03 00                	add    (%rax),%eax
     31b:	00 08                	add    %cl,(%rax)
     31d:	bb 65 0c 00 00       	mov    $0xc65,%ebx
     322:	15 51 05 00 00       	adc    $0x551,%eax
     327:	04 0a                	add    $0xa,%al
     329:	33 c5                	xor    %ebp,%eax
     32b:	03 00                	add    (%rax),%eax
     32d:	00 16                	add    %dl,(%rsi)
     32f:	e2 00                	loop   331 <_init-0x400227>
     331:	00 00                	add    %al,(%rax)
     333:	01 16                	add    %edx,(%rsi)
     335:	4a 05 00 00 02 16    	rex.WX add $0x16020000,%rax
     33b:	79 04                	jns    341 <_init-0x400217>
     33d:	00 00                	add    %al,(%rax)
     33f:	04 16                	add    $0x16,%al
     341:	96                   	xchg   %eax,%esi
     342:	03 00                	add    (%rax),%eax
     344:	00 08                	add    %cl,(%rax)
     346:	16                   	(bad)  
     347:	cb                   	lret   
     348:	03 00                	add    (%rax),%eax
     34a:	00 10                	add    %dl,(%rax)
     34c:	16                   	(bad)  
     34d:	09 06                	or     %eax,(%rsi)
     34f:	00 00                	add    %al,(%rax)
     351:	20 16                	and    %dl,(%rsi)
     353:	00 07                	add    %al,(%rdi)
     355:	00 00                	add    %al,(%rax)
     357:	c0 00 16             	rolb   $0x16,(%rax)
     35a:	23 02                	and    (%rdx),%eax
     35c:	00 00                	add    %al,(%rax)
     35e:	80 01 16             	addb   $0x16,(%rcx)
     361:	3a 0a                	cmp    (%rdx),%cl
     363:	00 00                	add    %al,(%rax)
     365:	80 02 16             	addb   $0x16,(%rdx)
     368:	a0 04 00 00 80 04 16 	movabs 0x597160480000004,%al
     36f:	97 05 
     371:	00 00                	add    %al,(%rax)
     373:	80 08 16             	orb    $0x16,(%rax)
     376:	13 05 00 00 80 10    	adc    0x10800000(%rip),%eax        # 1080037c <_end+0x101ff324>
     37c:	16                   	(bad)  
     37d:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     37e:	05 00 00 80 20       	add    $0x20800000,%eax
     383:	16                   	(bad)  
     384:	eb 07                	jmp    38d <_init-0x4001cb>
     386:	00 00                	add    %al,(%rax)
     388:	80 c0 00             	add    $0x0,%al
     38b:	16                   	(bad)  
     38c:	6c                   	insb   (%dx),%es:(%rdi)
     38d:	06                   	(bad)  
     38e:	00 00                	add    %al,(%rax)
     390:	80 80 01 16 b8 05 00 	addb   $0x0,0x5b81601(%rax)
     397:	00 b0 01 16 2a 01    	add    %dh,0x12a1601(%rax)
     39d:	00 00                	add    %al,(%rax)
     39f:	ca 00 16             	lret   $0x1600
     3a2:	f2 06                	repnz (bad) 
     3a4:	00 00                	add    %al,(%rax)
     3a6:	84 02                	test   %al,(%rdx)
     3a8:	16                   	(bad)  
     3a9:	98                   	cwtl   
     3aa:	06                   	(bad)  
     3ab:	00 00                	add    %al,(%rax)
     3ad:	80 80 04 16 5f 08 00 	addb   $0x0,0x85f1604(%rax)
     3b4:	00 ff                	add    %bh,%bh
     3b6:	ff                   	(bad)  
     3b7:	ff                   	(bad)  
     3b8:	ff 07                	incl   (%rdi)
     3ba:	16                   	(bad)  
     3bb:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     3bc:	00 00                	add    %al,(%rax)
     3be:	00 80 80 80 80 78    	add    %al,0x78808080(%rax)
     3c4:	00 15 80 01 00 00    	add    %dl,0x180(%rip)        # 54a <_init-0x40000e>
     3ca:	04 0a                	add    $0xa,%al
     3cc:	69 12 04 00 00 16    	imul   $0x16000004,(%rdx),%edx
     3d2:	da 02                	fiaddl (%rdx)
     3d4:	00 00                	add    %al,(%rax)
     3d6:	01 16                	add    %edx,(%rsi)
     3d8:	72 04                	jb     3de <_init-0x40017a>
     3da:	00 00                	add    %al,(%rax)
     3dc:	02 16                	add    (%rsi),%dl
     3de:	7f 02                	jg     3e2 <_init-0x400176>
     3e0:	00 00                	add    %al,(%rax)
     3e2:	04 16                	add    $0x16,%al
     3e4:	ac                   	lods   %ds:(%rsi),%al
     3e5:	04 00                	add    $0x0,%al
     3e7:	00 08                	add    %cl,(%rax)
     3e9:	16                   	(bad)  
     3ea:	d3 02                	roll   %cl,(%rdx)
     3ec:	00 00                	add    %al,(%rax)
     3ee:	10 16                	adc    %dl,(%rsi)
     3f0:	fb                   	sti    
     3f1:	04 00                	add    $0x0,%al
     3f3:	00 20                	add    %ah,(%rax)
     3f5:	16                   	(bad)  
     3f6:	11 06                	adc    %eax,(%rsi)
     3f8:	00 00                	add    %al,(%rax)
     3fa:	80 80 04 16 33 08 00 	addb   $0x0,0x8331604(%rax)
     401:	00 ff                	add    %bh,%bh
     403:	ff                   	(bad)  
     404:	ff                   	(bad)  
     405:	ff 07                	incl   (%rdi)
     407:	16                   	(bad)  
     408:	27                   	(bad)  
     409:	00 00                	add    %al,(%rax)
     40b:	00 80 80 80 80 78    	add    %al,0x78808080(%rax)
     411:	00 15 9a 07 00 00    	add    %dl,0x79a(%rip)        # bb1 <_init-0x3ff9a7>
     417:	04 0a                	add    $0xa,%al
     419:	93                   	xchg   %eax,%ebx
     41a:	53                   	push   %rbx
     41b:	04 00                	add    $0x0,%al
     41d:	00 16                	add    %dl,(%rsi)
     41f:	42 02 00             	rex.X add (%rax),%al
     422:	00 00                	add    %al,(%rax)
     424:	16                   	(bad)  
     425:	b8 01 00 00 01       	mov    $0x1000001,%eax
     42a:	16                   	(bad)  
     42b:	de 01                	fiadd  (%rcx)
     42d:	00 00                	add    %al,(%rax)
     42f:	02 16                	add    (%rsi),%dl
     431:	7c 09                	jl     43c <_init-0x40011c>
     433:	00 00                	add    %al,(%rax)
     435:	04 16                	add    $0x16,%al
     437:	f6                   	(bad)  
     438:	08 00                	or     %al,(%rax)
     43a:	00 80 80 04 16 b8    	add    %al,-0x47e9fb80(%rax)
     440:	00 00                	add    %al,(%rax)
     442:	00 ff                	add    %bh,%bh
     444:	ff                   	(bad)  
     445:	ff                   	(bad)  
     446:	ff 07                	incl   (%rdi)
     448:	16                   	(bad)  
     449:	af                   	scas   %es:(%rdi),%eax
     44a:	03 00                	add    (%rax),%eax
     44c:	00 80 80 80 80 78    	add    %al,0x78808080(%rax)
     452:	00 15 d7 09 00 00    	add    %dl,0x9d7(%rip)        # e2f <_init-0x3ff729>
     458:	04 0a                	add    $0xa,%al
     45a:	bb 7a 04 00 00       	mov    $0x47a,%ebx
     45f:	16                   	(bad)  
     460:	15 01 00 00 00       	adc    $0x1,%eax
     465:	16                   	(bad)  
     466:	ba 08 00 00 01       	mov    $0x1000008,%edx
     46b:	16                   	(bad)  
     46c:	00 00                	add    %al,(%rax)
     46e:	00 00                	add    %al,(%rax)
     470:	02 16                	add    (%rsi),%dl
     472:	78 07                	js     47b <_init-0x4000dd>
     474:	00 00                	add    %al,(%rax)
     476:	80 80 04 00 17 47 08 	addb   $0x8,0x47170004(%rax)
     47d:	00 00                	add    %al,(%rax)
     47f:	87 06                	xchg   %eax,(%rsi)
     481:	00 00                	add    %al,(%rax)
     483:	18 6d 09             	sbb    %ch,0x9(%rbp)
     486:	00 00                	add    %al,(%rax)
     488:	01 0a                	add    %ecx,(%rdx)
     48a:	1b 02                	sbb    (%rdx),%eax
     48c:	01 d9                	add    %ebx,%ecx
     48e:	04 00                	add    $0x0,%al
     490:	00 19                	add    %bl,(%rcx)
     492:	ef                   	out    %eax,(%dx)
     493:	04 00                	add    $0x0,%al
     495:	00 0a                	add    %cl,(%rdx)
     497:	23 02                	and    (%rdx),%eax
     499:	86 11                	xchg   %dl,(%rcx)
     49b:	00 00                	add    %al,(%rax)
     49d:	19 c2                	sbb    %eax,%edx
     49f:	01 00                	add    %eax,(%rax)
     4a1:	00 0a                	add    %cl,(%rdx)
     4a3:	24 02                	and    $0x2,%al
     4a5:	1c 10                	sbb    $0x10,%al
     4a7:	00 00                	add    %al,(%rax)
     4a9:	1a 6d 09             	sbb    0x9(%rbp),%ch
     4ac:	00 00                	add    %al,(%rax)
     4ae:	0a 1f                	or     (%rdi),%bl
     4b0:	02 01                	add    (%rcx),%al
     4b2:	ba 04 00 00 c0       	mov    $0xc0000004,%edx
     4b7:	04 00                	add    $0x0,%al
     4b9:	00 1b                	add    %bl,(%rbx)
     4bb:	9b                   	fwait
     4bc:	11 00                	adc    %eax,(%rax)
     4be:	00 00                	add    %al,(%rax)
     4c0:	1c 6c                	sbb    $0x6c,%al
     4c2:	09 00                	or     %eax,(%rax)
     4c4:	00 0a                	add    %cl,(%rdx)
     4c6:	20 02                	and    %al,(%rdx)
     4c8:	01 cd                	add    %ecx,%ebp
     4ca:	04 00                	add    $0x0,%al
     4cc:	00 1b                	add    %bl,(%rbx)
     4ce:	9b                   	fwait
     4cf:	11 00                	adc    %eax,(%rax)
     4d1:	00 1b                	add    %bl,(%rbx)
     4d3:	03 01                	add    (%rcx),%eax
     4d5:	00 00                	add    %al,(%rax)
     4d7:	00 00                	add    %al,(%rax)
     4d9:	1d e4 09 00 00       	sbb    $0x9e4,%eax
     4de:	0a 05 01 22 03 00    	or     0x32201(%rip),%al        # 326e5 <_init-0x3cde73>
     4e4:	00 01                	add    %al,(%rcx)
     4e6:	1e                   	(bad)  
     4e7:	e5 00                	in     $0x0,%eax
     4e9:	00 00                	add    %al,(%rax)
     4eb:	0a 08                	or     (%rax),%cl
     4ed:	01 f4                	add    %esi,%esp
     4ef:	04 00                	add    $0x0,%al
     4f1:	00 01                	add    %al,(%rcx)
     4f3:	01 0f                	add    %ecx,(%rdi)
     4f5:	d9 04 00             	flds   (%rax,%rax,1)
     4f8:	00 1f                	add    %bl,(%rdi)
     4fa:	64 65 63 00          	fs movslq %fs:%gs:(%rax),%eax
     4fe:	0a 0b                	or     (%rbx),%cl
     500:	01 f4                	add    %esi,%esp
     502:	04 00                	add    $0x0,%al
     504:	00 01                	add    %al,(%rcx)
     506:	02 1e                	add    (%rsi),%bl
     508:	7c 04                	jl     50e <_init-0x40004a>
     50a:	00 00                	add    %al,(%rax)
     50c:	0a 0e                	or     (%rsi),%cl
     50e:	01 f4                	add    %esi,%esp
     510:	04 00                	add    $0x0,%al
     512:	00 01                	add    %al,(%rcx)
     514:	04 1f                	add    $0x1f,%al
     516:	68 65 78 00 0a       	pushq  $0xa007865
     51b:	11 01                	adc    %eax,(%rcx)
     51d:	f4                   	hlt    
     51e:	04 00                	add    $0x0,%al
     520:	00 01                	add    %al,(%rcx)
     522:	08 1e                	or     %bl,(%rsi)
     524:	ce                   	(bad)  
     525:	03 00                	add    (%rax),%eax
     527:	00 0a                	add    %cl,(%rdx)
     529:	16                   	(bad)  
     52a:	01 f4                	add    %esi,%esp
     52c:	04 00                	add    $0x0,%al
     52e:	00 01                	add    %al,(%rcx)
     530:	10 1e                	adc    %bl,(%rsi)
     532:	0c 06                	or     $0x6,%al
     534:	00 00                	add    %al,(%rax)
     536:	0a 1a                	or     (%rdx),%bl
     538:	01 f4                	add    %esi,%esp
     53a:	04 00                	add    $0x0,%al
     53c:	00 01                	add    %al,(%rcx)
     53e:	20 1f                	and    %bl,(%rdi)
     540:	6f                   	outsl  %ds:(%rsi),(%dx)
     541:	63 74 00 0a          	movslq 0xa(%rax,%rax,1),%esi
     545:	1d 01 f4 04 00       	sbb    $0x4f401,%eax
     54a:	00 01                	add    %al,(%rcx)
     54c:	40 1e                	rex (bad) 
     54e:	26 02 00             	add    %es:(%rax),%al
     551:	00 0a                	add    %cl,(%rdx)
     553:	21 01                	and    %eax,(%rcx)
     555:	f4                   	hlt    
     556:	04 00                	add    $0x0,%al
     558:	00 01                	add    %al,(%rcx)
     55a:	80 20 3d             	andb   $0x3d,(%rax)
     55d:	0a 00                	or     (%rax),%al
     55f:	00 0a                	add    %cl,(%rdx)
     561:	24 01                	and    $0x1,%al
     563:	f4                   	hlt    
     564:	04 00                	add    $0x0,%al
     566:	00 01                	add    %al,(%rcx)
     568:	00 01                	add    %al,(%rcx)
     56a:	20 a3 04 00 00 0a    	and    %ah,0xa000004(%rbx)
     570:	28 01                	sub    %al,(%rcx)
     572:	f4                   	hlt    
     573:	04 00                	add    $0x0,%al
     575:	00 01                	add    %al,(%rcx)
     577:	00 02                	add    %al,(%rdx)
     579:	20 9a 05 00 00 0a    	and    %bl,0xa000005(%rdx)
     57f:	2c 01                	sub    $0x1,%al
     581:	f4                   	hlt    
     582:	04 00                	add    $0x0,%al
     584:	00 01                	add    %al,(%rcx)
     586:	00 04 20             	add    %al,(%rax,%riz,1)
     589:	16                   	(bad)  
     58a:	05 00 00 0a 2f       	add    $0x2f0a0000,%eax
     58f:	01 f4                	add    %esi,%esp
     591:	04 00                	add    $0x0,%al
     593:	00 01                	add    %al,(%rcx)
     595:	00 08                	add    %cl,(%rax)
     597:	20 a7 05 00 00 0a    	and    %ah,0xa000005(%rdi)
     59d:	32 01                	xor    (%rcx),%al
     59f:	f4                   	hlt    
     5a0:	04 00                	add    $0x0,%al
     5a2:	00 01                	add    %al,(%rcx)
     5a4:	00 10                	add    %dl,(%rax)
     5a6:	20 ee                	and    %ch,%dh
     5a8:	07                   	(bad)  
     5a9:	00 00                	add    %al,(%rax)
     5ab:	0a 35 01 f4 04 00    	or     0x4f401(%rip),%dh        # 4f9b2 <_init-0x3b0ba6>
     5b1:	00 01                	add    %al,(%rcx)
     5b3:	00 20                	add    %ah,(%rax)
     5b5:	20 6f 06             	and    %ch,0x6(%rdi)
     5b8:	00 00                	add    %al,(%rax)
     5ba:	0a 39                	or     (%rcx),%bh
     5bc:	01 f4                	add    %esi,%esp
     5be:	04 00                	add    $0x0,%al
     5c0:	00 01                	add    %al,(%rcx)
     5c2:	00 40 1e             	add    %al,0x1e(%rax)
     5c5:	bb 05 00 00 0a       	mov    $0xa000005,%ebx
     5ca:	3c 01                	cmp    $0x1,%al
     5cc:	f4                   	hlt    
     5cd:	04 00                	add    $0x0,%al
     5cf:	00 01                	add    %al,(%rcx)
     5d1:	b0 1e                	mov    $0x1e,%al
     5d3:	2d 01 00 00 0a       	sub    $0xa000001,%eax
     5d8:	3f                   	(bad)  
     5d9:	01 f4                	add    %esi,%esp
     5db:	04 00                	add    $0x0,%al
     5dd:	00 01                	add    %al,(%rcx)
     5df:	4a 20 f5             	rex.WX and %sil,%bpl
     5e2:	06                   	(bad)  
     5e3:	00 00                	add    %al,(%rax)
     5e5:	0a 42 01             	or     0x1(%rdx),%al
     5e8:	f4                   	hlt    
     5e9:	04 00                	add    $0x0,%al
     5eb:	00 01                	add    %al,(%rcx)
     5ed:	04 01                	add    $0x1,%al
     5ef:	1d 57 08 00 00       	sbb    $0x857,%eax
     5f4:	0a 50 01             	or     0x1(%rax),%dl
     5f7:	12 04 00             	adc    (%rax,%rax,1),%al
     5fa:	00 01                	add    %al,(%rcx)
     5fc:	1e                   	(bad)  
     5fd:	bb 01 00 00 0a       	mov    $0xa000001,%ebx
     602:	54                   	push   %rsp
     603:	01 0a                	add    %ecx,(%rdx)
     605:	06                   	(bad)  
     606:	00 00                	add    %al,(%rax)
     608:	01 01                	add    %eax,(%rcx)
     60a:	0f ef 05 00 00 1e e1 	pxor   -0x1ee20000(%rip),%mm0        # ffffffffe11e0611 <_end+0xffffffffe0bdf5b9>
     611:	01 00                	add    %eax,(%rax)
     613:	00 0a                	add    %cl,(%rdx)
     615:	57                   	push   %rdi
     616:	01 0a                	add    %ecx,(%rdx)
     618:	06                   	(bad)  
     619:	00 00                	add    %al,(%rax)
     61b:	01 02                	add    %eax,(%rdx)
     61d:	1e                   	(bad)  
     61e:	7f 09                	jg     629 <_init-0x3fff2f>
     620:	00 00                	add    %al,(%rax)
     622:	0a 5c 01 0a          	or     0xa(%rcx,%rax,1),%bl
     626:	06                   	(bad)  
     627:	00 00                	add    %al,(%rax)
     629:	01 04 1e             	add    %eax,(%rsi,%rbx,1)
     62c:	45 02 00             	add    (%r8),%r8b
     62f:	00 0a                	add    %cl,(%rdx)
     631:	5f                   	pop    %rdi
     632:	01 0a                	add    %ecx,(%rdx)
     634:	06                   	(bad)  
     635:	00 00                	add    %al,(%rax)
     637:	01 00                	add    %eax,(%rax)
     639:	1d e1 02 00 00       	sbb    $0x2e1,%eax
     63e:	0a 6f 01             	or     0x1(%rdi),%ch
     641:	c5 03 00             	(bad)  
     644:	00 01                	add    %al,(%rcx)
     646:	1f                   	(bad)  
     647:	69 6e 00 0a 7d 01 53 	imul   $0x53017d0a,0x0(%rsi),%ebp
     64e:	06                   	(bad)  
     64f:	00 00                	add    %al,(%rax)
     651:	01 08                	add    %ecx,(%rax)
     653:	0f 39                	(bad)  
     655:	06                   	(bad)  
     656:	00 00                	add    %al,(%rax)
     658:	1f                   	(bad)  
     659:	6f                   	outsl  %ds:(%rsi),(%dx)
     65a:	75 74                	jne    6d0 <_init-0x3ffe88>
     65c:	00 0a                	add    %cl,(%rdx)
     65e:	80 01 53             	addb   $0x53,(%rcx)
     661:	06                   	(bad)  
     662:	00 00                	add    %al,(%rax)
     664:	01 10                	add    %edx,(%rax)
     666:	1d 06 04 00 00       	sbb    $0x406,%eax
     66b:	0a 8f 01 53 04 00    	or     0x45301(%rdi),%cl
     671:	00 01                	add    %al,(%rcx)
     673:	1f                   	(bad)  
     674:	63 75 72             	movslq 0x72(%rbp),%esi
     677:	00 0a                	add    %cl,(%rdx)
     679:	95                   	xchg   %eax,%ebp
     67a:	01 81 06 00 00 01    	add    %eax,0x1000006(%rcx)
     680:	01 0f                	add    %ecx,(%rdi)
     682:	66                   	data16
     683:	06                   	(bad)  
     684:	00 00                	add    %al,(%rax)
     686:	00 12                	add    %dl,(%rdx)
     688:	0b 52 ac             	or     -0x54(%rdx),%edx
     68b:	11 00                	adc    %eax,(%rax)
     68d:	00 12                	add    %dl,(%rdx)
     68f:	0b 53 a1             	or     -0x5f(%rbx),%edx
     692:	11 00                	adc    %eax,(%rax)
     694:	00 12                	add    %dl,(%rdx)
     696:	0b 54 9c 00          	or     0x0(%rsp,%rbx,4),%edx
     69a:	00 00                	add    %al,(%rax)
     69c:	12 0b                	adc    (%rbx),%cl
     69e:	5c                   	pop    %rsp
     69f:	c2 11 00             	retq   $0x11
     6a2:	00 12                	add    %dl,(%rdx)
     6a4:	0b 65 dc             	or     -0x24(%rbp),%esp
     6a7:	11 00                	adc    %eax,(%rax)
     6a9:	00 12                	add    %dl,(%rdx)
     6ab:	0b 68 f6             	or     -0xa(%rax),%ebp
     6ae:	11 00                	adc    %eax,(%rax)
     6b0:	00 12                	add    %dl,(%rdx)
     6b2:	0b 69 0b             	or     0xb(%rcx),%ebp
     6b5:	12 00                	adc    (%rax),%al
     6b7:	00 21                	add    %ah,(%rcx)
     6b9:	af                   	scas   %es:(%rdi),%eax
     6ba:	01 00                	add    %eax,(%rax)
     6bc:	00 02                	add    %al,(%rdx)
     6be:	4a 83 04 00 00       	addq   $0x0,(%rax,%r8,1)
     6c3:	00 22                	add    %ah,(%rdx)
     6c5:	11 03                	adc    %eax,(%rbx)
     6c7:	00 00                	add    %al,(%rax)
     6c9:	06                   	(bad)  
     6ca:	61                   	(bad)  
     6cb:	01 9c 00 00 00 da 06 	add    %ebx,0x6da0000(%rax,%rax,1)
     6d2:	00 00                	add    %al,(%rax)
     6d4:	23 03                	and    (%rbx),%eax
     6d6:	01 00                	add    %eax,(%rax)
     6d8:	00 00                	add    %al,(%rax)
     6da:	22 02                	and    (%rdx),%al
     6dc:	02 00                	add    (%rax),%al
     6de:	00 06                	add    %al,(%rsi)
     6e0:	e9 02 9c 00 00       	jmpq   a2e7 <_init-0x3f6271>
     6e5:	00 f0                	add    %dh,%al
     6e7:	06                   	(bad)  
     6e8:	00 00                	add    %al,(%rax)
     6ea:	23 f0                	and    %eax,%esi
     6ec:	06                   	(bad)  
     6ed:	00 00                	add    %al,(%rax)
     6ef:	00 10                	add    %dl,(%rax)
     6f1:	08 32                	or     %dh,(%rdx)
     6f3:	00 00                	add    %al,(%rax)
     6f5:	00 22                	add    %ah,(%rdx)
     6f7:	1c 02                	sbb    $0x2,%al
     6f9:	00 00                	add    %al,(%rax)
     6fb:	06                   	(bad)  
     6fc:	06                   	(bad)  
     6fd:	03 16                	add    (%rsi),%edx
     6ff:	07                   	(bad)  
     700:	00 00                	add    %al,(%rax)
     702:	16                   	(bad)  
     703:	07                   	(bad)  
     704:	00 00                	add    %al,(%rax)
     706:	23 16                	and    (%rsi),%edx
     708:	07                   	(bad)  
     709:	00 00                	add    %al,(%rax)
     70b:	23 03                	and    (%rbx),%eax
     70d:	01 00                	add    %eax,(%rax)
     70f:	00 23                	add    %ah,(%rbx)
     711:	f0 06                	lock (bad) 
     713:	00 00                	add    %al,(%rax)
     715:	00 10                	add    %dl,(%rax)
     717:	08 1c 07             	or     %bl,(%rdi,%rax,1)
     71a:	00 00                	add    %al,(%rax)
     71c:	04 04                	add    $0x4,%al
     71e:	05 48 0a 00 00       	add    $0xa48,%eax
     723:	22 5e 09             	and    0x9(%rsi),%bl
     726:	00 00                	add    %al,(%rax)
     728:	06                   	(bad)  
     729:	f7 02 9c 00 00 00    	testl  $0x9c,(%rdx)
     72f:	3e                   	ds
     730:	07                   	(bad)  
     731:	00 00                	add    %al,(%rax)
     733:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     736:	00 00                	add    %al,(%rax)
     738:	23 f0                	and    %eax,%esi
     73a:	06                   	(bad)  
     73b:	00 00                	add    %al,(%rax)
     73d:	00 22                	add    %ah,(%rdx)
     73f:	65 09 00             	or     %eax,%gs:(%rax)
     742:	00 06                	add    %al,(%rsi)
     744:	0d 03 03 01 00       	or     $0x10303,%eax
     749:	00 59 07             	add    %bl,0x7(%rcx)
     74c:	00 00                	add    %al,(%rax)
     74e:	23 59 07             	and    0x7(%rcx),%ebx
     751:	00 00                	add    %al,(%rax)
     753:	23 f0                	and    %eax,%esi
     755:	06                   	(bad)  
     756:	00 00                	add    %al,(%rax)
     758:	00 10                	add    %dl,(%rax)
     75a:	08 5f 07             	or     %bl,0x7(%rdi)
     75d:	00 00                	add    %al,(%rax)
     75f:	0f 1c 07             	nopl   (%rdi)
     762:	00 00                	add    %al,(%rax)
     764:	22 43 04             	and    0x4(%rbx),%al
     767:	00 00                	add    %al,(%rax)
     769:	06                   	(bad)  
     76a:	4b 02 03             	rex.WXB add (%r11),%al
     76d:	01 00                	add    %eax,(%rax)
     76f:	00 7f 07             	add    %bh,0x7(%rdi)
     772:	00 00                	add    %al,(%rax)
     774:	23 f0                	and    %eax,%esi
     776:	06                   	(bad)  
     777:	00 00                	add    %al,(%rax)
     779:	23 03                	and    (%rbx),%eax
     77b:	01 00                	add    %eax,(%rax)
     77d:	00 00                	add    %al,(%rax)
     77f:	22 bf 04 00 00 06    	and    0x6000004(%rdi),%bh
     785:	52                   	push   %rdx
     786:	02 03                	add    (%rbx),%al
     788:	01 00                	add    %eax,(%rax)
     78a:	00 9b 07 00 00 23    	add    %bl,0x23000007(%rbx)
     790:	f0 06                	lock (bad) 
     792:	00 00                	add    %al,(%rax)
     794:	23 59 07             	and    0x7(%rcx),%ebx
     797:	00 00                	add    %al,(%rax)
     799:	24 00                	and    $0x0,%al
     79b:	22 cf                	and    %bh,%cl
     79d:	09 00                	or     %eax,(%rax)
     79f:	00 06                	add    %al,(%rsi)
     7a1:	7b 02                	jnp    7a5 <_init-0x3ffdb3>
     7a3:	03 01                	add    (%rcx),%eax
     7a5:	00 00                	add    %al,(%rax)
     7a7:	b7 07                	mov    $0x7,%bh
     7a9:	00 00                	add    %al,(%rax)
     7ab:	23 f0                	and    %eax,%esi
     7ad:	06                   	(bad)  
     7ae:	00 00                	add    %al,(%rax)
     7b0:	23 59 07             	and    0x7(%rcx),%ebx
     7b3:	00 00                	add    %al,(%rax)
     7b5:	24 00                	and    $0x0,%al
     7b7:	22 03                	and    (%rbx),%al
     7b9:	02 00                	add    (%rax),%al
     7bb:	00 06                	add    %al,(%rsi)
     7bd:	ea                   	(bad)  
     7be:	02 9c 00 00 00 cd 07 	add    0x7cd0000(%rax,%rax,1),%bl
     7c5:	00 00                	add    %al,(%rax)
     7c7:	23 f0                	and    %eax,%esi
     7c9:	06                   	(bad)  
     7ca:	00 00                	add    %al,(%rax)
     7cc:	00 25 09 02 00 00    	add    %ah,0x209(%rip)        # 9db <_init-0x3ffb7d>
     7d2:	06                   	(bad)  
     7d3:	f0 02 9c 00 00 00 22 	lock add -0x7ede0000(%rax,%rax,1),%bl
     7da:	81 
     7db:	03 00                	add    (%rax),%eax
     7dd:	00 06                	add    %al,(%rsi)
     7df:	78 01                	js     7e2 <_init-0x3ffd76>
     7e1:	8a 00                	mov    (%rax),%al
     7e3:	00 00                	add    %al,(%rax)
     7e5:	f9                   	stc    
     7e6:	07                   	(bad)  
     7e7:	00 00                	add    %al,(%rax)
     7e9:	23 2c 01             	and    (%rcx,%rax,1),%ebp
     7ec:	00 00                	add    %al,(%rax)
     7ee:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     7f4:	f9                   	stc    
     7f5:	07                   	(bad)  
     7f6:	00 00                	add    %al,(%rax)
     7f8:	00 10                	add    %dl,(%rax)
     7fa:	08 15 01 00 00 22    	or     %dl,0x22000001(%rip)        # 22000801 <_end+0x219ff7a9>
     800:	f5                   	cmc    
     801:	00 00                	add    %al,(%rax)
     803:	00 06                	add    %al,(%rsi)
     805:	6d                   	insl   (%dx),%es:(%rdi)
     806:	01 8a 00 00 00 24    	add    %ecx,0x24000000(%rdx)
     80c:	08 00                	or     %al,(%rax)
     80e:	00 23                	add    %ah,(%rbx)
     810:	16                   	(bad)  
     811:	07                   	(bad)  
     812:	00 00                	add    %al,(%rax)
     814:	23 2c 01             	and    (%rcx,%rax,1),%ebp
     817:	00 00                	add    %al,(%rax)
     819:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     81f:	f9                   	stc    
     820:	07                   	(bad)  
     821:	00 00                	add    %al,(%rax)
     823:	00 22                	add    %ah,(%rdx)
     825:	f7                   	(bad)  
     826:	09 00                	or     %eax,(%rax)
     828:	00 06                	add    %al,(%rsi)
     82a:	69 01 03 01 00 00    	imul   $0x103,(%rcx),%eax
     830:	3a 08                	cmp    (%rax),%cl
     832:	00 00                	add    %al,(%rax)
     834:	23 3a                	and    (%rdx),%edi
     836:	08 00                	or     %al,(%rax)
     838:	00 00                	add    %al,(%rax)
     83a:	10 08                	adc    %cl,(%rax)
     83c:	40 08 00             	or     %al,(%rax)
     83f:	00 0f                	add    %cl,(%rdi)
     841:	15 01 00 00 22       	adc    $0x22000001,%eax
     846:	72 09                	jb     851 <_init-0x3ffd07>
     848:	00 00                	add    %al,(%rax)
     84a:	06                   	(bad)  
     84b:	98                   	cwtl   
     84c:	01 8a 00 00 00 6a    	add    %ecx,0x6a000000(%rdx)
     852:	08 00                	or     %al,(%rax)
     854:	00 23                	add    %ah,(%rbx)
     856:	16                   	(bad)  
     857:	07                   	(bad)  
     858:	00 00                	add    %al,(%rax)
     85a:	23 6a 08             	and    0x8(%rdx),%ebp
     85d:	00 00                	add    %al,(%rax)
     85f:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     865:	f9                   	stc    
     866:	07                   	(bad)  
     867:	00 00                	add    %al,(%rax)
     869:	00 10                	add    %dl,(%rax)
     86b:	08 2c 01             	or     %ch,(%rcx,%rax,1)
     86e:	00 00                	add    %al,(%rax)
     870:	22 5f 09             	and    0x9(%rdi),%bl
     873:	00 00                	add    %al,(%rax)
     875:	06                   	(bad)  
     876:	f8                   	clc    
     877:	02 9c 00 00 00 8b 08 	add    0x88b0000(%rax,%rax,1),%bl
     87e:	00 00                	add    %al,(%rax)
     880:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     883:	00 00                	add    %al,(%rax)
     885:	23 f0                	and    %eax,%esi
     887:	06                   	(bad)  
     888:	00 00                	add    %al,(%rax)
     88a:	00 22                	add    %ah,(%rdx)
     88c:	61                   	(bad)  
     88d:	04 00                	add    $0x0,%al
     88f:	00 06                	add    %al,(%rsi)
     891:	fe 02                	incb   (%rdx)
     893:	9c                   	pushfq 
     894:	00 00                	add    %al,(%rax)
     896:	00 a1 08 00 00 23    	add    %ah,0x23000008(%rcx)
     89c:	1c 07                	sbb    $0x7,%al
     89e:	00 00                	add    %al,(%rax)
     8a0:	00 22                	add    %ah,(%rdx)
     8a2:	f5                   	cmc    
     8a3:	03 00                	add    (%rax),%eax
     8a5:	00 06                	add    %al,(%rsi)
     8a7:	5c                   	pop    %rsp
     8a8:	02 03                	add    (%rbx),%al
     8aa:	01 00                	add    %eax,(%rax)
     8ac:	00 c2                	add    %al,%dl
     8ae:	08 00                	or     %al,(%rax)
     8b0:	00 23                	add    %ah,(%rbx)
     8b2:	16                   	(bad)  
     8b3:	07                   	(bad)  
     8b4:	00 00                	add    %al,(%rax)
     8b6:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     8bc:	59                   	pop    %rcx
     8bd:	07                   	(bad)  
     8be:	00 00                	add    %al,(%rax)
     8c0:	24 00                	and    $0x0,%al
     8c2:	22 e7                	and    %bh,%ah
     8c4:	04 00                	add    $0x0,%al
     8c6:	00 06                	add    %al,(%rsi)
     8c8:	85 02                	test   %eax,(%rdx)
     8ca:	03 01                	add    (%rcx),%eax
     8cc:	00 00                	add    %al,(%rax)
     8ce:	de 08                	fimul  (%rax)
     8d0:	00 00                	add    %al,(%rax)
     8d2:	23 59 07             	and    0x7(%rcx),%ebx
     8d5:	00 00                	add    %al,(%rax)
     8d7:	23 59 07             	and    0x7(%rcx),%ebx
     8da:	00 00                	add    %al,(%rax)
     8dc:	24 00                	and    $0x0,%al
     8de:	22 29                	and    (%rcx),%ch
     8e0:	03 00                	add    (%rax),%eax
     8e2:	00 06                	add    %al,(%rsi)
     8e4:	15 03 9c 00 00       	adc    $0x9c03,%eax
     8e9:	00 f9                	add    %bh,%cl
     8eb:	08 00                	or     %al,(%rax)
     8ed:	00 23                	add    %ah,(%rbx)
     8ef:	9c                   	pushfq 
     8f0:	00 00                	add    %al,(%rax)
     8f2:	00 23                	add    %ah,(%rbx)
     8f4:	f0 06                	lock (bad) 
     8f6:	00 00                	add    %al,(%rax)
     8f8:	00 22                	add    %ah,(%rdx)
     8fa:	be 04 00 00 06       	mov    $0x6000004,%esi
     8ff:	64 02 03             	add    %fs:(%rbx),%al
     902:	01 00                	add    %eax,(%rax)
     904:	00 19                	add    %bl,(%rcx)
     906:	09 00                	or     %eax,(%rax)
     908:	00 23                	add    %ah,(%rbx)
     90a:	f0 06                	lock (bad) 
     90c:	00 00                	add    %al,(%rax)
     90e:	23 59 07             	and    0x7(%rcx),%ebx
     911:	00 00                	add    %al,(%rax)
     913:	23 19                	and    (%rcx),%ebx
     915:	09 00                	or     %eax,(%rax)
     917:	00 00                	add    %al,(%rax)
     919:	10 08                	adc    %cl,(%rax)
     91b:	44 00 00             	add    %r8b,(%rax)
     91e:	00 22                	add    %ah,(%rdx)
     920:	ce                   	(bad)  
     921:	09 00                	or     %eax,(%rax)
     923:	00 06                	add    %al,(%rsi)
     925:	b1 02                	mov    $0x2,%cl
     927:	03 01                	add    (%rcx),%eax
     929:	00 00                	add    %al,(%rax)
     92b:	3f                   	(bad)  
     92c:	09 00                	or     %eax,(%rax)
     92e:	00 23                	add    %ah,(%rbx)
     930:	f0 06                	lock (bad) 
     932:	00 00                	add    %al,(%rax)
     934:	23 59 07             	and    0x7(%rcx),%ebx
     937:	00 00                	add    %al,(%rax)
     939:	23 19                	and    (%rcx),%ebx
     93b:	09 00                	or     %eax,(%rax)
     93d:	00 00                	add    %al,(%rax)
     93f:	22 f4                	and    %ah,%dh
     941:	03 00                	add    (%rax),%eax
     943:	00 06                	add    %al,(%rsi)
     945:	71 02                	jno    949 <_init-0x3ffc0f>
     947:	03 01                	add    (%rcx),%eax
     949:	00 00                	add    %al,(%rax)
     94b:	64 09 00             	or     %eax,%fs:(%rax)
     94e:	00 23                	add    %ah,(%rbx)
     950:	16                   	(bad)  
     951:	07                   	(bad)  
     952:	00 00                	add    %al,(%rax)
     954:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     95a:	59                   	pop    %rcx
     95b:	07                   	(bad)  
     95c:	00 00                	add    %al,(%rax)
     95e:	23 19                	and    (%rcx),%ebx
     960:	09 00                	or     %eax,(%rax)
     962:	00 00                	add    %al,(%rax)
     964:	22 e6                	and    %dh,%ah
     966:	04 00                	add    $0x0,%al
     968:	00 06                	add    %al,(%rsi)
     96a:	bd 02 03 01 00       	mov    $0x10302,%ebp
     96f:	00 84 09 00 00 23 59 	add    %al,0x59230000(%rcx,%rcx,1)
     976:	07                   	(bad)  
     977:	00 00                	add    %al,(%rax)
     979:	23 59 07             	and    0x7(%rcx),%ebx
     97c:	00 00                	add    %al,(%rax)
     97e:	23 19                	and    (%rcx),%ebx
     980:	09 00                	or     %eax,(%rax)
     982:	00 00                	add    %al,(%rax)
     984:	22 77 01             	and    0x1(%rdi),%dh
     987:	00 00                	add    %al,(%rax)
     989:	06                   	(bad)  
     98a:	6c                   	insb   (%dx),%es:(%rdi)
     98b:	02 03                	add    (%rbx),%al
     98d:	01 00                	add    %eax,(%rax)
     98f:	00 9f 09 00 00 23    	add    %bl,0x23000009(%rdi)
     995:	59                   	pop    %rcx
     996:	07                   	(bad)  
     997:	00 00                	add    %al,(%rax)
     999:	23 19                	and    (%rcx),%ebx
     99b:	09 00                	or     %eax,(%rax)
     99d:	00 00                	add    %al,(%rax)
     99f:	22 ee                	and    %dh,%ch
     9a1:	08 00                	or     %al,(%rax)
     9a3:	00 06                	add    %al,(%rsi)
     9a5:	b9 02 03 01 00       	mov    $0x10302,%ecx
     9aa:	00 ba 09 00 00 23    	add    %bh,0x23000009(%rdx)
     9b0:	59                   	pop    %rcx
     9b1:	07                   	(bad)  
     9b2:	00 00                	add    %al,(%rax)
     9b4:	23 19                	and    (%rcx),%ebx
     9b6:	09 00                	or     %eax,(%rax)
     9b8:	00 00                	add    %al,(%rax)
     9ba:	22 09                	and    (%rcx),%cl
     9bc:	09 00                	or     %eax,(%rax)
     9be:	00 06                	add    %al,(%rsi)
     9c0:	72 01                	jb     9c3 <_init-0x3ffb95>
     9c2:	8a 00                	mov    (%rax),%al
     9c4:	00 00                	add    %al,(%rax)
     9c6:	da 09                	fimull (%rcx)
     9c8:	00 00                	add    %al,(%rax)
     9ca:	23 da                	and    %edx,%ebx
     9cc:	09 00                	or     %eax,(%rax)
     9ce:	00 23                	add    %ah,(%rbx)
     9d0:	1c 07                	sbb    $0x7,%al
     9d2:	00 00                	add    %al,(%rax)
     9d4:	23 f9                	and    %ecx,%edi
     9d6:	07                   	(bad)  
     9d7:	00 00                	add    %al,(%rax)
     9d9:	00 10                	add    %dl,(%rax)
     9db:	08 fc                	or     %bh,%ah
     9dd:	00 00                	add    %al,(%rax)
     9df:	00 26                	add    %ah,(%rsi)
     9e1:	c1 08 00             	rorl   $0x0,(%rax)
     9e4:	00 06                	add    %al,(%rsi)
     9e6:	9b                   	fwait
     9e7:	16                   	(bad)  
     9e8:	07                   	(bad)  
     9e9:	00 00                	add    %al,(%rax)
     9eb:	fa                   	cli    
     9ec:	09 00                	or     %eax,(%rax)
     9ee:	00 23                	add    %ah,(%rbx)
     9f0:	16                   	(bad)  
     9f1:	07                   	(bad)  
     9f2:	00 00                	add    %al,(%rax)
     9f4:	23 59 07             	and    0x7(%rcx),%ebx
     9f7:	00 00                	add    %al,(%rax)
     9f9:	00 26                	add    %ah,(%rsi)
     9fb:	86 02                	xchg   %al,(%rdx)
     9fd:	00 00                	add    %al,(%rax)
     9ff:	06                   	(bad)  
     a00:	a3 03 01 00 00 14 0a 	movabs %eax,0xa1400000103
     a07:	00 00 
     a09:	23 59 07             	and    0x7(%rcx),%ebx
     a0c:	00 00                	add    %al,(%rax)
     a0e:	23 59 07             	and    0x7(%rcx),%ebx
     a11:	00 00                	add    %al,(%rax)
     a13:	00 26                	add    %ah,(%rsi)
     a15:	1c 01                	sbb    $0x1,%al
     a17:	00 00                	add    %al,(%rax)
     a19:	06                   	(bad)  
     a1a:	c0 03 01             	rolb   $0x1,(%rbx)
     a1d:	00 00                	add    %al,(%rax)
     a1f:	2e 0a 00             	or     %cs:(%rax),%al
     a22:	00 23                	add    %ah,(%rbx)
     a24:	59                   	pop    %rcx
     a25:	07                   	(bad)  
     a26:	00 00                	add    %al,(%rax)
     a28:	23 59 07             	and    0x7(%rcx),%ebx
     a2b:	00 00                	add    %al,(%rax)
     a2d:	00 26                	add    %ah,(%rsi)
     a2f:	ed                   	in     (%dx),%eax
     a30:	03 00                	add    (%rax),%eax
     a32:	00 06                	add    %al,(%rsi)
     a34:	93                   	xchg   %eax,%ebx
     a35:	16                   	(bad)  
     a36:	07                   	(bad)  
     a37:	00 00                	add    %al,(%rax)
     a39:	48 0a 00             	rex.W or (%rax),%al
     a3c:	00 23                	add    %ah,(%rbx)
     a3e:	16                   	(bad)  
     a3f:	07                   	(bad)  
     a40:	00 00                	add    %al,(%rax)
     a42:	23 59 07             	and    0x7(%rcx),%ebx
     a45:	00 00                	add    %al,(%rax)
     a47:	00 26                	add    %ah,(%rsi)
     a49:	91                   	xchg   %eax,%ecx
     a4a:	00 00                	add    %al,(%rax)
     a4c:	00 06                	add    %al,(%rsi)
     a4e:	fc                   	cld    
     a4f:	8a 00                	mov    (%rax),%al
     a51:	00 00                	add    %al,(%rax)
     a53:	62                   	(bad)  
     a54:	0a 00                	or     (%rax),%al
     a56:	00 23                	add    %ah,(%rbx)
     a58:	59                   	pop    %rcx
     a59:	07                   	(bad)  
     a5a:	00 00                	add    %al,(%rax)
     a5c:	23 59 07             	and    0x7(%rcx),%ebx
     a5f:	00 00                	add    %al,(%rax)
     a61:	00 22                	add    %ah,(%rdx)
     a63:	9f                   	lahf   
     a64:	08 00                	or     %al,(%rax)
     a66:	00 06                	add    %al,(%rsi)
     a68:	57                   	push   %rdi
     a69:	03 8a 00 00 00 87    	add    -0x79000000(%rdx),%ecx
     a6f:	0a 00                	or     (%rax),%al
     a71:	00 23                	add    %ah,(%rbx)
     a73:	16                   	(bad)  
     a74:	07                   	(bad)  
     a75:	00 00                	add    %al,(%rax)
     a77:	23 8a 00 00 00 23    	and    0x23000000(%rdx),%ecx
     a7d:	59                   	pop    %rcx
     a7e:	07                   	(bad)  
     a7f:	00 00                	add    %al,(%rax)
     a81:	23 87 0a 00 00 00    	and    0xa(%rdi),%eax
     a87:	10 08                	adc    %cl,(%rax)
     a89:	8d 0a                	lea    (%rdx),%ecx
     a8b:	00 00                	add    %al,(%rax)
     a8d:	0f 92 0a             	setb   (%rdx)
     a90:	00 00                	add    %al,(%rax)
     a92:	27                   	(bad)  
     a93:	74 6d                	je     b02 <_init-0x3ffa56>
     a95:	00 38                	add    %bh,(%rax)
     a97:	0c 85                	or     $0x85,%al
     a99:	22 0b                	and    (%rbx),%cl
     a9b:	00 00                	add    %al,(%rax)
     a9d:	06                   	(bad)  
     a9e:	49 04 00             	rex.WB add $0x0,%al
     aa1:	00 0c 87             	add    %cl,(%rdi,%rax,4)
     aa4:	03 01                	add    (%rcx),%eax
     aa6:	00 00                	add    %al,(%rax)
     aa8:	00 06                	add    %al,(%rsi)
     aaa:	02 06                	add    (%rsi),%al
     aac:	00 00                	add    %al,(%rax)
     aae:	0c 88                	or     $0x88,%al
     ab0:	03 01                	add    (%rcx),%eax
     ab2:	00 00                	add    %al,(%rax)
     ab4:	04 06                	add    $0x6,%al
     ab6:	17                   	(bad)  
     ab7:	00 00                	add    %al,(%rax)
     ab9:	00 0c 89             	add    %cl,(%rcx,%rcx,4)
     abc:	03 01                	add    (%rcx),%eax
     abe:	00 00                	add    %al,(%rax)
     ac0:	08 06                	or     %al,(%rsi)
     ac2:	e5 03                	in     $0x3,%eax
     ac4:	00 00                	add    %al,(%rax)
     ac6:	0c 8a                	or     $0x8a,%al
     ac8:	03 01                	add    (%rcx),%eax
     aca:	00 00                	add    %al,(%rax)
     acc:	0c 06                	or     $0x6,%al
     ace:	43 05 00 00 0c 8b    	rex.XB add $0x8b0c0000,%eax
     ad4:	03 01                	add    (%rcx),%eax
     ad6:	00 00                	add    %al,(%rax)
     ad8:	10 06                	adc    %al,(%rsi)
     ada:	b3 09                	mov    $0x9,%bl
     adc:	00 00                	add    %al,(%rax)
     ade:	0c 8c                	or     $0x8c,%al
     ae0:	03 01                	add    (%rcx),%eax
     ae2:	00 00                	add    %al,(%rax)
     ae4:	14 06                	adc    $0x6,%al
     ae6:	e3 07                	jrcxz  aef <_init-0x3ffa69>
     ae8:	00 00                	add    %al,(%rax)
     aea:	0c 8d                	or     $0x8d,%al
     aec:	03 01                	add    (%rcx),%eax
     aee:	00 00                	add    %al,(%rax)
     af0:	18 06                	sbb    %al,(%rsi)
     af2:	e8 01 00 00 0c       	callq  c000af8 <_end+0xb9ffaa0>
     af7:	8e 03                	mov    (%rbx),%es
     af9:	01 00                	add    %eax,(%rax)
     afb:	00 1c 06             	add    %bl,(%rsi,%rax,1)
     afe:	50                   	push   %rax
     aff:	04 00                	add    $0x0,%al
     b01:	00 0c 8f             	add    %cl,(%rdi,%rcx,4)
     b04:	03 01                	add    (%rcx),%eax
     b06:	00 00                	add    %al,(%rax)
     b08:	20 06                	and    %al,(%rsi)
     b0a:	7b 08                	jnp    b14 <_init-0x3ffa44>
     b0c:	00 00                	add    %al,(%rax)
     b0e:	0c 92                	or     $0x92,%al
     b10:	65                   	gs
     b11:	0c 00                	or     $0x0,%al
     b13:	00 28                	add    %ch,(%rax)
     b15:	06                   	(bad)  
     b16:	e6 08                	out    %al,$0x8
     b18:	00 00                	add    %al,(%rax)
     b1a:	0c 93                	or     $0x93,%al
     b1c:	2c 01                	sub    $0x1,%al
     b1e:	00 00                	add    %al,(%rax)
     b20:	30 00                	xor    %al,(%rax)
     b22:	22 50 08             	and    0x8(%rax),%dl
     b25:	00 00                	add    %al,(%rax)
     b27:	06                   	(bad)  
     b28:	1f                   	(bad)  
     b29:	01 8a 00 00 00 38    	add    %ecx,0x38000000(%rdx)
     b2f:	0b 00                	or     (%rax),%eax
     b31:	00 23                	add    %ah,(%rbx)
     b33:	59                   	pop    %rcx
     b34:	07                   	(bad)  
     b35:	00 00                	add    %al,(%rax)
     b37:	00 26                	add    %ah,(%rsi)
     b39:	17                   	(bad)  
     b3a:	09 00                	or     %eax,(%rax)
     b3c:	00 06                	add    %al,(%rsi)
     b3e:	9e                   	sahf   
     b3f:	16                   	(bad)  
     b40:	07                   	(bad)  
     b41:	00 00                	add    %al,(%rax)
     b43:	57                   	push   %rdi
     b44:	0b 00                	or     (%rax),%eax
     b46:	00 23                	add    %ah,(%rbx)
     b48:	16                   	(bad)  
     b49:	07                   	(bad)  
     b4a:	00 00                	add    %al,(%rax)
     b4c:	23 59 07             	and    0x7(%rcx),%ebx
     b4f:	00 00                	add    %al,(%rax)
     b51:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     b57:	26                   	es
     b58:	ea                   	(bad)  
     b59:	02 00                	add    (%rax),%al
     b5b:	00 06                	add    %al,(%rsi)
     b5d:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
     b5e:	03 01                	add    (%rcx),%eax
     b60:	00 00                	add    %al,(%rax)
     b62:	76 0b                	jbe    b6f <_init-0x3ff9e9>
     b64:	00 00                	add    %al,(%rax)
     b66:	23 59 07             	and    0x7(%rcx),%ebx
     b69:	00 00                	add    %al,(%rax)
     b6b:	23 59 07             	and    0x7(%rcx),%ebx
     b6e:	00 00                	add    %al,(%rax)
     b70:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     b76:	26                   	es
     b77:	59                   	pop    %rcx
     b78:	04 00                	add    $0x0,%al
     b7a:	00 06                	add    %al,(%rsi)
     b7c:	96                   	xchg   %eax,%esi
     b7d:	16                   	(bad)  
     b7e:	07                   	(bad)  
     b7f:	00 00                	add    %al,(%rax)
     b81:	95                   	xchg   %eax,%ebp
     b82:	0b 00                	or     (%rax),%eax
     b84:	00 23                	add    %ah,(%rbx)
     b86:	16                   	(bad)  
     b87:	07                   	(bad)  
     b88:	00 00                	add    %al,(%rax)
     b8a:	23 59 07             	and    0x7(%rcx),%ebx
     b8d:	00 00                	add    %al,(%rax)
     b8f:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     b95:	22 d9                	and    %cl,%bl
     b97:	07                   	(bad)  
     b98:	00 00                	add    %al,(%rax)
     b9a:	06                   	(bad)  
     b9b:	9e                   	sahf   
     b9c:	01 8a 00 00 00 ba    	add    %ecx,-0x46000000(%rdx)
     ba2:	0b 00                	or     (%rax),%eax
     ba4:	00 23                	add    %ah,(%rbx)
     ba6:	da 09                	fimull (%rcx)
     ba8:	00 00                	add    %al,(%rax)
     baa:	23 ba 0b 00 00 23    	and    0x2300000b(%rdx),%edi
     bb0:	8a 00                	mov    (%rax),%al
     bb2:	00 00                	add    %al,(%rax)
     bb4:	23 f9                	and    %ecx,%edi
     bb6:	07                   	(bad)  
     bb7:	00 00                	add    %al,(%rax)
     bb9:	00 10                	add    %dl,(%rax)
     bbb:	08 59 07             	or     %bl,0x7(%rcx)
     bbe:	00 00                	add    %al,(%rax)
     bc0:	22 65 06             	and    0x6(%rbp),%ah
     bc3:	00 00                	add    %al,(%rax)
     bc5:	06                   	(bad)  
     bc6:	00 01                	add    %al,(%rcx)
     bc8:	8a 00                	mov    (%rax),%al
     bca:	00 00                	add    %al,(%rax)
     bcc:	db 0b                	fisttpl (%rbx)
     bce:	00 00                	add    %al,(%rax)
     bd0:	23 59 07             	and    0x7(%rcx),%ebx
     bd3:	00 00                	add    %al,(%rax)
     bd5:	23 59 07             	and    0x7(%rcx),%ebx
     bd8:	00 00                	add    %al,(%rax)
     bda:	00 22                	add    %ah,(%rdx)
     bdc:	ff 07                	incl   (%rdi)
     bde:	00 00                	add    %al,(%rax)
     be0:	06                   	(bad)  
     be1:	c2 01 f6             	retq   $0xf601
     be4:	0b 00                	or     (%rax),%eax
     be6:	00 f6                	add    %dh,%dh
     be8:	0b 00                	or     (%rax),%eax
     bea:	00 23                	add    %ah,(%rbx)
     bec:	59                   	pop    %rcx
     bed:	07                   	(bad)  
     bee:	00 00                	add    %al,(%rax)
     bf0:	23 fd                	and    %ebp,%edi
     bf2:	0b 00                	or     (%rax),%eax
     bf4:	00 00                	add    %al,(%rax)
     bf6:	04 08                	add    $0x8,%al
     bf8:	04 c8                	add    $0xc8,%al
     bfa:	06                   	(bad)  
     bfb:	00 00                	add    %al,(%rax)
     bfd:	10 08                	adc    %cl,(%rax)
     bff:	16                   	(bad)  
     c00:	07                   	(bad)  
     c01:	00 00                	add    %al,(%rax)
     c03:	22 06                	and    (%rsi),%al
     c05:	08 00                	or     %al,(%rax)
     c07:	00 06                	add    %al,(%rsi)
     c09:	c9                   	leaveq 
     c0a:	01 1e                	add    %ebx,(%rsi)
     c0c:	0c 00                	or     $0x0,%al
     c0e:	00 1e                	add    %bl,(%rsi)
     c10:	0c 00                	or     $0x0,%al
     c12:	00 23                	add    %ah,(%rbx)
     c14:	59                   	pop    %rcx
     c15:	07                   	(bad)  
     c16:	00 00                	add    %al,(%rax)
     c18:	23 fd                	and    %ebp,%edi
     c1a:	0b 00                	or     (%rax),%eax
     c1c:	00 00                	add    %al,(%rax)
     c1e:	04 04                	add    $0x4,%al
     c20:	04 fc                	add    $0xfc,%al
     c22:	05 00 00 22 0d       	add    $0xd220000,%eax
     c27:	08 00                	or     %al,(%rax)
     c29:	00 06                	add    %al,(%rsi)
     c2b:	1a 01                	sbb    (%rcx),%al
     c2d:	16                   	(bad)  
     c2e:	07                   	(bad)  
     c2f:	00 00                	add    %al,(%rax)
     c31:	45 0c 00             	rex.RB or $0x0,%al
     c34:	00 23                	add    %ah,(%rbx)
     c36:	16                   	(bad)  
     c37:	07                   	(bad)  
     c38:	00 00                	add    %al,(%rax)
     c3a:	23 59 07             	and    0x7(%rcx),%ebx
     c3d:	00 00                	add    %al,(%rax)
     c3f:	23 fd                	and    %ebp,%edi
     c41:	0b 00                	or     (%rax),%eax
     c43:	00 00                	add    %al,(%rax)
     c45:	22 14 08             	and    (%rax,%rcx,1),%dl
     c48:	00 00                	add    %al,(%rax)
     c4a:	06                   	(bad)  
     c4b:	d4                   	(bad)  
     c4c:	01 65 0c             	add    %esp,0xc(%rbp)
     c4f:	00 00                	add    %al,(%rax)
     c51:	65                   	gs
     c52:	0c 00                	or     $0x0,%al
     c54:	00 23                	add    %ah,(%rbx)
     c56:	59                   	pop    %rcx
     c57:	07                   	(bad)  
     c58:	00 00                	add    %al,(%rax)
     c5a:	23 fd                	and    %ebp,%edi
     c5c:	0b 00                	or     (%rax),%eax
     c5e:	00 23                	add    %ah,(%rbx)
     c60:	03 01                	add    (%rcx),%eax
     c62:	00 00                	add    %al,(%rax)
     c64:	00 04 08             	add    %al,(%rax,%rcx,1)
     c67:	05 55 09 00 00       	add    $0x955,%eax
     c6c:	22 74 0a 00          	and    0x0(%rdx,%rcx,1),%dh
     c70:	00 06                	add    %al,(%rsi)
     c72:	d9 01                	flds   (%rcx)
     c74:	95                   	xchg   %eax,%ebp
     c75:	00 00                	add    %al,(%rax)
     c77:	00 8c 0c 00 00 23 59 	add    %cl,0x59230000(%rsp,%rcx,1)
     c7e:	07                   	(bad)  
     c7f:	00 00                	add    %al,(%rax)
     c81:	23 fd                	and    %ebp,%edi
     c83:	0b 00                	or     (%rax),%eax
     c85:	00 23                	add    %ah,(%rbx)
     c87:	03 01                	add    (%rcx),%eax
     c89:	00 00                	add    %al,(%rax)
     c8b:	00 26                	add    %ah,(%rsi)
     c8d:	fd                   	std    
     c8e:	00 00                	add    %al,(%rax)
     c90:	00 06                	add    %al,(%rsi)
     c92:	c4                   	(bad)  
     c93:	8a 00                	mov    (%rax),%al
     c95:	00 00                	add    %al,(%rax)
     c97:	ab                   	stos   %eax,%es:(%rdi)
     c98:	0c 00                	or     $0x0,%al
     c9a:	00 23                	add    %ah,(%rbx)
     c9c:	16                   	(bad)  
     c9d:	07                   	(bad)  
     c9e:	00 00                	add    %al,(%rax)
     ca0:	23 59 07             	and    0x7(%rcx),%ebx
     ca3:	00 00                	add    %al,(%rax)
     ca5:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     cab:	22 91 05 00 00 06    	and    0x6000005(%rcx),%dl
     cb1:	65 01 03             	add    %eax,%gs:(%rbx)
     cb4:	01 00                	add    %eax,(%rax)
     cb6:	00 c1                	add    %al,%cl
     cb8:	0c 00                	or     $0x0,%al
     cba:	00 23                	add    %ah,(%rbx)
     cbc:	9c                   	pushfq 
     cbd:	00 00                	add    %al,(%rax)
     cbf:	00 00                	add    %al,(%rax)
     cc1:	22 6a 04             	and    0x4(%rdx),%ch
     cc4:	00 00                	add    %al,(%rax)
     cc6:	06                   	(bad)  
     cc7:	45 01 03             	add    %r8d,(%r11)
     cca:	01 00                	add    %eax,(%rax)
     ccc:	00 e1                	add    %ah,%cl
     cce:	0c 00                	or     $0x0,%al
     cd0:	00 23                	add    %ah,(%rbx)
     cd2:	59                   	pop    %rcx
     cd3:	07                   	(bad)  
     cd4:	00 00                	add    %al,(%rax)
     cd6:	23 59 07             	and    0x7(%rcx),%ebx
     cd9:	00 00                	add    %al,(%rax)
     cdb:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     ce1:	22 3b                	and    (%rbx),%bh
     ce3:	05 00 00 06 49       	add    $0x49060000,%eax
     ce8:	01 16                	add    %edx,(%rsi)
     cea:	07                   	(bad)  
     ceb:	00 00                	add    %al,(%rax)
     ced:	01 0d 00 00 23 16    	add    %ecx,0x16230000(%rip)        # 16230cf3 <_end+0x15c2fc9b>
     cf3:	07                   	(bad)  
     cf4:	00 00                	add    %al,(%rax)
     cf6:	23 59 07             	and    0x7(%rcx),%ebx
     cf9:	00 00                	add    %al,(%rax)
     cfb:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     d01:	22 02                	and    (%rdx),%al
     d03:	03 00                	add    (%rax),%eax
     d05:	00 06                	add    %al,(%rsi)
     d07:	4e 01 16             	rex.WRX add %r10,(%rsi)
     d0a:	07                   	(bad)  
     d0b:	00 00                	add    %al,(%rax)
     d0d:	21 0d 00 00 23 16    	and    %ecx,0x16230000(%rip)        # 16230d13 <_end+0x15c2fcbb>
     d13:	07                   	(bad)  
     d14:	00 00                	add    %al,(%rax)
     d16:	23 59 07             	and    0x7(%rcx),%ebx
     d19:	00 00                	add    %al,(%rax)
     d1b:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     d21:	22 fe                	and    %dh,%bh
     d23:	03 00                	add    (%rax),%eax
     d25:	00 06                	add    %al,(%rsi)
     d27:	52                   	push   %rdx
     d28:	01 16                	add    %edx,(%rsi)
     d2a:	07                   	(bad)  
     d2b:	00 00                	add    %al,(%rax)
     d2d:	41 0d 00 00 23 16    	rex.B or $0x16230000,%eax
     d33:	07                   	(bad)  
     d34:	00 00                	add    %al,(%rax)
     d36:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     d39:	00 00                	add    %al,(%rax)
     d3b:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     d41:	22 c0                	and    %al,%al
     d43:	04 00                	add    $0x0,%al
     d45:	00 06                	add    %al,(%rsi)
     d47:	59                   	pop    %rcx
     d48:	02 03                	add    (%rbx),%al
     d4a:	01 00                	add    %eax,(%rax)
     d4c:	00 58 0d             	add    %bl,0xd(%rax)
     d4f:	00 00                	add    %al,(%rax)
     d51:	23 59 07             	and    0x7(%rcx),%ebx
     d54:	00 00                	add    %al,(%rax)
     d56:	24 00                	and    $0x0,%al
     d58:	22 d0                	and    %al,%dl
     d5a:	09 00                	or     %eax,(%rax)
     d5c:	00 06                	add    %al,(%rsi)
     d5e:	82                   	(bad)  
     d5f:	02 03                	add    (%rbx),%al
     d61:	01 00                	add    %eax,(%rax)
     d63:	00 6f 0d             	add    %ch,0xd(%rdi)
     d66:	00 00                	add    %al,(%rax)
     d68:	23 59 07             	and    0x7(%rcx),%ebx
     d6b:	00 00                	add    %al,(%rax)
     d6d:	24 00                	and    $0x0,%al
     d6f:	28 db                	sub    %bl,%bl
     d71:	00 00                	add    %al,(%rax)
     d73:	00 06                	add    %al,(%rsi)
     d75:	e0 db                	loopne d52 <_init-0x3ff806>
     d77:	00 00                	add    %al,(%rax)
     d79:	00 59 07             	add    %bl,0x7(%rcx)
     d7c:	00 00                	add    %al,(%rax)
     d7e:	8d 0d 00 00 23 59    	lea    0x59230000(%rip),%ecx        # 59230d84 <_end+0x58c2fd2c>
     d84:	07                   	(bad)  
     d85:	00 00                	add    %al,(%rax)
     d87:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     d8a:	00 00                	add    %al,(%rax)
     d8c:	00 29                	add    %ch,(%rcx)
     d8e:	8d 02                	lea    (%rdx),%eax
     d90:	00 00                	add    %al,(%rax)
     d92:	06                   	(bad)  
     d93:	06                   	(bad)  
     d94:	01 8d 02 00 00 59    	add    %ecx,0x59000002(%rbp)
     d9a:	07                   	(bad)  
     d9b:	00 00                	add    %al,(%rax)
     d9d:	ac                   	lods   %ds:(%rsi),%al
     d9e:	0d 00 00 23 59       	or     $0x59230000,%eax
     da3:	07                   	(bad)  
     da4:	00 00                	add    %al,(%rax)
     da6:	23 59 07             	and    0x7(%rcx),%ebx
     da9:	00 00                	add    %al,(%rax)
     dab:	00 28                	add    %ch,(%rax)
     dad:	3e 01 00             	add    %eax,%ds:(%rax)
     db0:	00 06                	add    %al,(%rsi)
     db2:	ea                   	(bad)  
     db3:	3e 01 00             	add    %eax,%ds:(%rax)
     db6:	00 59 07             	add    %bl,0x7(%rcx)
     db9:	00 00                	add    %al,(%rax)
     dbb:	ca 0d 00             	lret   $0xd
     dbe:	00 23                	add    %ah,(%rbx)
     dc0:	59                   	pop    %rcx
     dc1:	07                   	(bad)  
     dc2:	00 00                	add    %al,(%rax)
     dc4:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     dc7:	00 00                	add    %al,(%rax)
     dc9:	00 29                	add    %ch,(%rcx)
     dcb:	93                   	xchg   %eax,%ebx
     dcc:	07                   	(bad)  
     dcd:	00 00                	add    %al,(%rax)
     dcf:	06                   	(bad)  
     dd0:	11 01                	adc    %eax,(%rcx)
     dd2:	93                   	xchg   %eax,%ebx
     dd3:	07                   	(bad)  
     dd4:	00 00                	add    %al,(%rax)
     dd6:	59                   	pop    %rcx
     dd7:	07                   	(bad)  
     dd8:	00 00                	add    %al,(%rax)
     dda:	e9 0d 00 00 23       	jmpq   23000dec <_end+0x229ffd94>
     ddf:	59                   	pop    %rcx
     de0:	07                   	(bad)  
     de1:	00 00                	add    %al,(%rax)
     de3:	23 59 07             	and    0x7(%rcx),%ebx
     de6:	00 00                	add    %al,(%rax)
     de8:	00 29                	add    %ch,(%rcx)
     dea:	3a 02                	cmp    (%rdx),%al
     dec:	00 00                	add    %al,(%rax)
     dee:	06                   	(bad)  
     def:	3c 01                	cmp    $0x1,%al
     df1:	3a 02                	cmp    (%rdx),%al
     df3:	00 00                	add    %al,(%rax)
     df5:	59                   	pop    %rcx
     df6:	07                   	(bad)  
     df7:	00 00                	add    %al,(%rax)
     df9:	0d 0e 00 00 23       	or     $0x2300000e,%eax
     dfe:	59                   	pop    %rcx
     dff:	07                   	(bad)  
     e00:	00 00                	add    %al,(%rax)
     e02:	23 1c 07             	and    (%rdi,%rax,1),%ebx
     e05:	00 00                	add    %al,(%rax)
     e07:	23 8a 00 00 00 00    	and    0x0(%rdx),%ecx
     e0d:	2a b4 06 00 00 07 f2 	sub    -0xdf90000(%rsi,%rax,1),%dh
     e14:	84 0f                	test   %cl,(%rdi)
     e16:	00 00                	add    %al,(%rax)
     e18:	12 07                	adc    (%rdi),%al
     e1a:	f8                   	clc    
     e1b:	84 0f                	test   %cl,(%rdi)
     e1d:	00 00                	add    %al,(%rax)
     e1f:	13 07                	adc    (%rdi),%eax
     e21:	01 01                	add    %eax,(%rcx)
     e23:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
     e24:	0f 00 00             	sldt   (%rax)
     e27:	13 07                	adc    (%rdi),%eax
     e29:	02 01                	add    (%rcx),%al
     e2b:	cd 0f                	int    $0xf
     e2d:	00 00                	add    %al,(%rax)
     e2f:	12 0d 2c f7 02 00    	adc    0x2f72c(%rip),%cl        # 30561 <_init-0x3cfff7>
     e35:	00 12                	add    %dl,(%rdx)
     e37:	0d 2d 17 03 00       	or     $0x3172d,%eax
     e3c:	00 05 3b 00 00 00    	add    %al,0x3b(%rip)        # e7d <_init-0x3ff6db>
     e42:	01 0e                	add    %ecx,(%rsi)
     e44:	37                   	(bad)  
     e45:	7f 0e                	jg     e55 <_init-0x3ff703>
     e47:	00 00                	add    %al,(%rax)
     e49:	2b 0b                	sub    (%rbx),%ecx
     e4b:	03 00                	add    (%rax),%eax
     e4d:	00 0e                	add    %cl,(%rsi)
     e4f:	3a 27                	cmp    (%rdi),%ah
     e51:	01 00                	add    %eax,(%rax)
     e53:	00 2b                	add    %ch,(%rbx)
     e55:	8b 00                	mov    (%rax),%eax
     e57:	00 00                	add    %al,(%rax)
     e59:	0e                   	(bad)  
     e5a:	3b 27                	cmp    (%rdi),%esp
     e5c:	01 00                	add    %eax,(%rax)
     e5e:	00 2b                	add    %ch,(%rbx)
     e60:	c7 02 00 00 0e 3f    	movl   $0x3f0e0000,(%rdx)
     e66:	91                   	xchg   %eax,%ecx
     e67:	11 00                	adc    %eax,(%rax)
     e69:	00 2b                	add    %ch,(%rbx)
     e6b:	f6 07 00             	testb  $0x0,(%rdi)
     e6e:	00 0e                	add    %cl,(%rsi)
     e70:	40 27                	rex (bad) 
     e72:	01 00                	add    %eax,(%rax)
     e74:	00 2c d7             	add    %ch,(%rdi,%rdx,8)
     e77:	01 00                	add    %eax,(%rax)
     e79:	00 03                	add    %al,(%rbx)
     e7b:	01 00                	add    %eax,(%rax)
     e7d:	00 00                	add    %al,(%rax)
     e7f:	05 87 09 00 00       	add    $0x987,%eax
     e84:	01 0e                	add    %ecx,(%rsi)
     e86:	37                   	(bad)  
     e87:	c1 0e 00             	rorl   $0x0,(%rsi)
     e8a:	00 2b                	add    %ch,(%rbx)
     e8c:	0b 03                	or     (%rbx),%eax
     e8e:	00 00                	add    %al,(%rax)
     e90:	0e                   	(bad)  
     e91:	3a 96 11 00 00 2b    	cmp    0x2b000011(%rsi),%dl
     e97:	8b 00                	mov    (%rax),%eax
     e99:	00 00                	add    %al,(%rax)
     e9b:	0e                   	(bad)  
     e9c:	3b 96 11 00 00 2b    	cmp    0x2b000011(%rsi),%edx
     ea2:	c7 02 00 00 0e 3f    	movl   $0x3f0e0000,(%rdx)
     ea8:	91                   	xchg   %eax,%ecx
     ea9:	11 00                	adc    %eax,(%rax)
     eab:	00 2b                	add    %ch,(%rbx)
     ead:	f6 07 00             	testb  $0x0,(%rdi)
     eb0:	00 0e                	add    %cl,(%rsi)
     eb2:	40 27                	rex (bad) 
     eb4:	01 00                	add    %eax,(%rax)
     eb6:	00 2c d7             	add    %ch,(%rdi,%rdx,8)
     eb9:	01 00                	add    %eax,(%rax)
     ebb:	00 95 00 00 00 00    	add    %dl,0x0(%rbp)
     ec1:	05 58 01 00 00       	add    $0x158,%eax
     ec6:	01 0e                	add    %ecx,(%rsi)
     ec8:	37                   	(bad)  
     ec9:	03 0f                	add    (%rdi),%ecx
     ecb:	00 00                	add    %al,(%rax)
     ecd:	2b 0b                	sub    (%rbx),%ecx
     ecf:	03 00                	add    (%rax),%eax
     ed1:	00 0e                	add    %cl,(%rsi)
     ed3:	3a 32                	cmp    (%rdx),%dh
     ed5:	01 00                	add    %eax,(%rax)
     ed7:	00 2b                	add    %ch,(%rbx)
     ed9:	8b 00                	mov    (%rax),%eax
     edb:	00 00                	add    %al,(%rax)
     edd:	0e                   	(bad)  
     ede:	3b 32                	cmp    (%rdx),%esi
     ee0:	01 00                	add    %eax,(%rax)
     ee2:	00 2b                	add    %ch,(%rbx)
     ee4:	c7 02 00 00 0e 3f    	movl   $0x3f0e0000,(%rdx)
     eea:	91                   	xchg   %eax,%ecx
     eeb:	11 00                	adc    %eax,(%rax)
     eed:	00 2b                	add    %ch,(%rbx)
     eef:	f6 07 00             	testb  $0x0,(%rdi)
     ef2:	00 0e                	add    %cl,(%rsi)
     ef4:	40 27                	rex (bad) 
     ef6:	01 00                	add    %eax,(%rax)
     ef8:	00 2c d7             	add    %ch,(%rdi,%rdx,8)
     efb:	01 00                	add    %eax,(%rax)
     efd:	00 fc                	add    %bh,%ah
     eff:	00 00                	add    %al,(%rax)
     f01:	00 00                	add    %al,(%rax)
     f03:	05 1f 09 00 00       	add    $0x91f,%eax
     f08:	01 0e                	add    %ecx,(%rsi)
     f0a:	37                   	(bad)  
     f0b:	45 0f 00 00          	rex.RB sldt (%r8)
     f0f:	2b 0b                	sub    (%rbx),%ecx
     f11:	03 00                	add    (%rax),%eax
     f13:	00 0e                	add    %cl,(%rsi)
     f15:	3a 20                	cmp    (%rax),%ah
     f17:	12 00                	adc    (%rax),%al
     f19:	00 2b                	add    %ch,(%rbx)
     f1b:	8b 00                	mov    (%rax),%eax
     f1d:	00 00                	add    %al,(%rax)
     f1f:	0e                   	(bad)  
     f20:	3b 20                	cmp    (%rax),%esp
     f22:	12 00                	adc    (%rax),%al
     f24:	00 2b                	add    %ch,(%rbx)
     f26:	c7 02 00 00 0e 3f    	movl   $0x3f0e0000,(%rdx)
     f2c:	91                   	xchg   %eax,%ecx
     f2d:	11 00                	adc    %eax,(%rax)
     f2f:	00 2b                	add    %ch,(%rbx)
     f31:	f6 07 00             	testb  $0x0,(%rdi)
     f34:	00 0e                	add    %cl,(%rsi)
     f36:	40 27                	rex (bad) 
     f38:	01 00                	add    %eax,(%rax)
     f3a:	00 2c d7             	add    %ch,(%rdi,%rdx,8)
     f3d:	01 00                	add    %eax,(%rax)
     f3f:	00 02                	add    %al,(%rdx)
     f41:	10 00                	adc    %al,(%rax)
     f43:	00 00                	add    %al,(%rax)
     f45:	2d cf 06 00 00       	sub    $0x6cf,%eax
     f4a:	01 0e                	add    %ecx,(%rsi)
     f4c:	37                   	(bad)  
     f4d:	2b 0b                	sub    (%rbx),%ecx
     f4f:	03 00                	add    (%rax),%eax
     f51:	00 0e                	add    %cl,(%rsi)
     f53:	3a 25 12 00 00 2b    	cmp    0x2b000012(%rip),%ah        # 2b000f6b <_end+0x2a9fff13>
     f59:	8b 00                	mov    (%rax),%eax
     f5b:	00 00                	add    %al,(%rax)
     f5d:	0e                   	(bad)  
     f5e:	3b 25 12 00 00 2b    	cmp    0x2b000012(%rip),%esp        # 2b000f76 <_end+0x2a9fff1e>
     f64:	c7 02 00 00 0e 3f    	movl   $0x3f0e0000,(%rdx)
     f6a:	91                   	xchg   %eax,%ecx
     f6b:	11 00                	adc    %eax,(%rax)
     f6d:	00 2b                	add    %ch,(%rbx)
     f6f:	f6 07 00             	testb  $0x0,(%rdi)
     f72:	00 0e                	add    %cl,(%rsi)
     f74:	40 27                	rex (bad) 
     f76:	01 00                	add    %eax,(%rax)
     f78:	00 2c d7             	add    %ch,(%rdi,%rdx,8)
     f7b:	01 00                	add    %eax,(%rax)
     f7d:	00 65 0c             	add    %ah,0xc(%rbp)
     f80:	00 00                	add    %al,(%rax)
     f82:	00 00                	add    %al,(%rax)
     f84:	22 5d 07             	and    0x7(%rbp),%bl
     f87:	00 00                	add    %al,(%rax)
     f89:	06                   	(bad)  
     f8a:	cb                   	lret   
     f8b:	01 9f 0f 00 00 9f    	add    %ebx,-0x60fffff1(%rdi)
     f91:	0f 00 00             	sldt   (%rax)
     f94:	23 59 07             	and    0x7(%rcx),%ebx
     f97:	00 00                	add    %al,(%rax)
     f99:	23 fd                	and    %ebp,%edi
     f9b:	0b 00                	or     (%rax),%eax
     f9d:	00 00                	add    %al,(%rax)
     f9f:	04 10                	add    $0x10,%al
     fa1:	04 c3                	add    $0xc3,%al
     fa3:	06                   	(bad)  
     fa4:	00 00                	add    %al,(%rax)
     fa6:	22 8b 07 00 00 06    	and    0x6000007(%rbx),%cl
     fac:	e3 01                	jrcxz  faf <_init-0x3ff5a9>
     fae:	c6                   	(bad)  
     faf:	0f 00 00             	sldt   (%rax)
     fb2:	c6                   	(bad)  
     fb3:	0f 00 00             	sldt   (%rax)
     fb6:	23 59 07             	and    0x7(%rcx),%ebx
     fb9:	00 00                	add    %al,(%rax)
     fbb:	23 fd                	and    %ebp,%edi
     fbd:	0b 00                	or     (%rax),%eax
     fbf:	00 23                	add    %ah,(%rbx)
     fc1:	03 01                	add    (%rcx),%eax
     fc3:	00 00                	add    %al,(%rax)
     fc5:	00 04 08             	add    %al,(%rax,%rcx,1)
     fc8:	05 50 09 00 00       	add    $0x950,%eax
     fcd:	22 c2                	and    %dl,%al
     fcf:	03 00                	add    (%rax),%eax
     fd1:	00 06                	add    %al,(%rsi)
     fd3:	ea                   	(bad)  
     fd4:	01 ed                	add    %ebp,%ebp
     fd6:	0f 00 00             	sldt   (%rax)
     fd9:	ed                   	in     (%dx),%eax
     fda:	0f 00 00             	sldt   (%rax)
     fdd:	23 59 07             	and    0x7(%rcx),%ebx
     fe0:	00 00                	add    %al,(%rax)
     fe2:	23 fd                	and    %ebp,%edi
     fe4:	0b 00                	or     (%rax),%eax
     fe6:	00 23                	add    %ah,(%rbx)
     fe8:	03 01                	add    (%rcx),%eax
     fea:	00 00                	add    %al,(%rax)
     fec:	00 04 08             	add    %al,(%rax,%rcx,1)
     fef:	07                   	(bad)  
     ff0:	38 07                	cmp    %al,(%rdi)
     ff2:	00 00                	add    %al,(%rax)
     ff4:	04 01                	add    $0x1,%al
     ff6:	08 2c 02             	or     %ch,(%rdx,%rax,1)
     ff9:	00 00                	add    %al,(%rax)
     ffb:	04 01                	add    $0x1,%al
     ffd:	06                   	(bad)  
     ffe:	2e 02 00             	add    %cs:(%rax),%al
    1001:	00 04 02             	add    %al,(%rdx,%rax,1)
    1004:	05 95 08 00 00       	add    $0x895,%eax
    1009:	2a b2 04 00 00 0f    	sub    0xf000004(%rdx),%dh
    100f:	37                   	(bad)  
    1010:	1c 10                	sbb    $0x10,%al
    1012:	00 00                	add    %al,(%rax)
    1014:	2e 0f 38 f0 02       	movbe  %cs:(%rdx),%eax
    1019:	00 00                	add    %al,(%rax)
    101b:	00 04 01             	add    %al,(%rcx,%rax,1)
    101e:	02 be 06 00 00 05    	add    0x5000006(%rsi),%bh
    1024:	11 09                	adc    %ecx,(%rcx)
    1026:	00 00                	add    %al,(%rax)
    1028:	60                   	(bad)  
    1029:	10 35 50 11 00 00    	adc    %dh,0x1150(%rip)        # 217f <_init-0x3fe3d9>
    102f:	06                   	(bad)  
    1030:	4a 01 00             	rex.WX add %rax,(%rax)
    1033:	00 10                	add    %dl,(%rax)
    1035:	39 da                	cmp    %ebx,%edx
    1037:	09 00                	or     %eax,(%rax)
    1039:	00 00                	add    %al,(%rax)
    103b:	06                   	(bad)  
    103c:	1b 03                	sbb    (%rbx),%eax
    103e:	00 00                	add    %al,(%rax)
    1040:	10 3a                	adc    %bh,(%rdx)
    1042:	da 09                	fimull (%rcx)
    1044:	00 00                	add    %al,(%rax)
    1046:	08 06                	or     %al,(%rsi)
    1048:	b1 08                	mov    $0x8,%cl
    104a:	00 00                	add    %al,(%rax)
    104c:	10 40 da             	adc    %al,-0x26(%rax)
    104f:	09 00                	or     %eax,(%rax)
    1051:	00 10                	add    %dl,(%rax)
    1053:	06                   	(bad)  
    1054:	cb                   	lret   
    1055:	00 00                	add    %al,(%rax)
    1057:	00 10                	add    %dl,(%rax)
    1059:	46 da 09             	rex.RX fimull (%rcx)
    105c:	00 00                	add    %al,(%rax)
    105e:	18 06                	sbb    %al,(%rsi)
    1060:	85 08                	test   %ecx,(%rax)
    1062:	00 00                	add    %al,(%rax)
    1064:	10 47 da             	adc    %al,-0x26(%rdi)
    1067:	09 00                	or     %eax,(%rax)
    1069:	00 20                	add    %ah,(%rax)
    106b:	06                   	(bad)  
    106c:	46 01 00             	rex.RX add %r8d,(%rax)
    106f:	00 10                	add    %dl,(%rax)
    1071:	48 da 09             	rex.W fimull (%rcx)
    1074:	00 00                	add    %al,(%rax)
    1076:	28 06                	sub    %al,(%rsi)
    1078:	17                   	(bad)  
    1079:	03 00                	add    (%rax),%eax
    107b:	00 10                	add    %dl,(%rax)
    107d:	49 da 09             	rex.WB fimull (%r9)
    1080:	00 00                	add    %al,(%rax)
    1082:	30 06                	xor    %al,(%rsi)
    1084:	ad                   	lods   %ds:(%rsi),%eax
    1085:	08 00                	or     %al,(%rax)
    1087:	00 10                	add    %dl,(%rax)
    1089:	4a da 09             	rex.WX fimull (%rcx)
    108c:	00 00                	add    %al,(%rax)
    108e:	38 06                	cmp    %al,(%rsi)
    1090:	d7                   	xlat   %ds:(%rbx)
    1091:	03 00                	add    (%rax),%eax
    1093:	00 10                	add    %dl,(%rax)
    1095:	4b da 09             	rex.WXB fimull (%r9)
    1098:	00 00                	add    %al,(%rax)
    109a:	40 06                	rex (bad) 
    109c:	88 03                	mov    %al,(%rbx)
    109e:	00 00                	add    %al,(%rax)
    10a0:	10 4c da 09          	adc    %cl,0x9(%rdx,%rbx,8)
    10a4:	00 00                	add    %al,(%rax)
    10a6:	48 06                	rex.W (bad) 
    10a8:	05 01 00 00 10       	add    $0x10000001,%eax
    10ad:	4d fc                	rex.WRB cld 
    10af:	00 00                	add    %al,(%rax)
    10b1:	00 50 06             	add    %dl,0x6(%rax)
    10b4:	09 01                	or     %eax,(%rcx)
    10b6:	00 00                	add    %al,(%rax)
    10b8:	10 4e fc             	adc    %cl,-0x4(%rsi)
    10bb:	00 00                	add    %al,(%rax)
    10bd:	00 51 06             	add    %dl,0x6(%rcx)
    10c0:	a1 03 00 00 10 50 fc 	movabs 0xfc5010000003,%eax
    10c7:	00 00 
    10c9:	00 52 06             	add    %dl,0x6(%rdx)
    10cc:	69 07 00 00 10 52    	imul   $0x52100000,(%rdi),%eax
    10d2:	fc                   	cld    
    10d3:	00 00                	add    %al,(%rax)
    10d5:	00 53 06             	add    %dl,0x6(%rbx)
    10d8:	97                   	xchg   %eax,%edi
    10d9:	01 00                	add    %eax,(%rax)
    10db:	00 10                	add    %dl,(%rax)
    10dd:	54                   	push   %rsp
    10de:	fc                   	cld    
    10df:	00 00                	add    %al,(%rax)
    10e1:	00 54 06 86          	add    %dl,-0x7a(%rsi,%rax,1)
    10e5:	04 00                	add    $0x0,%al
    10e7:	00 10                	add    %dl,(%rax)
    10e9:	56                   	push   %rsi
    10ea:	fc                   	cld    
    10eb:	00 00                	add    %al,(%rax)
    10ed:	00 55 06             	add    %dl,0x6(%rbp)
    10f0:	da 08                	fimull (%rax)
    10f2:	00 00                	add    %al,(%rax)
    10f4:	10 5d fc             	adc    %bl,-0x4(%rbp)
    10f7:	00 00                	add    %al,(%rax)
    10f9:	00 56 06             	add    %dl,0x6(%rsi)
    10fc:	f6 02 00             	testb  $0x0,(%rdx)
    10ff:	00 10                	add    %dl,(%rax)
    1101:	5e                   	pop    %rsi
    1102:	fc                   	cld    
    1103:	00 00                	add    %al,(%rax)
    1105:	00 57 06             	add    %dl,0x6(%rdi)
    1108:	9d                   	popfq  
    1109:	03 00                	add    (%rax),%eax
    110b:	00 10                	add    %dl,(%rax)
    110d:	61                   	(bad)  
    110e:	fc                   	cld    
    110f:	00 00                	add    %al,(%rax)
    1111:	00 58 06             	add    %bl,0x6(%rax)
    1114:	65                   	gs
    1115:	07                   	(bad)  
    1116:	00 00                	add    %al,(%rax)
    1118:	10 63 fc             	adc    %ah,-0x4(%rbx)
    111b:	00 00                	add    %al,(%rax)
    111d:	00 59 06             	add    %bl,0x6(%rcx)
    1120:	93                   	xchg   %eax,%ebx
    1121:	01 00                	add    %eax,(%rax)
    1123:	00 10                	add    %dl,(%rax)
    1125:	65                   	gs
    1126:	fc                   	cld    
    1127:	00 00                	add    %al,(%rax)
    1129:	00 5a 06             	add    %bl,0x6(%rdx)
    112c:	82                   	(bad)  
    112d:	04 00                	add    $0x0,%al
    112f:	00 10                	add    %dl,(%rax)
    1131:	67 fc                	addr32 cld 
    1133:	00 00                	add    %al,(%rax)
    1135:	00 5b 06             	add    %bl,0x6(%rbx)
    1138:	d6                   	(bad)  
    1139:	08 00                	or     %al,(%rax)
    113b:	00 10                	add    %dl,(%rax)
    113d:	6e                   	outsb  %ds:(%rsi),(%dx)
    113e:	fc                   	cld    
    113f:	00 00                	add    %al,(%rax)
    1141:	00 5c 06 f2          	add    %bl,-0xe(%rsi,%rax,1)
    1145:	02 00                	add    (%rax),%al
    1147:	00 10                	add    %dl,(%rax)
    1149:	6f                   	outsl  %ds:(%rsi),(%dx)
    114a:	fc                   	cld    
    114b:	00 00                	add    %al,(%rax)
    114d:	00 5d 00             	add    %bl,0x0(%rbp)
    1150:	26 22 08             	and    %es:(%rax),%cl
    1153:	00 00                	add    %al,(%rax)
    1155:	10 7c da 09          	adc    %bh,0x9(%rdx,%rbx,8)
    1159:	00 00                	add    %al,(%rax)
    115b:	6a 11                	pushq  $0x11
    115d:	00 00                	add    %al,(%rax)
    115f:	23 03                	and    (%rbx),%eax
    1161:	01 00                	add    %eax,(%rax)
    1163:	00 23                	add    %ah,(%rbx)
    1165:	2c 01                	sub    $0x1,%al
    1167:	00 00                	add    %al,(%rax)
    1169:	00 2f                	add    %ch,(%rdi)
    116b:	99                   	cltd   
    116c:	00 00                	add    %al,(%rax)
    116e:	00 10                	add    %dl,(%rax)
    1170:	7f 75                	jg     11e7 <_init-0x3ff371>
    1172:	11 00                	adc    %eax,(%rax)
    1174:	00 10                	add    %dl,(%rax)
    1176:	08 23                	or     %ah,(%rbx)
    1178:	10 00                	adc    %al,(%rax)
    117a:	00 03                	add    %al,(%rbx)
    117c:	ed                   	in     (%dx),%eax
    117d:	09 00                	or     %eax,(%rax)
    117f:	00 11                	add    %dl,(%rcx)
    1181:	28 03                	sub    %al,(%rbx)
    1183:	01 00                	add    %eax,(%rax)
    1185:	00 03                	add    %al,(%rbx)
    1187:	79 06                	jns    118f <_init-0x3ff3c9>
    1189:	00 00                	add    %al,(%rax)
    118b:	12 20                	adc    (%rax),%ah
    118d:	03 01                	add    (%rcx),%eax
    118f:	00 00                	add    %al,(%rax)
    1191:	0f 1c 10             	nopl   (%rax)
    1194:	00 00                	add    %al,(%rax)
    1196:	0f 95 00             	setne  (%rax)
    1199:	00 00                	add    %al,(%rax)
    119b:	10 08                	adc    %cl,(%rax)
    119d:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
    11a1:	03 f9                	add    %ecx,%edi
    11a3:	01 00                	add    %eax,(%rax)
    11a5:	00 13                	add    %dl,(%rbx)
    11a7:	34 95                	xor    $0x95,%al
    11a9:	00 00                	add    %al,(%rax)
    11ab:	00 03                	add    %al,(%rbx)
    11ad:	77 03                	ja     11b2 <_init-0x3ff3a6>
    11af:	00 00                	add    %al,(%rax)
    11b1:	13 ba b7 11 00 00    	adc    0x11b7(%rdx),%edi
    11b7:	10 08                	adc    %cl,(%rax)
    11b9:	bd 11 00 00 0f       	mov    $0xf000011,%ebp
    11be:	7b 11                	jnp    11d1 <_init-0x3ff387>
    11c0:	00 00                	add    %al,(%rax)
    11c2:	26 ff 09             	decl   %es:(%rcx)
    11c5:	00 00                	add    %al,(%rax)
    11c7:	13 af 03 01 00 00    	adc    0x103(%rdi),%ebp
    11cd:	dc 11                	fcoml  (%rcx)
    11cf:	00 00                	add    %al,(%rax)
    11d1:	23 9c 00 00 00 23 a1 	and    -0x5edd0000(%rax,%rax,1),%ebx
    11d8:	11 00                	adc    %eax,(%rax)
    11da:	00 00                	add    %al,(%rax)
    11dc:	26 a5                	movsl  %es:(%rsi),%es:(%rdi)
    11de:	01 00                	add    %eax,(%rax)
    11e0:	00 13                	add    %dl,(%rbx)
    11e2:	dd 9c 00 00 00 f6 11 	fstpl  0x11f60000(%rax,%rax,1)
    11e9:	00 00                	add    %al,(%rax)
    11eb:	23 9c 00 00 00 23 ac 	and    -0x53dd0000(%rax,%rax,1),%ebx
    11f2:	11 00                	adc    %eax,(%rax)
    11f4:	00 00                	add    %al,(%rax)
    11f6:	26 a7                	cmpsl  %es:(%rdi),%es:(%rsi)
    11f8:	01 00                	add    %eax,(%rax)
    11fa:	00 13                	add    %dl,(%rbx)
    11fc:	da ac 11 00 00 0b 12 	fisubrl 0x120b0000(%rcx,%rdx,1)
    1203:	00 00                	add    %al,(%rax)
    1205:	23 2c 01             	and    (%rcx,%rax,1),%ebp
    1208:	00 00                	add    %al,(%rax)
    120a:	00 26                	add    %ah,(%rsi)
    120c:	01 0a                	add    %ecx,(%rdx)
    120e:	00 00                	add    %al,(%rax)
    1210:	13 ab a1 11 00 00    	adc    0x11a1(%rbx),%ebp
    1216:	20 12                	and    %dl,(%rdx)
    1218:	00 00                	add    %al,(%rax)
    121a:	23 2c 01             	and    (%rcx,%rax,1),%ebp
    121d:	00 00                	add    %al,(%rax)
    121f:	00 0f                	add    %cl,(%rdi)
    1221:	02 10                	add    (%rax),%dl
    1223:	00 00                	add    %al,(%rax)
    1225:	0f 65 0c 00          	pcmpgtw (%rax,%rax,1),%mm1
    1229:	00 2e                	add    %ch,(%rsi)
    122b:	01 02                	add    %eax,(%rdx)
    122d:	37                   	(bad)  
    122e:	01 00                	add    %eax,(%rax)
    1230:	00 30                	add    %dh,(%rax)
    1232:	a8 08                	test   $0x8,%al
    1234:	00 00                	add    %al,(%rax)
    1236:	01 04 2d 05 00 00 f6 	add    %eax,-0x9fffffb(,%rbp,1)
    123d:	0b 00                	or     (%rax),%eax
    123f:	00 cd                	add    %cl,%ch
    1241:	06                   	(bad)  
    1242:	40 00 00             	add    %al,(%rax)
    1245:	00 00                	add    %al,(%rax)
    1247:	00 79 00             	add    %bh,0x0(%rcx)
    124a:	00 00                	add    %al,(%rax)
    124c:	00 00                	add    %al,(%rax)
    124e:	00 00                	add    %al,(%rax)
    1250:	01 9c cb 12 00 00 31 	add    %ebx,0x31000012(%rbx,%rcx,8)
    1257:	c8 04 00 00          	enterq $0x4,$0x0
    125b:	01 04 65 0c 00 00 02 	add    %eax,0x200000c(,%riz,2)
    1262:	91                   	xchg   %eax,%ecx
    1263:	58                   	pop    %rax
    1264:	31 cd                	xor    %ecx,%ebp
    1266:	04 00                	add    $0x0,%al
    1268:	00 01                	add    %al,(%rcx)
    126a:	04 03                	add    $0x3,%al
    126c:	01 00                	add    %eax,(%rax)
    126e:	00 02                	add    %al,(%rdx)
    1270:	91                   	xchg   %eax,%ecx
    1271:	54                   	push   %rsp
    1272:	31 d2                	xor    %edx,%edx
    1274:	04 00                	add    $0x0,%al
    1276:	00 01                	add    %al,(%rcx)
    1278:	04 03                	add    $0x3,%al
    127a:	01 00                	add    %eax,(%rax)
    127c:	00 02                	add    %al,(%rdx)
    127e:	91                   	xchg   %eax,%ecx
    127f:	50                   	push   %rax
    1280:	31 d7                	xor    %edx,%edi
    1282:	04 00                	add    $0x0,%al
    1284:	00 01                	add    %al,(%rcx)
    1286:	04 03                	add    $0x3,%al
    1288:	01 00                	add    %eax,(%rax)
    128a:	00 02                	add    %al,(%rdx)
    128c:	91                   	xchg   %eax,%ecx
    128d:	4c 31 dc             	xor    %r11,%rsp
    1290:	04 00                	add    $0x0,%al
    1292:	00 01                	add    %al,(%rcx)
    1294:	04 03                	add    $0x3,%al
    1296:	01 00                	add    %eax,(%rax)
    1298:	00 02                	add    %al,(%rdx)
    129a:	91                   	xchg   %eax,%ecx
    129b:	48 31 e1             	xor    %rsp,%rcx
    129e:	04 00                	add    $0x0,%al
    12a0:	00 01                	add    %al,(%rcx)
    12a2:	04 03                	add    $0x3,%al
    12a4:	01 00                	add    %eax,(%rax)
    12a6:	00 02                	add    %al,(%rdx)
    12a8:	91                   	xchg   %eax,%ecx
    12a9:	44 32 e6             	xor    %sil,%r12b
    12ac:	06                   	(bad)  
    12ad:	40 00 00             	add    %al,(%rax)
    12b0:	00 00                	add    %al,(%rax)
    12b2:	00 55 00             	add    %dl,0x0(%rbp)
    12b5:	00 00                	add    %al,(%rax)
    12b7:	00 00                	add    %al,(%rax)
    12b9:	00 00                	add    %al,(%rax)
    12bb:	33 ef                	xor    %edi,%ebp
    12bd:	00 00                	add    %al,(%rax)
    12bf:	00 01                	add    %al,(%rcx)
    12c1:	06                   	(bad)  
    12c2:	f6                   	(bad)  
    12c3:	0b 00                	or     (%rax),%eax
    12c5:	00 02                	add    %al,(%rdx)
    12c7:	91                   	xchg   %eax,%ecx
    12c8:	68 00 00 34 8e       	pushq  $0xffffffff8e340000
    12cd:	01 00                	add    %eax,(%rax)
    12cf:	00 01                	add    %al,(%rcx)
    12d1:	0b 03                	or     (%rbx),%eax
    12d3:	01 00                	add    %eax,(%rax)
    12d5:	00 46 07             	add    %al,0x7(%rsi)
    12d8:	40 00 00             	add    %al,(%rax)
    12db:	00 00                	add    %al,(%rax)
    12dd:	00 4a 00             	add    %cl,0x0(%rdx)
    12e0:	00 00                	add    %al,(%rax)
    12e2:	00 00                	add    %al,(%rax)
    12e4:	00 00                	add    %al,(%rax)
    12e6:	01 9c 0d 13 00 00 32 	add    %ebx,0x32000013(%rbp,%rcx,1)
    12ed:	4e 07                	rex.WRX (bad) 
    12ef:	40 00 00             	add    %al,(%rax)
    12f2:	00 00                	add    %al,(%rax)
    12f4:	00 40 00             	add    %al,0x0(%rax)
    12f7:	00 00                	add    %al,(%rax)
    12f9:	00 00                	add    %al,(%rax)
    12fb:	00 00                	add    %al,(%rax)
    12fd:	33 37                	xor    (%rdi),%esi
    12ff:	01 00                	add    %eax,(%rax)
    1301:	00 01                	add    %al,(%rcx)
    1303:	0d f6 0b 00 00       	or     $0xbf6,%eax
    1308:	02 91 68 00 00 35    	add    0x35000068(%rcx),%dl
    130e:	0e                   	(bad)  
    130f:	07                   	(bad)  
    1310:	00 00                	add    %al,(%rax)
    1312:	90                   	nop
    1313:	07                   	(bad)  
    1314:	40 00 00             	add    %al,(%rax)
    1317:	00 00                	add    %al,(%rax)
    1319:	00 3d 00 00 00 00    	add    %bh,0x0(%rip)        # 131f <_init-0x3ff239>
    131f:	00 00                	add    %al,(%rax)
    1321:	00 01                	add    %al,(%rcx)
    1323:	9c                   	pushfq 
    1324:	45 13 00             	adc    (%r8),%r8d
    1327:	00 31                	add    %dh,(%rcx)
    1329:	04 05                	add    $0x5,%al
    132b:	00 00                	add    %al,(%rax)
    132d:	01 0f                	add    %ecx,(%rdi)
    132f:	03 01                	add    (%rcx),%eax
    1331:	00 00                	add    %al,(%rax)
    1333:	02 91 6c 31 95 04    	add    0x495316c(%rcx),%dl
    1339:	00 00                	add    %al,(%rax)
    133b:	01 0f                	add    %ecx,(%rdi)
    133d:	03 01                	add    (%rcx),%eax
    133f:	00 00                	add    %al,(%rax)
    1341:	02 91 68 00 36 1e    	add    0x1e360068(%rcx),%dl
    1347:	05 00 00 cd 07       	add    $0x7cd0000,%eax
    134c:	40 00 00             	add    %al,(%rax)
    134f:	00 00                	add    %al,(%rax)
    1351:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 1357 <_init-0x3ff201>
    1357:	00 00                	add    %al,(%rax)
    1359:	00 01                	add    %al,(%rcx)
    135b:	9c                   	pushfq 
    135c:	37                   	(bad)  
    135d:	43 09 00             	rex.XB or %eax,(%r8)
    1360:	00 88 00 00 00 38    	add    %cl,0x38000000(%rax)
    1366:	b8 06 00 00 09       	mov    $0x9000006,%eax
    136b:	03 51 10             	add    0x10(%rcx),%edx
    136e:	60                   	(bad)  
    136f:	00 00                	add    %al,(%rax)
    1371:	00 00                	add    %al,(%rax)
    1373:	00 39                	add    %bh,(%rcx)
    1375:	49 0e                	rex.WB (bad) 
    1377:	00 00                	add    %al,(%rax)
    1379:	45 03 00             	add    (%r8),%r8d
    137c:	00 80 80 80 80 78    	add    %al,0x78808080(%rax)
    1382:	3a 54 0e 00          	cmp    0x0(%rsi,%rcx,1),%dl
    1386:	00 59 00             	add    %bl,0x0(%rcx)
    1389:	00 00                	add    %al,(%rax)
    138b:	ff                   	(bad)  
    138c:	ff                   	(bad)  
    138d:	ff                   	(bad)  
    138e:	7f 3b                	jg     13cb <_init-0x3ff18d>
    1390:	ac                   	lods   %ds:(%rsi),%al
    1391:	0e                   	(bad)  
    1392:	00 00                	add    %al,(%rax)
    1394:	c7 05 00 00 40 3b d8 	movl   $0xed8,0x3b400000(%rip)        # 3b40139e <_end+0x3ae00346>
    139b:	0e 00 00 
    139e:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    139f:	07                   	(bad)  
    13a0:	00 00                	add    %al,(%rax)
    13a2:	7f 39                	jg     13dd <_init-0x3ff17b>
    13a4:	0f                   	(bad)  
    13a5:	0f 00 00             	sldt   (%rax)
    13a8:	5f                   	pop    %rdi
    13a9:	05 00 00 80 80       	add    $0x80800000,%eax
    13ae:	7e 3c                	jle    13ec <_init-0x3ff16c>
    13b0:	1a 0f                	sbb    (%rdi),%cl
    13b2:	00 00                	add    %al,(%rax)
    13b4:	4d 02 00             	rex.WRB add (%r8),%r8b
    13b7:	00 ff                	add    %bh,%bh
    13b9:	7f 39                	jg     13f4 <_init-0x3ff164>
    13bb:	4d 0f 00 00          	rex.WRB sldt (%r8)
    13bf:	08 0a                	or     %cl,(%rdx)
    13c1:	00 00                	add    %al,(%rax)
    13c3:	80 80 80 80 80 80 80 	addb   $0x80,-0x7f7f7f80(%rax)
    13ca:	80 80 7f 3d 58 0f 00 	addb   $0x0,0xf583d7f(%rax)
    13d1:	00 95 02 00 00 ff    	add    %dl,-0xfffffe(%rbp)
    13d7:	ff                   	(bad)  
    13d8:	ff                   	(bad)  
    13d9:	ff                   	(bad)  
    13da:	ff                   	(bad)  
    13db:	ff                   	(bad)  
    13dc:	ff                   	(bad)  
    13dd:	7f 00                	jg     13df <_init-0x3ff179>

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x2ab02be>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    (%rsi),%ecx
   b:	11 01                	adc    %eax,(%rcx)
   d:	12 07                	adc    (%rdi),%al
   f:	10 17                	adc    %dl,(%rdi)
  11:	00 00                	add    %al,(%rax)
  13:	02 13                	add    (%rbx),%dl
  15:	00 03                	add    %al,(%rbx)
  17:	0e                   	(bad)  
  18:	3c 19                	cmp    $0x19,%al
  1a:	00 00                	add    %al,(%rax)
  1c:	03 16                	add    (%rsi),%edx
  1e:	00 03                	add    %al,(%rbx)
  20:	0e                   	(bad)  
  21:	3a 0b                	cmp    (%rbx),%cl
  23:	3b 0b                	cmp    (%rbx),%ecx
  25:	49 13 00             	adc    (%r8),%rax
  28:	00 04 24             	add    %al,(%rsp)
  2b:	00 0b                	add    %cl,(%rbx)
  2d:	0b 3e                	or     (%rsi),%edi
  2f:	0b 03                	or     (%rbx),%eax
  31:	0e                   	(bad)  
  32:	00 00                	add    %al,(%rax)
  34:	05 13 01 03 0e       	add    $0xe030113,%eax
  39:	0b 0b                	or     (%rbx),%ecx
  3b:	3a 0b                	cmp    (%rbx),%cl
  3d:	3b 0b                	cmp    (%rbx),%ecx
  3f:	01 13                	add    %edx,(%rbx)
  41:	00 00                	add    %al,(%rax)
  43:	06                   	(bad)  
  44:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
  49:	0b 3b                	or     (%rbx),%edi
  4b:	0b 49 13             	or     0x13(%rcx),%ecx
  4e:	38 0b                	cmp    %cl,(%rbx)
  50:	00 00                	add    %al,(%rax)
  52:	07                   	(bad)  
  53:	0f 00 0b             	str    (%rbx)
  56:	0b 00                	or     (%rax),%eax
  58:	00 08                	add    %cl,(%rax)
  5a:	16                   	(bad)  
  5b:	00 03                	add    %al,(%rbx)
  5d:	0e                   	(bad)  
  5e:	3a 0b                	cmp    (%rbx),%cl
  60:	3b 05 49 13 00 00    	cmp    0x1349(%rip),%eax        # 13af <_init-0x3ff1a9>
  66:	09 13                	or     %edx,(%rbx)
  68:	01 0b                	add    %ecx,(%rbx)
  6a:	0b 3a                	or     (%rdx),%edi
  6c:	0b 3b                	or     (%rbx),%edi
  6e:	0b 6e 0e             	or     0xe(%rsi),%ebp
  71:	01 13                	add    %edx,(%rbx)
  73:	00 00                	add    %al,(%rax)
  75:	0a 17                	or     (%rdi),%dl
  77:	01 0b                	add    %ecx,(%rbx)
  79:	0b 3a                	or     (%rdx),%edi
  7b:	0b 3b                	or     (%rbx),%edi
  7d:	0b 01                	or     (%rcx),%eax
  7f:	13 00                	adc    (%rax),%eax
  81:	00 0b                	add    %cl,(%rbx)
  83:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
  88:	0b 3b                	or     (%rbx),%edi
  8a:	0b 49 13             	or     0x13(%rcx),%ecx
  8d:	00 00                	add    %al,(%rax)
  8f:	0c 01                	or     $0x1,%al
  91:	01 49 13             	add    %ecx,0x13(%rcx)
  94:	01 13                	add    %edx,(%rbx)
  96:	00 00                	add    %al,(%rax)
  98:	0d 21 00 49 13       	or     $0x13490021,%eax
  9d:	2f                   	(bad)  
  9e:	0b 00                	or     (%rax),%eax
  a0:	00 0e                	add    %cl,(%rsi)
  a2:	24 00                	and    $0x0,%al
  a4:	0b 0b                	or     (%rbx),%ecx
  a6:	3e 0b 03             	or     %ds:(%rbx),%eax
  a9:	08 00                	or     %al,(%rax)
  ab:	00 0f                	add    %cl,(%rdi)
  ad:	26 00 49 13          	add    %cl,%es:0x13(%rcx)
  b1:	00 00                	add    %al,(%rax)
  b3:	10 0f                	adc    %cl,(%rdi)
  b5:	00 0b                	add    %cl,(%rbx)
  b7:	0b 49 13             	or     0x13(%rcx),%ecx
  ba:	00 00                	add    %al,(%rax)
  bc:	11 39                	adc    %edi,(%rcx)
  be:	01 03                	add    %eax,(%rbx)
  c0:	08 3a                	or     %bh,(%rdx)
  c2:	0b 3b                	or     (%rbx),%edi
  c4:	0b 01                	or     (%rcx),%eax
  c6:	13 00                	adc    (%rax),%eax
  c8:	00 12                	add    %dl,(%rdx)
  ca:	08 00                	or     %al,(%rax)
  cc:	3a 0b                	cmp    (%rbx),%cl
  ce:	3b 0b                	cmp    (%rbx),%ecx
  d0:	18 13                	sbb    %dl,(%rbx)
  d2:	00 00                	add    %al,(%rax)
  d4:	13 08                	adc    (%rax),%ecx
  d6:	00 3a                	add    %bh,(%rdx)
  d8:	0b 3b                	or     (%rbx),%edi
  da:	05 18 13 00 00       	add    $0x1318,%eax
  df:	14 39                	adc    $0x39,%al
  e1:	00 03                	add    %al,(%rbx)
  e3:	0e                   	(bad)  
  e4:	3a 0b                	cmp    (%rbx),%cl
  e6:	3b 0b                	cmp    (%rbx),%ecx
  e8:	00 00                	add    %al,(%rax)
  ea:	15 04 01 03 0e       	adc    $0xe030104,%eax
  ef:	0b 0b                	or     (%rbx),%ecx
  f1:	3a 0b                	cmp    (%rbx),%cl
  f3:	3b 0b                	cmp    (%rbx),%ecx
  f5:	01 13                	add    %edx,(%rbx)
  f7:	00 00                	add    %al,(%rax)
  f9:	16                   	(bad)  
  fa:	28 00                	sub    %al,(%rax)
  fc:	03 0e                	add    (%rsi),%ecx
  fe:	1c 0d                	sbb    $0xd,%al
 100:	00 00                	add    %al,(%rax)
 102:	17                   	(bad)  
 103:	02 01                	add    (%rcx),%al
 105:	03 0e                	add    (%rsi),%ecx
 107:	3c 19                	cmp    $0x19,%al
 109:	01 13                	add    %edx,(%rbx)
 10b:	00 00                	add    %al,(%rax)
 10d:	18 02                	sbb    %al,(%rdx)
 10f:	01 03                	add    %eax,(%rbx)
 111:	0e                   	(bad)  
 112:	0b 0b                	or     (%rbx),%ecx
 114:	3a 0b                	cmp    (%rbx),%cl
 116:	3b 05 32 0b 01 13    	cmp    0x13010b32(%rip),%eax        # 13010c4e <_end+0x12a0fbf6>
 11c:	00 00                	add    %al,(%rax)
 11e:	19 0d 00 03 0e 3a    	sbb    %ecx,0x3a0e0300(%rip)        # 3a0e0424 <_end+0x39adf3cc>
 124:	0b 3b                	or     (%rbx),%edi
 126:	05 49 13 3f 19       	add    $0x193f1349,%eax
 12b:	3c 19                	cmp    $0x19,%al
 12d:	00 00                	add    %al,(%rax)
 12f:	1a 2e                	sbb    (%rsi),%ch
 131:	01 3f                	add    %edi,(%rdi)
 133:	19 03                	sbb    %eax,(%rbx)
 135:	0e                   	(bad)  
 136:	3a 0b                	cmp    (%rbx),%cl
 138:	3b 05 32 0b 3c 19    	cmp    0x193c0b32(%rip),%eax        # 193c0c70 <_end+0x18dbfc18>
 13e:	64 13 01             	adc    %fs:(%rcx),%eax
 141:	13 00                	adc    (%rax),%eax
 143:	00 1b                	add    %bl,(%rbx)
 145:	05 00 49 13 34       	add    $0x34134900,%eax
 14a:	19 00                	sbb    %eax,(%rax)
 14c:	00 1c 2e             	add    %bl,(%rsi,%rbp,1)
 14f:	01 3f                	add    %edi,(%rdi)
 151:	19 03                	sbb    %eax,(%rbx)
 153:	0e                   	(bad)  
 154:	3a 0b                	cmp    (%rbx),%cl
 156:	3b 05 32 0b 3c 19    	cmp    0x193c0b32(%rip),%eax        # 193c0c8e <_end+0x18dbfc36>
 15c:	64 13 00             	adc    %fs:(%rax),%eax
 15f:	00 1d 16 00 03 0e    	add    %bl,0xe030016(%rip)        # e03017b <_end+0xda2f123>
 165:	3a 0b                	cmp    (%rbx),%cl
 167:	3b 05 49 13 32 0b    	cmp    0xb321349(%rip),%eax        # b3214b6 <_end+0xad2045e>
 16d:	00 00                	add    %al,(%rax)
 16f:	1e                   	(bad)  
 170:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 175:	0b 3b                	or     (%rbx),%edi
 177:	05 49 13 3f 19       	add    $0x193f1349,%eax
 17c:	32 0b                	xor    (%rbx),%cl
 17e:	3c 19                	cmp    $0x19,%al
 180:	1c 0b                	sbb    $0xb,%al
 182:	00 00                	add    %al,(%rax)
 184:	1f                   	(bad)  
 185:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 18a:	0b 3b                	or     (%rbx),%edi
 18c:	05 49 13 3f 19       	add    $0x193f1349,%eax
 191:	32 0b                	xor    (%rbx),%cl
 193:	3c 19                	cmp    $0x19,%al
 195:	1c 0b                	sbb    $0xb,%al
 197:	00 00                	add    %al,(%rax)
 199:	20 0d 00 03 0e 3a    	and    %cl,0x3a0e0300(%rip)        # 3a0e049f <_end+0x39adf447>
 19f:	0b 3b                	or     (%rbx),%edi
 1a1:	05 49 13 3f 19       	add    $0x193f1349,%eax
 1a6:	32 0b                	xor    (%rbx),%cl
 1a8:	3c 19                	cmp    $0x19,%al
 1aa:	1c 05                	sbb    $0x5,%al
 1ac:	00 00                	add    %al,(%rax)
 1ae:	21 34 00             	and    %esi,(%rax,%rax,1)
 1b1:	03 0e                	add    (%rsi),%ecx
 1b3:	3a 0b                	cmp    (%rbx),%cl
 1b5:	3b 0b                	cmp    (%rbx),%ecx
 1b7:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 1bb:	00 00                	add    %al,(%rax)
 1bd:	22 2e                	and    (%rsi),%ch
 1bf:	01 3f                	add    %edi,(%rdi)
 1c1:	19 03                	sbb    %eax,(%rbx)
 1c3:	0e                   	(bad)  
 1c4:	3a 0b                	cmp    (%rbx),%cl
 1c6:	3b 05 49 13 3c 19    	cmp    0x193c1349(%rip),%eax        # 193c1515 <_end+0x18dc04bd>
 1cc:	01 13                	add    %edx,(%rbx)
 1ce:	00 00                	add    %al,(%rax)
 1d0:	23 05 00 49 13 00    	and    0x134900(%rip),%eax        # 134ad6 <_init-0x2cba82>
 1d6:	00 24 18             	add    %ah,(%rax,%rbx,1)
 1d9:	00 00                	add    %al,(%rax)
 1db:	00 25 2e 00 3f 19    	add    %ah,0x193f002e(%rip)        # 193f020f <_end+0x18def1b7>
 1e1:	03 0e                	add    (%rsi),%ecx
 1e3:	3a 0b                	cmp    (%rbx),%cl
 1e5:	3b 05 49 13 3c 19    	cmp    0x193c1349(%rip),%eax        # 193c1534 <_end+0x18dc04dc>
 1eb:	00 00                	add    %al,(%rax)
 1ed:	26 2e 01 3f          	es add %edi,%cs:%es:(%rdi)
 1f1:	19 03                	sbb    %eax,(%rbx)
 1f3:	0e                   	(bad)  
 1f4:	3a 0b                	cmp    (%rbx),%cl
 1f6:	3b 0b                	cmp    (%rbx),%ecx
 1f8:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 1fc:	01 13                	add    %edx,(%rbx)
 1fe:	00 00                	add    %al,(%rax)
 200:	27                   	(bad)  
 201:	13 01                	adc    (%rcx),%eax
 203:	03 08                	add    (%rax),%ecx
 205:	0b 0b                	or     (%rbx),%ecx
 207:	3a 0b                	cmp    (%rbx),%cl
 209:	3b 0b                	cmp    (%rbx),%ecx
 20b:	01 13                	add    %edx,(%rbx)
 20d:	00 00                	add    %al,(%rax)
 20f:	28 2e                	sub    %ch,(%rsi)
 211:	01 3f                	add    %edi,(%rdi)
 213:	19 03                	sbb    %eax,(%rbx)
 215:	0e                   	(bad)  
 216:	3a 0b                	cmp    (%rbx),%cl
 218:	3b 0b                	cmp    (%rbx),%ecx
 21a:	6e                   	outsb  %ds:(%rsi),(%dx)
 21b:	0e                   	(bad)  
 21c:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 220:	01 13                	add    %edx,(%rbx)
 222:	00 00                	add    %al,(%rax)
 224:	29 2e                	sub    %ebp,(%rsi)
 226:	01 3f                	add    %edi,(%rdi)
 228:	19 03                	sbb    %eax,(%rbx)
 22a:	0e                   	(bad)  
 22b:	3a 0b                	cmp    (%rbx),%cl
 22d:	3b 05 6e 0e 49 13    	cmp    0x13490e6e(%rip),%eax        # 134910a1 <_end+0x12e90049>
 233:	3c 19                	cmp    $0x19,%al
 235:	01 13                	add    %edx,(%rbx)
 237:	00 00                	add    %al,(%rax)
 239:	2a 39                	sub    (%rcx),%bh
 23b:	01 03                	add    %eax,(%rbx)
 23d:	0e                   	(bad)  
 23e:	3a 0b                	cmp    (%rbx),%cl
 240:	3b 0b                	cmp    (%rbx),%ecx
 242:	01 13                	add    %edx,(%rbx)
 244:	00 00                	add    %al,(%rax)
 246:	2b 0d 00 03 0e 3a    	sub    0x3a0e0300(%rip),%ecx        # 3a0e054c <_end+0x39adf4f4>
 24c:	0b 3b                	or     (%rbx),%edi
 24e:	0b 49 13             	or     0x13(%rcx),%ecx
 251:	3f                   	(bad)  
 252:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 255:	00 00                	add    %al,(%rax)
 257:	2c 2f                	sub    $0x2f,%al
 259:	00 03                	add    %al,(%rbx)
 25b:	0e                   	(bad)  
 25c:	49 13 00             	adc    (%r8),%rax
 25f:	00 2d 13 01 03 0e    	add    %ch,0xe030113(%rip)        # e030378 <_end+0xda2f320>
 265:	0b 0b                	or     (%rbx),%ecx
 267:	3a 0b                	cmp    (%rbx),%cl
 269:	3b 0b                	cmp    (%rbx),%ecx
 26b:	00 00                	add    %al,(%rax)
 26d:	2e 3a 00             	cmp    %cs:(%rax),%al
 270:	3a 0b                	cmp    (%rbx),%cl
 272:	3b 0b                	cmp    (%rbx),%ecx
 274:	18 13                	sbb    %dl,(%rbx)
 276:	00 00                	add    %al,(%rax)
 278:	2f                   	(bad)  
 279:	2e 00 3f             	add    %bh,%cs:(%rdi)
 27c:	19 03                	sbb    %eax,(%rbx)
 27e:	0e                   	(bad)  
 27f:	3a 0b                	cmp    (%rbx),%cl
 281:	3b 0b                	cmp    (%rbx),%ecx
 283:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 287:	00 00                	add    %al,(%rax)
 289:	30 2e                	xor    %ch,(%rsi)
 28b:	01 3f                	add    %edi,(%rdi)
 28d:	19 03                	sbb    %eax,(%rbx)
 28f:	0e                   	(bad)  
 290:	3a 0b                	cmp    (%rbx),%cl
 292:	3b 0b                	cmp    (%rbx),%ecx
 294:	6e                   	outsb  %ds:(%rsi),(%dx)
 295:	0e                   	(bad)  
 296:	49 13 11             	adc    (%r9),%rdx
 299:	01 12                	add    %edx,(%rdx)
 29b:	07                   	(bad)  
 29c:	40 18 97 42 19 01 13 	sbb    %dl,0x13011942(%rdi)
 2a3:	00 00                	add    %al,(%rax)
 2a5:	31 05 00 03 0e 3a    	xor    %eax,0x3a0e0300(%rip)        # 3a0e05ab <_end+0x39adf553>
 2ab:	0b 3b                	or     (%rbx),%edi
 2ad:	0b 49 13             	or     0x13(%rcx),%ecx
 2b0:	02 18                	add    (%rax),%bl
 2b2:	00 00                	add    %al,(%rax)
 2b4:	32 0b                	xor    (%rbx),%cl
 2b6:	01 11                	add    %edx,(%rcx)
 2b8:	01 12                	add    %edx,(%rdx)
 2ba:	07                   	(bad)  
 2bb:	00 00                	add    %al,(%rax)
 2bd:	33 34 00             	xor    (%rax,%rax,1),%esi
 2c0:	03 0e                	add    (%rsi),%ecx
 2c2:	3a 0b                	cmp    (%rbx),%cl
 2c4:	3b 0b                	cmp    (%rbx),%ecx
 2c6:	49 13 02             	adc    (%r10),%rax
 2c9:	18 00                	sbb    %al,(%rax)
 2cb:	00 34 2e             	add    %dh,(%rsi,%rbp,1)
 2ce:	01 3f                	add    %edi,(%rdi)
 2d0:	19 03                	sbb    %eax,(%rbx)
 2d2:	0e                   	(bad)  
 2d3:	3a 0b                	cmp    (%rbx),%cl
 2d5:	3b 0b                	cmp    (%rbx),%ecx
 2d7:	49 13 11             	adc    (%r9),%rdx
 2da:	01 12                	add    %edx,(%rdx)
 2dc:	07                   	(bad)  
 2dd:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 2e4:	00 00                	add    %al,(%rax)
 2e6:	35 2e 01 03 0e       	xor    $0xe03012e,%eax
 2eb:	34 19                	xor    $0x19,%al
 2ed:	11 01                	adc    %eax,(%rcx)
 2ef:	12 07                	adc    (%rdi),%al
 2f1:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 2f8:	00 00                	add    %al,(%rax)
 2fa:	36 2e 00 03          	ss add %al,%cs:%ss:(%rbx)
 2fe:	0e                   	(bad)  
 2ff:	34 19                	xor    $0x19,%al
 301:	11 01                	adc    %eax,(%rcx)
 303:	12 07                	adc    (%rdi),%al
 305:	40 18 96 42 19 00 00 	sbb    %dl,0x1942(%rsi)
 30c:	37                   	(bad)  
 30d:	34 00                	xor    $0x0,%al
 30f:	03 0e                	add    (%rsi),%ecx
 311:	49 13 3f             	adc    (%r15),%rdi
 314:	19 34 19             	sbb    %esi,(%rcx,%rbx,1)
 317:	3c 19                	cmp    $0x19,%al
 319:	00 00                	add    %al,(%rax)
 31b:	38 34 00             	cmp    %dh,(%rax,%rax,1)
 31e:	47 13 02             	rex.RXB adc (%r10),%r8d
 321:	18 00                	sbb    %al,(%rax)
 323:	00 39                	add    %bh,(%rcx)
 325:	34 00                	xor    $0x0,%al
 327:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 32b:	1c 0d                	sbb    $0xd,%al
 32d:	00 00                	add    %al,(%rax)
 32f:	3a 34 00             	cmp    (%rax,%rax,1),%dh
 332:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 336:	1c 06                	sbb    $0x6,%al
 338:	00 00                	add    %al,(%rax)
 33a:	3b 34 00             	cmp    (%rax,%rax,1),%esi
 33d:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 341:	1c 0b                	sbb    $0xb,%al
 343:	00 00                	add    %al,(%rax)
 345:	3c 34                	cmp    $0x34,%al
 347:	00 47 13             	add    %al,0x13(%rdi)
 34a:	6e                   	outsb  %ds:(%rsi),(%dx)
 34b:	0e                   	(bad)  
 34c:	1c 05                	sbb    $0x5,%al
 34e:	00 00                	add    %al,(%rax)
 350:	3d 34 00 47 13       	cmp    $0x13470034,%eax
 355:	6e                   	outsb  %ds:(%rsi),(%dx)
 356:	0e                   	(bad)  
 357:	1c 07                	sbb    $0x7,%al
 359:	00 00                	add    %al,(%rax)
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	2a 02                	sub    (%rdx),%al
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	f1                   	icebp  
   7:	01 00                	add    %eax,(%rax)
   9:	00 01                	add    %al,(%rcx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	01 00                	add    %eax,(%rax)
  19:	00 01                	add    %al,(%rcx)
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <_init-0x4004c7>
  1e:	72 2f                	jb     4f <_init-0x400509>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  27:	2f                   	(bad)  
  28:	63 2b                	movslq (%rbx),%ebp
  2a:	2b 2f                	sub    (%rdi),%ebp
  2c:	34 2e                	xor    $0x2e,%al
  2e:	38 00                	cmp    %al,(%rax)
  30:	2f                   	(bad)  
  31:	75 73                	jne    a6 <_init-0x4004b2>
  33:	72 2f                	jb     64 <_init-0x4004f4>
  35:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  3c:	00 2f                	add    %ch,(%rdi)
  3e:	75 73                	jne    b3 <_init-0x4004a5>
  40:	72 2f                	jb     71 <_init-0x4004e7>
  42:	6c                   	insb   (%dx),%es:(%rdi)
  43:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  4a:	78 38                	js     84 <_init-0x4004d4>
  4c:	36                   	ss
  4d:	5f                   	pop    %rdi
  4e:	36                   	ss
  4f:	34 2d                	xor    $0x2d,%al
  51:	6c                   	insb   (%dx),%es:(%rdi)
  52:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  59:	75 2f                	jne    8a <_init-0x4004ce>
  5b:	34 2e                	xor    $0x2e,%al
  5d:	38 2f                	cmp    %ch,(%rdi)
  5f:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  66:	00 2f                	add    %ch,(%rdi)
  68:	75 73                	jne    dd <_init-0x40047b>
  6a:	72 2f                	jb     9b <_init-0x4004bd>
  6c:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  73:	2f                   	(bad)  
  74:	78 38                	js     ae <_init-0x4004aa>
  76:	36                   	ss
  77:	5f                   	pop    %rdi
  78:	36                   	ss
  79:	34 2d                	xor    $0x2d,%al
  7b:	6c                   	insb   (%dx),%es:(%rdi)
  7c:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  83:	75 2f                	jne    b4 <_init-0x4004a4>
  85:	63 2b                	movslq (%rbx),%ebp
  87:	2b 2f                	sub    (%rdi),%ebp
  89:	34 2e                	xor    $0x2e,%al
  8b:	38 2f                	cmp    %ch,(%rdi)
  8d:	62                   	(bad)  
  8e:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  95:	72 
  96:	2f                   	(bad)  
  97:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  9e:	2f                   	(bad)  
  9f:	63 2b                	movslq (%rbx),%ebp
  a1:	2b 2f                	sub    (%rdi),%ebp
  a3:	34 2e                	xor    $0x2e,%al
  a5:	38 2f                	cmp    %ch,(%rdi)
  a7:	62                   	(bad)  
  a8:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  af:	72 
  b0:	2f                   	(bad)  
  b1:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  b8:	2f                   	(bad)  
  b9:	63 2b                	movslq (%rbx),%ebp
  bb:	2b 2f                	sub    (%rdi),%ebp
  bd:	34 2e                	xor    $0x2e,%al
  bf:	38 2f                	cmp    %ch,(%rdi)
  c1:	65                   	gs
  c2:	78 74                	js     138 <_init-0x400420>
  c4:	00 2f                	add    %ch,(%rdi)
  c6:	75 73                	jne    13b <_init-0x40041d>
  c8:	72 2f                	jb     f9 <_init-0x40045f>
  ca:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  d1:	2f                   	(bad)  
  d2:	63 2b                	movslq (%rbx),%ebp
  d4:	2b 2f                	sub    (%rdi),%ebp
  d6:	34 2e                	xor    $0x2e,%al
  d8:	38 2f                	cmp    %ch,(%rdi)
  da:	64                   	fs
  db:	65                   	gs
  dc:	62                   	(bad)  
  dd:	75 67                	jne    146 <_init-0x400412>
  df:	00 2f                	add    %ch,(%rdi)
  e1:	75 73                	jne    156 <_init-0x400402>
  e3:	72 2f                	jb     114 <_init-0x400444>
  e5:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  ec:	2f                   	(bad)  
  ed:	78 38                	js     127 <_init-0x400431>
  ef:	36                   	ss
  f0:	5f                   	pop    %rdi
  f1:	36                   	ss
  f2:	34 2d                	xor    $0x2d,%al
  f4:	6c                   	insb   (%dx),%es:(%rdi)
  f5:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  fc:	75 2f                	jne    12d <_init-0x40042b>
  fe:	62                   	(bad)  
  ff:	69 74 73 00 00 73 74 	imul   $0x61747300,0x0(%rbx,%rsi,2),%esi
 106:	61 
 107:	63 6b 2e             	movslq 0x2e(%rbx),%ebp
 10a:	63 70 70             	movslq 0x70(%rax),%esi
 10d:	00 00                	add    %al,(%rax)
 10f:	00 00                	add    %al,(%rax)
 111:	69 6f 73 74 72 65 61 	imul   $0x61657274,0x73(%rdi),%ebp
 118:	6d                   	insl   (%dx),%es:(%rdi)
 119:	00 01                	add    %al,(%rcx)
 11b:	00 00                	add    %al,(%rax)
 11d:	3c 62                	cmp    $0x62,%al
 11f:	75 69                	jne    18a <_init-0x4003ce>
 121:	6c                   	insb   (%dx),%es:(%rdi)
 122:	74 2d                	je     151 <_init-0x400407>
 124:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
 12b:	73 74                	jae    1a1 <_init-0x4003b7>
 12d:	64 69 6f 2e 68 00 02 	imul   $0x20068,%fs:0x2e(%rdi),%ebp
 134:	00 
 135:	00 73 74             	add    %dh,0x74(%rbx)
 138:	64                   	fs
 139:	64                   	fs
 13a:	65                   	gs
 13b:	66                   	data16
 13c:	2e                   	cs
 13d:	68 00 03 00 00       	pushq  $0x300
 142:	77 63                	ja     1a7 <_init-0x4003b1>
 144:	68 61 72 2e 68       	pushq  $0x682e7261
 149:	00 02                	add    %al,(%rdx)
 14b:	00 00                	add    %al,(%rax)
 14d:	63 77 63             	movslq 0x63(%rdi),%esi
 150:	68 61 72 00 01       	pushq  $0x1007261
 155:	00 00                	add    %al,(%rax)
 157:	63 2b                	movslq (%rbx),%ebp
 159:	2b 63 6f             	sub    0x6f(%rbx),%esp
 15c:	6e                   	outsb  %ds:(%rsi),(%dx)
 15d:	66 69 67 2e 68 00    	imul   $0x68,0x2e(%rdi),%sp
 163:	04 00                	add    $0x0,%al
 165:	00 63 6c             	add    %ah,0x6c(%rbx)
 168:	6f                   	outsl  %ds:(%rsi),(%dx)
 169:	63 61 6c             	movslq 0x6c(%rcx),%esp
 16c:	65 00 01             	add    %al,%gs:(%rcx)
 16f:	00 00                	add    %al,(%rax)
 171:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 178:	65                   	gs
 179:	2e                   	cs
 17a:	68 00 05 00 00       	pushq  $0x500
 17f:	63 77 63             	movslq 0x63(%rdi),%esi
 182:	74 79                	je     1fd <_init-0x40035b>
 184:	70 65                	jo     1eb <_init-0x40036d>
 186:	00 01                	add    %al,(%rcx)
 188:	00 00                	add    %al,(%rax)
 18a:	74 69                	je     1f5 <_init-0x400363>
 18c:	6d                   	insl   (%dx),%es:(%rdi)
 18d:	65                   	gs
 18e:	2e                   	cs
 18f:	68 00 02 00 00       	pushq  $0x200
 194:	6e                   	outsb  %ds:(%rsi),(%dx)
 195:	65                   	gs
 196:	77 5f                	ja     1f7 <_init-0x400361>
 198:	61                   	(bad)  
 199:	6c                   	insb   (%dx),%es:(%rdi)
 19a:	6c                   	insb   (%dx),%es:(%rdi)
 19b:	6f                   	outsl  %ds:(%rsi),(%dx)
 19c:	63 61 74             	movslq 0x74(%rcx),%esp
 19f:	6f                   	outsl  %ds:(%rsi),(%dx)
 1a0:	72 2e                	jb     1d0 <_init-0x400388>
 1a2:	68 00 06 00 00       	pushq  $0x600
 1a7:	6e                   	outsb  %ds:(%rsi),(%dx)
 1a8:	75 6d                	jne    217 <_init-0x400341>
 1aa:	65                   	gs
 1ab:	72 69                	jb     216 <_init-0x400342>
 1ad:	63 5f 74             	movslq 0x74(%rdi),%ebx
 1b0:	72 61                	jb     213 <_init-0x400345>
 1b2:	69 74 73 2e 68 00 06 	imul   $0x60068,0x2e(%rbx,%rsi,2),%esi
 1b9:	00 
 1ba:	00 64 65 62          	add    %ah,0x62(%rbp,%riz,2)
 1be:	75 67                	jne    227 <_init-0x400331>
 1c0:	2e                   	cs
 1c1:	68 00 07 00 00       	pushq  $0x700
 1c6:	6c                   	insb   (%dx),%es:(%rdi)
 1c7:	6f                   	outsl  %ds:(%rsi),(%dx)
 1c8:	63 61 6c             	movslq 0x6c(%rcx),%esp
 1cb:	65                   	gs
 1cc:	2e                   	cs
 1cd:	68 00 02 00 00       	pushq  $0x200
 1d2:	74 79                	je     24d <_init-0x40030b>
 1d4:	70 65                	jo     23b <_init-0x40031d>
 1d6:	73 2e                	jae    206 <_init-0x400352>
 1d8:	68 00 08 00 00       	pushq  $0x800
 1dd:	61                   	(bad)  
 1de:	74 6f                	je     24f <_init-0x400309>
 1e0:	6d                   	insl   (%dx),%es:(%rdi)
 1e1:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
 1e8:	2e                   	cs
 1e9:	68 00 04 00 00       	pushq  $0x400
 1ee:	77 63                	ja     253 <_init-0x400305>
 1f0:	74 79                	je     26b <_init-0x4002ed>
 1f2:	70 65                	jo     259 <_init-0x4002ff>
 1f4:	2e                   	cs
 1f5:	68 00 02 00 00       	pushq  $0x200
 1fa:	00 00                	add    %al,(%rax)
 1fc:	09 02                	or     %eax,(%rdx)
 1fe:	cd 06                	int    $0x6
 200:	40 00 00             	add    %al,(%rax)
 203:	00 00                	add    %al,(%rax)
 205:	00 16                	add    %dl,(%rsi)
 207:	08 83 d7 e5 02 38    	or     %al,0x3802e5d7(%rbx)
 20d:	13 af 83 02 37 13    	adc    0x13370283(%rdi),%ebp
 213:	91                   	xchg   %eax,%ecx
 214:	2e                   	cs
 215:	d6                   	(bad)  
 216:	00 02                	add    %al,(%rdx)
 218:	04 01                	add    $0x1,%al
 21a:	06                   	(bad)  
 21b:	66                   	data16
 21c:	04 02                	add    $0x2,%al
 21e:	06                   	(bad)  
 21f:	03 3b                	add    (%rbx),%edi
 221:	90                   	nop
 222:	04 01                	add    $0x1,%al
 224:	03 45 08             	add    0x8(%rbp),%eax
 227:	c8 2e 4a 08          	enterq $0x4a2e,$0x8
 22b:	00 01                	add    %al,(%rcx)
 22d:	01                   	.byte 0x1

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	5f                   	pop    %rdi
   1:	53                   	push   %rbx
   2:	5f                   	pop    %rdi
   3:	65 6e                	outsb  %gs:(%rsi),(%dx)
   5:	64 00 73 69          	add    %dh,%fs:0x69(%rbx)
   9:	7a 65                	jp     70 <_init-0x4004e8>
   b:	5f                   	pop    %rdi
   c:	74 00                	je     e <_init-0x40054a>
   e:	73 69                	jae    79 <_init-0x4004df>
  10:	7a 65                	jp     77 <_init-0x4004e1>
  12:	74 79                	je     8d <_init-0x4004cb>
  14:	70 65                	jo     7b <_init-0x4004dd>
  16:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
  1a:	68 6f 75 72 00       	pushq  $0x72756f
  1f:	5f                   	pop    %rdi
  20:	5f                   	pop    %rdi
  21:	76 61                	jbe    84 <_init-0x4004d4>
  23:	6c                   	insb   (%dx),%es:(%rdi)
  24:	75 65                	jne    8b <_init-0x4004cd>
  26:	00 5f 53             	add    %bl,0x53(%rdi)
  29:	5f                   	pop    %rdi
  2a:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
  31:	6e                   	outsb  %ds:(%rsi),(%dx)
  32:	6d                   	insl   (%dx),%es:(%rdi)
  33:	6f                   	outsl  %ds:(%rsi),(%dx)
  34:	64                   	fs
  35:	65                   	gs
  36:	5f                   	pop    %rdi
  37:	6d                   	insl   (%dx),%es:(%rdi)
  38:	69 6e 00 5f 5f 6e 75 	imul   $0x756e5f5f,0x0(%rsi),%ebp
  3f:	6d                   	insl   (%dx),%es:(%rdi)
  40:	65                   	gs
  41:	72 69                	jb     ac <_init-0x4004ac>
  43:	63 5f 74             	movslq 0x74(%rdi),%ebx
  46:	72 61                	jb     a9 <_init-0x4004af>
  48:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
  4f:	65 
  50:	67                   	addr32
  51:	65                   	gs
  52:	72 3c                	jb     90 <_init-0x4004c8>
  54:	69 6e 74 3e 00 5f 5a 	imul   $0x5a5f003e,0x74(%rsi),%ebp
  5b:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
  5f:	67 6e                	outsb  %ds:(%esi),(%dx)
  61:	75 5f                	jne    c2 <_init-0x400496>
  63:	63 78 78             	movslq 0x78(%rax),%edi
  66:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
  69:	5f                   	pop    %rdi
  6a:	6e                   	outsb  %ds:(%rsi),(%dx)
  6b:	75 6d                	jne    da <_init-0x40047e>
  6d:	65                   	gs
  6e:	72 69                	jb     d9 <_init-0x40047f>
  70:	63 5f 74             	movslq 0x74(%rdi),%ebx
  73:	72 61                	jb     d6 <_init-0x400482>
  75:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
  7c:	65 
  7d:	67                   	addr32
  7e:	65                   	gs
  7f:	72 49                	jb     ca <_init-0x40048e>
  81:	69 45 35 5f 5f 6d 61 	imul   $0x616d5f5f,0x35(%rbp),%eax
  88:	78 45                	js     cf <_init-0x400489>
  8a:	00 5f 5f             	add    %bl,0x5f(%rdi)
  8d:	6d                   	insl   (%dx),%es:(%rdi)
  8e:	61                   	(bad)  
  8f:	78 00                	js     91 <_init-0x4004c7>
  91:	77 63                	ja     f6 <_init-0x400462>
  93:	73 63                	jae    f8 <_init-0x400460>
  95:	73 70                	jae    107 <_init-0x400451>
  97:	6e                   	outsb  %ds:(%rsi),(%dx)
  98:	00 6c 6f 63          	add    %ch,0x63(%rdi,%rbp,2)
  9c:	61                   	(bad)  
  9d:	6c                   	insb   (%dx),%es:(%rdi)
  9e:	65 63 6f 6e          	movslq %gs:0x6e(%rdi),%ebp
  a2:	76 00                	jbe    a4 <_init-0x4004b4>
  a4:	5f                   	pop    %rdi
  a5:	53                   	push   %rbx
  a6:	5f                   	pop    %rdi
  a7:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
  ae:	66                   	data16
  af:	6c                   	insb   (%dx),%es:(%rdi)
  b0:	61                   	(bad)  
  b1:	67 73 5f             	addr32 jae 113 <_init-0x400445>
  b4:	6d                   	insl   (%dx),%es:(%rdi)
  b5:	69 6e 00 5f 53 5f 69 	imul   $0x695f535f,0x0(%rsi),%ebp
  bc:	6f                   	outsl  %ds:(%rsi),(%dx)
  bd:	73 5f                	jae    11e <_init-0x40043a>
  bf:	69 6f 73 74 61 74 65 	imul   $0x65746174,0x73(%rdi),%ebp
  c6:	5f                   	pop    %rdi
  c7:	6d                   	insl   (%dx),%es:(%rdi)
  c8:	61                   	(bad)  
  c9:	78 00                	js     cb <_init-0x40048d>
  cb:	69 6e 74 5f 63 75 72 	imul   $0x7275635f,0x74(%rsi),%ebp
  d2:	72 5f                	jb     133 <_init-0x400425>
  d4:	73 79                	jae    14f <_init-0x400409>
  d6:	6d                   	insl   (%dx),%es:(%rdi)
  d7:	62                   	(bad)  
  d8:	6f                   	outsl  %ds:(%rsi),(%dx)
  d9:	6c                   	insb   (%dx),%es:(%rdi)
  da:	00 77 63             	add    %dh,0x63(%rdi)
  dd:	73 63                	jae    142 <_init-0x400416>
  df:	68 72 00 5f 53       	pushq  $0x535f0072
  e4:	5f                   	pop    %rdi
  e5:	62                   	(bad)  
  e6:	6f                   	outsl  %ds:(%rsi),(%dx)
  e7:	6f                   	outsl  %ds:(%rsi),(%dx)
  e8:	6c                   	insb   (%dx),%es:(%rdi)
  e9:	61                   	(bad)  
  ea:	6c                   	insb   (%dx),%es:(%rdi)
  eb:	70 68                	jo     155 <_init-0x400403>
  ed:	61                   	(bad)  
  ee:	00 6c 6f 63          	add    %ch,0x63(%rdi,%rbp,2)
  f2:	61                   	(bad)  
  f3:	6c                   	insb   (%dx),%es:(%rdi)
  f4:	00 6d 62             	add    %ch,0x62(%rbp)
  f7:	72 74                	jb     16d <_init-0x4003eb>
  f9:	6f                   	outsl  %ds:(%rsi),(%dx)
  fa:	77 63                	ja     15f <_init-0x4003f9>
  fc:	00 77 63             	add    %dh,0x63(%rdi)
  ff:	73 78                	jae    179 <_init-0x4003df>
 101:	66                   	data16
 102:	72 6d                	jb     171 <_init-0x4003e7>
 104:	00 69 6e             	add    %ch,0x6e(%rcx)
 107:	74 5f                	je     168 <_init-0x4003f0>
 109:	66                   	data16
 10a:	72 61                	jb     16d <_init-0x4003eb>
 10c:	63 5f 64             	movslq 0x64(%rdi),%ebx
 10f:	69 67 69 74 73 00 5f 	imul   $0x5f007374,0x69(%rdi),%esp
 116:	53                   	push   %rbx
 117:	5f                   	pop    %rdi
 118:	62                   	(bad)  
 119:	65 67 00 77 63       	add    %dh,%gs:0x63(%edi)
 11e:	73 63                	jae    183 <_init-0x4003d5>
 120:	6f                   	outsl  %ds:(%rsi),(%dx)
 121:	6c                   	insb   (%dx),%es:(%rdi)
 122:	6c                   	insb   (%dx),%es:(%rdi)
 123:	00 5f 5f             	add    %bl,0x5f(%rdi)
 126:	77 63                	ja     18b <_init-0x4003cd>
 128:	68 00 5f 53 5f       	pushq  $0x5f535f00
 12d:	62 61                	(bad)  
 12f:	73 65                	jae    196 <_init-0x4003c2>
 131:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%rbp),%sp
 137:	72 65                	jb     19e <_init-0x4003ba>
 139:	73 75                	jae    1b0 <_init-0x4003a8>
 13b:	6c                   	insb   (%dx),%es:(%rdi)
 13c:	74 00                	je     13e <_init-0x40041a>
 13e:	77 63                	ja     1a3 <_init-0x4003b5>
 140:	73 72                	jae    1b4 <_init-0x4003a4>
 142:	63 68 72             	movslq 0x72(%rax),%ebp
 145:	00 6d 6f             	add    %ch,0x6f(%rbp)
 148:	6e                   	outsb  %ds:(%rsi),(%dx)
 149:	5f                   	pop    %rdi
 14a:	64 65 63 69 6d       	fs movslq %fs:%gs:0x6d(%rcx),%ebp
 14f:	61                   	(bad)  
 150:	6c                   	insb   (%dx),%es:(%rdi)
 151:	5f                   	pop    %rdi
 152:	70 6f                	jo     1c3 <_init-0x400395>
 154:	69 6e 74 00 5f 5f 6e 	imul   $0x6e5f5f00,0x74(%rsi),%ebp
 15b:	75 6d                	jne    1ca <_init-0x40038e>
 15d:	65                   	gs
 15e:	72 69                	jb     1c9 <_init-0x40038f>
 160:	63 5f 74             	movslq 0x74(%rdi),%ebx
 163:	72 61                	jb     1c6 <_init-0x400392>
 165:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 16c:	65 
 16d:	67                   	addr32
 16e:	65                   	gs
 16f:	72 3c                	jb     1ad <_init-0x4003ab>
 171:	63 68 61             	movslq 0x61(%rax),%ebp
 174:	72 3e                	jb     1b4 <_init-0x4003a4>
 176:	00 76 77             	add    %dh,0x77(%rsi)
 179:	70 72                	jo     1ed <_init-0x40036b>
 17b:	69 6e 74 66 00 5f 49 	imul   $0x495f0066,0x74(%rsi),%ebp
 182:	6f                   	outsl  %ds:(%rsi),(%dx)
 183:	73 5f                	jae    1e4 <_init-0x400374>
 185:	4f 70 65             	rex.WRXB jo 1ed <_init-0x40036b>
 188:	6e                   	outsb  %ds:(%rsi),(%dx)
 189:	6d                   	insl   (%dx),%es:(%rdi)
 18a:	6f                   	outsl  %ds:(%rsi),(%dx)
 18b:	64 65 00 6d 61       	fs add %ch,%fs:%gs:0x61(%rbp)
 190:	69 6e 00 69 6e 74 5f 	imul   $0x5f746e69,0x0(%rsi),%ebp
 197:	6e                   	outsb  %ds:(%rsi),(%dx)
 198:	5f                   	pop    %rdi
 199:	63 73 5f             	movslq 0x5f(%rbx),%esi
 19c:	70 72                	jo     210 <_init-0x400348>
 19e:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
 1a2:	65                   	gs
 1a3:	73 00                	jae    1a5 <_init-0x4003b3>
 1a5:	74 6f                	je     216 <_init-0x400342>
 1a7:	77 63                	ja     20c <_init-0x40034c>
 1a9:	74 72                	je     21d <_init-0x40033b>
 1ab:	61                   	(bad)  
 1ac:	6e                   	outsb  %ds:(%rsi),(%dx)
 1ad:	73 00                	jae    1af <_init-0x4003a9>
 1af:	5f                   	pop    %rdi
 1b0:	5f                   	pop    %rdi
 1b1:	69 6f 69 6e 69 74 00 	imul   $0x74696e,0x69(%rdi),%ebp
 1b8:	5f                   	pop    %rdi
 1b9:	53                   	push   %rbx
 1ba:	5f                   	pop    %rdi
 1bb:	62 61 64 62 69       	(bad)  {%k2}
 1c0:	74 00                	je     1c2 <_init-0x400396>
 1c2:	5f                   	pop    %rdi
 1c3:	53                   	push   %rbx
 1c4:	5f                   	pop    %rdi
 1c5:	73 79                	jae    240 <_init-0x400318>
 1c7:	6e                   	outsb  %ds:(%rsi),(%dx)
 1c8:	63 65 64             	movslq 0x64(%rbp),%esp
 1cb:	5f                   	pop    %rdi
 1cc:	77 69                	ja     237 <_init-0x400321>
 1ce:	74 68                	je     238 <_init-0x400320>
 1d0:	5f                   	pop    %rdi
 1d1:	73 74                	jae    247 <_init-0x400311>
 1d3:	64 69 6f 00 5f 56 61 	imul   $0x6c61565f,%fs:0x0(%rdi),%ebp
 1da:	6c 
 1db:	75 65                	jne    242 <_init-0x400316>
 1dd:	00 5f 53             	add    %bl,0x53(%rdi)
 1e0:	5f                   	pop    %rdi
 1e1:	65 6f                	outsl  %gs:(%rsi),(%dx)
 1e3:	66                   	data16
 1e4:	62                   	(bad)  {%k2}
 1e5:	69 74 00 74 6d 5f 79 	imul   $0x64795f6d,0x74(%rax,%rax,1),%esi
 1ec:	64 
 1ed:	61                   	(bad)  
 1ee:	79 00                	jns    1f0 <_init-0x400368>
 1f0:	5f                   	pop    %rdi
 1f1:	49                   	rex.WB
 1f2:	4f 5f                	rex.WRXB pop %r15
 1f4:	46                   	rex.RX
 1f5:	49                   	rex.WB
 1f6:	4c                   	rex.WR
 1f7:	45 00 77 63          	add    %r14b,0x63(%r15)
 1fb:	74 79                	je     276 <_init-0x4002e2>
 1fd:	70 65                	jo     264 <_init-0x4002f4>
 1ff:	5f                   	pop    %rdi
 200:	74 00                	je     202 <_init-0x400356>
 202:	66                   	data16
 203:	67                   	addr32
 204:	65                   	gs
 205:	74 77                	je     27e <_init-0x4002da>
 207:	63 00                	movslq (%rax),%eax
 209:	67                   	addr32
 20a:	65                   	gs
 20b:	74 77                	je     284 <_init-0x4002d4>
 20d:	63 68 61             	movslq 0x61(%rax),%ebp
 210:	72 00                	jb     212 <_init-0x400346>
 212:	73 74                	jae    288 <_init-0x4002d0>
 214:	61                   	(bad)  
 215:	63 6b 2e             	movslq 0x2e(%rbx),%ebp
 218:	63 70 70             	movslq 0x70(%rax),%esi
 21b:	00 66 67             	add    %ah,0x67(%rsi)
 21e:	65                   	gs
 21f:	74 77                	je     298 <_init-0x4002c0>
 221:	73 00                	jae    223 <_init-0x400335>
 223:	5f                   	pop    %rdi
 224:	53                   	push   %rbx
 225:	5f                   	pop    %rdi
 226:	72 69                	jb     291 <_init-0x4002c7>
 228:	67 68 74 00 75 6e    	addr32 pushq $0x6e750074
 22e:	73 69                	jae    299 <_init-0x4002bf>
 230:	67 6e                	outsb  %ds:(%esi),(%dx)
 232:	65 64 20 63 68       	gs and %ah,%fs:%gs:0x68(%rbx)
 237:	61                   	(bad)  
 238:	72 00                	jb     23a <_init-0x40031e>
 23a:	77 6d                	ja     2a9 <_init-0x4002af>
 23c:	65                   	gs
 23d:	6d                   	insl   (%dx),%es:(%rdi)
 23e:	63 68 72             	movslq 0x72(%rax),%ebp
 241:	00 5f 53             	add    %bl,0x53(%rdi)
 244:	5f                   	pop    %rdi
 245:	67 6f                	outsl  %ds:(%esi),(%dx)
 247:	6f                   	outsl  %ds:(%rsi),(%dx)
 248:	64                   	fs
 249:	62                   	(bad)  {%k2}
 24a:	69 74 00 5f 5a 4e 39 	imul   $0x5f394e5a,0x5f(%rax,%rax,1),%esi
 251:	5f 
 252:	5f                   	pop    %rdi
 253:	67 6e                	outsb  %ds:(%esi),(%dx)
 255:	75 5f                	jne    2b6 <_init-0x4002a2>
 257:	63 78 78             	movslq 0x78(%rax),%edi
 25a:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 25d:	5f                   	pop    %rdi
 25e:	6e                   	outsb  %ds:(%rsi),(%dx)
 25f:	75 6d                	jne    2ce <_init-0x40028a>
 261:	65                   	gs
 262:	72 69                	jb     2cd <_init-0x40028b>
 264:	63 5f 74             	movslq 0x74(%rdi),%ebx
 267:	72 61                	jb     2ca <_init-0x40028e>
 269:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 270:	65 
 271:	67                   	addr32
 272:	65                   	gs
 273:	72 49                	jb     2be <_init-0x40029a>
 275:	73 45                	jae    2bc <_init-0x40029c>
 277:	35 5f 5f 6d 61       	xor    $0x616d5f5f,%eax
 27c:	78 45                	js     2c3 <_init-0x400295>
 27e:	00 5f 53             	add    %bl,0x53(%rdi)
 281:	5f                   	pop    %rdi
 282:	62                   	(bad)  {%k2}
 283:	69 6e 00 77 63 73 63 	imul   $0x63736377,0x0(%rsi),%ebp
 28a:	6d                   	insl   (%dx),%es:(%rdi)
 28b:	70 00                	jo     28d <_init-0x4002cb>
 28d:	77 63                	ja     2f2 <_init-0x400266>
 28f:	73 70                	jae    301 <_init-0x400257>
 291:	62 72                	(bad)  {%k2}
 293:	6b 00 5f             	imul   $0x5f,(%rax),%eax
 296:	5a                   	pop    %rdx
 297:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 29b:	67 6e                	outsb  %ds:(%esi),(%dx)
 29d:	75 5f                	jne    2fe <_init-0x40025a>
 29f:	63 78 78             	movslq 0x78(%rax),%edi
 2a2:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 2a5:	5f                   	pop    %rdi
 2a6:	6e                   	outsb  %ds:(%rsi),(%dx)
 2a7:	75 6d                	jne    316 <_init-0x400242>
 2a9:	65                   	gs
 2aa:	72 69                	jb     315 <_init-0x400243>
 2ac:	63 5f 74             	movslq 0x74(%rdi),%ebx
 2af:	72 61                	jb     312 <_init-0x400246>
 2b1:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 2b8:	65 
 2b9:	67                   	addr32
 2ba:	65                   	gs
 2bb:	72 49                	jb     306 <_init-0x400252>
 2bd:	6c                   	insb   (%dx),%es:(%rdi)
 2be:	45 35 5f 5f 6d 61    	rex.RB xor $0x616d5f5f,%eax
 2c4:	78 45                	js     30b <_init-0x40024d>
 2c6:	00 5f 5f             	add    %bl,0x5f(%rdi)
 2c9:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
 2d0:	65 64 00 5f 53       	gs add %bl,%fs:%gs:0x53(%rdi)
 2d5:	5f                   	pop    %rdi
 2d6:	6f                   	outsl  %ds:(%rsi),(%dx)
 2d7:	75 74                	jne    34d <_init-0x40020b>
 2d9:	00 5f 53             	add    %bl,0x53(%rdi)
 2dc:	5f                   	pop    %rdi
 2dd:	61                   	(bad)  
 2de:	70 70                	jo     350 <_init-0x400208>
 2e0:	00 6f 70             	add    %ch,0x70(%rdi)
 2e3:	65 6e                	outsb  %gs:(%rsi),(%dx)
 2e5:	6d                   	insl   (%dx),%es:(%rdi)
 2e6:	6f                   	outsl  %ds:(%rsi),(%dx)
 2e7:	64 65 00 77 63       	fs add %dh,%fs:%gs:0x63(%rdi)
 2ec:	73 6e                	jae    35c <_init-0x4001fc>
 2ee:	63 6d 70             	movslq 0x70(%rbp),%ebp
 2f1:	00 69 6e             	add    %ch,0x6e(%rcx)
 2f4:	74 5f                	je     355 <_init-0x400203>
 2f6:	6e                   	outsb  %ds:(%rsi),(%dx)
 2f7:	5f                   	pop    %rdi
 2f8:	73 69                	jae    363 <_init-0x4001f5>
 2fa:	67 6e                	outsb  %ds:(%esi),(%dx)
 2fc:	5f                   	pop    %rdi
 2fd:	70 6f                	jo     36e <_init-0x4001ea>
 2ff:	73 6e                	jae    36f <_init-0x4001e9>
 301:	00 77 6d             	add    %dh,0x6d(%rdi)
 304:	65                   	gs
 305:	6d                   	insl   (%dx),%es:(%rdi)
 306:	6d                   	insl   (%dx),%es:(%rdi)
 307:	6f                   	outsl  %ds:(%rsi),(%dx)
 308:	76 65                	jbe    36f <_init-0x4001e9>
 30a:	00 5f 5f             	add    %bl,0x5f(%rdi)
 30d:	6d                   	insl   (%dx),%es:(%rdi)
 30e:	69 6e 00 62 74 6f 77 	imul   $0x776f7462,0x0(%rsi),%ebp
 315:	63 00                	movslq (%rax),%eax
 317:	6d                   	insl   (%dx),%es:(%rdi)
 318:	6f                   	outsl  %ds:(%rsi),(%dx)
 319:	6e                   	outsb  %ds:(%rsi),(%dx)
 31a:	5f                   	pop    %rdi
 31b:	74 68                	je     385 <_init-0x4001d3>
 31d:	6f                   	outsl  %ds:(%rsi),(%dx)
 31e:	75 73                	jne    393 <_init-0x4001c5>
 320:	61                   	(bad)  
 321:	6e                   	outsb  %ds:(%rsi),(%dx)
 322:	64                   	fs
 323:	73 5f                	jae    384 <_init-0x4001d4>
 325:	73 65                	jae    38c <_init-0x4001cc>
 327:	70 00                	jo     329 <_init-0x40022f>
 329:	75 6e                	jne    399 <_init-0x4001bf>
 32b:	67                   	addr32
 32c:	65                   	gs
 32d:	74 77                	je     3a6 <_init-0x4001b2>
 32f:	63 00                	movslq (%rax),%eax
 331:	66                   	data16
 332:	70 5f                	jo     393 <_init-0x4001c5>
 334:	6f                   	outsl  %ds:(%rsi),(%dx)
 335:	66                   	data16
 336:	66                   	data16
 337:	73 65                	jae    39e <_init-0x4001ba>
 339:	74 00                	je     33b <_init-0x40021d>
 33b:	70 74                	jo     3b1 <_init-0x4001a7>
 33d:	72 64                	jb     3a3 <_init-0x4001b5>
 33f:	69 66 66 5f 74 00 5f 	imul   $0x5f00745f,0x66(%rsi),%esp
 346:	5a                   	pop    %rdx
 347:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 34b:	67 6e                	outsb  %ds:(%esi),(%dx)
 34d:	75 5f                	jne    3ae <_init-0x4001aa>
 34f:	63 78 78             	movslq 0x78(%rax),%edi
 352:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 355:	5f                   	pop    %rdi
 356:	6e                   	outsb  %ds:(%rsi),(%dx)
 357:	75 6d                	jne    3c6 <_init-0x400192>
 359:	65                   	gs
 35a:	72 69                	jb     3c5 <_init-0x400193>
 35c:	63 5f 74             	movslq 0x74(%rdi),%ebx
 35f:	72 61                	jb     3c2 <_init-0x400196>
 361:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 368:	65 
 369:	67                   	addr32
 36a:	65                   	gs
 36b:	72 49                	jb     3b6 <_init-0x4001a2>
 36d:	69 45 35 5f 5f 6d 69 	imul   $0x696d5f5f,0x35(%rbp),%eax
 374:	6e                   	outsb  %ds:(%rsi),(%dx)
 375:	45 00 77 63          	add    %r14b,0x63(%r15)
 379:	74 72                	je     3ed <_init-0x40016b>
 37b:	61                   	(bad)  
 37c:	6e                   	outsb  %ds:(%rsi),(%dx)
 37d:	73 5f                	jae    3de <_init-0x40017a>
 37f:	74 00                	je     381 <_init-0x4001d7>
 381:	6d                   	insl   (%dx),%es:(%rdi)
 382:	62 72 6c 65 6e       	(bad)  {%k5}
 387:	00 6e 65             	add    %ch,0x65(%rsi)
 38a:	67 61                	addr32 (bad) 
 38c:	74 69                	je     3f7 <_init-0x400161>
 38e:	76 65                	jbe    3f5 <_init-0x400163>
 390:	5f                   	pop    %rdi
 391:	73 69                	jae    3fc <_init-0x40015c>
 393:	67 6e                	outsb  %ds:(%esi),(%dx)
 395:	00 5f 53             	add    %bl,0x53(%rdi)
 398:	5f                   	pop    %rdi
 399:	68 65 78 00 69       	pushq  $0x69007865
 39e:	6e                   	outsb  %ds:(%rsi),(%dx)
 39f:	74 5f                	je     400 <_init-0x400158>
 3a1:	70 5f                	jo     402 <_init-0x400156>
 3a3:	63 73 5f             	movslq 0x5f(%rbx),%esi
 3a6:	70 72                	jo     41a <_init-0x40013e>
 3a8:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
 3ac:	65                   	gs
 3ad:	73 00                	jae    3af <_init-0x4001a9>
 3af:	5f                   	pop    %rdi
 3b0:	53                   	push   %rbx
 3b1:	5f                   	pop    %rdi
 3b2:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%rdi),%ebp
 3b9:	74 61                	je     41c <_init-0x40013c>
 3bb:	74 65                	je     422 <_init-0x400136>
 3bd:	5f                   	pop    %rdi
 3be:	6d                   	insl   (%dx),%es:(%rdi)
 3bf:	69 6e 00 77 63 73 74 	imul   $0x74736377,0x0(%rsi),%ebp
 3c6:	6f                   	outsl  %ds:(%rsi),(%dx)
 3c7:	75 6c                	jne    435 <_init-0x400123>
 3c9:	6c                   	insb   (%dx),%es:(%rdi)
 3ca:	00 5f 53             	add    %bl,0x53(%rdi)
 3cd:	5f                   	pop    %rdi
 3ce:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%rsi),%ebp
 3d5:	6c                   	insb   (%dx),%es:(%rdi)
 3d6:	00 70 6f             	add    %dh,0x6f(%rax)
 3d9:	73 69                	jae    444 <_init-0x400114>
 3db:	74 69                	je     446 <_init-0x400112>
 3dd:	76 65                	jbe    444 <_init-0x400114>
 3df:	5f                   	pop    %rdi
 3e0:	73 69                	jae    44b <_init-0x40010d>
 3e2:	67 6e                	outsb  %ds:(%esi),(%dx)
 3e4:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 3e8:	6d                   	insl   (%dx),%es:(%rdi)
 3e9:	64                   	fs
 3ea:	61                   	(bad)  
 3eb:	79 00                	jns    3ed <_init-0x40016b>
 3ed:	77 63                	ja     452 <_init-0x400106>
 3ef:	73 63                	jae    454 <_init-0x400104>
 3f1:	70 79                	jo     46c <_init-0x4000ec>
 3f3:	00 76 73             	add    %dh,0x73(%rsi)
 3f6:	77 70                	ja     468 <_init-0x4000f0>
 3f8:	72 69                	jb     463 <_init-0x4000f5>
 3fa:	6e                   	outsb  %ds:(%rsi),(%dx)
 3fb:	74 66                	je     463 <_init-0x4000f5>
 3fd:	00 77 6d             	add    %dh,0x6d(%rdi)
 400:	65                   	gs
 401:	6d                   	insl   (%dx),%es:(%rdi)
 402:	73 65                	jae    469 <_init-0x4000ef>
 404:	74 00                	je     406 <_init-0x400152>
 406:	73 65                	jae    46d <_init-0x4000eb>
 408:	65 6b 64 69 72 00    	imul   $0x0,%gs:0x72(%rcx,%rbp,2),%esp
 40e:	2f                   	(bad)  
 40f:	68 6f 6d 65 2f       	pushq  $0x2f656d6f
 414:	73 69                	jae    47f <_init-0x4000d9>
 416:	6d                   	insl   (%dx),%es:(%rdi)
 417:	6f                   	outsl  %ds:(%rsi),(%dx)
 418:	6e                   	outsb  %ds:(%rsi),(%dx)
 419:	2f                   	(bad)  
 41a:	67 69 74 68 75 62 2f 	imul   $0x696d2f62,0x75(%eax,%ebp,2),%esi
 421:	6d 69 
 423:	6e                   	outsb  %ds:(%rsi),(%dx)
 424:	65                   	gs
 425:	2f                   	(bad)  
 426:	4c 69 6e 75 78 50 72 	imul   $0x6f725078,0x75(%rsi),%r13
 42d:	6f 
 42e:	67 72 61             	addr32 jb 492 <_init-0x4000c6>
 431:	6d                   	insl   (%dx),%es:(%rdi)
 432:	2f                   	(bad)  
 433:	43 2b 2b             	rex.XB sub (%r11),%ebp
 436:	2f                   	(bad)  
 437:	53                   	push   %rbx
 438:	74 61                	je     49b <_init-0x4000bd>
 43a:	63 6b 55             	movslq 0x55(%rbx),%ebp
 43d:	6e                   	outsb  %ds:(%rsi),(%dx)
 43e:	77 69                	ja     4a9 <_init-0x4000af>
 440:	6e                   	outsb  %ds:(%rsi),(%dx)
 441:	64 00 66 77          	add    %ah,%fs:0x77(%rsi)
 445:	69 64 65 00 74 6d 5f 	imul   $0x735f6d74,0x0(%rbp,%riz,2),%esp
 44c:	73 
 44d:	65 63 00             	movslq %gs:(%rax),%eax
 450:	74 6d                	je     4bf <_init-0x400099>
 452:	5f                   	pop    %rdi
 453:	69 73 64 73 74 00 77 	imul   $0x77007473,0x64(%rbx),%esi
 45a:	63 73 6e             	movslq 0x6e(%rbx),%esi
 45d:	63 70 79             	movslq 0x79(%rax),%esi
 460:	00 70 75             	add    %dh,0x75(%rax)
 463:	74 77                	je     4dc <_init-0x40007c>
 465:	63 68 61             	movslq 0x61(%rax),%ebp
 468:	72 00                	jb     46a <_init-0x4000ee>
 46a:	77 6d                	ja     4d9 <_init-0x40007f>
 46c:	65                   	gs
 46d:	6d                   	insl   (%dx),%es:(%rdi)
 46e:	63 6d 70             	movslq 0x70(%rbp),%ebp
 471:	00 5f 53             	add    %bl,0x53(%rdi)
 474:	5f                   	pop    %rdi
 475:	61                   	(bad)  
 476:	74 65                	je     4dd <_init-0x40007b>
 478:	00 5f 53             	add    %bl,0x53(%rdi)
 47b:	5f                   	pop    %rdi
 47c:	66 69 78 65 64 00    	imul   $0x64,0x65(%rax),%di
 482:	69 6e 74 5f 6e 5f 73 	imul   $0x735f6e5f,0x74(%rsi),%ebp
 489:	65                   	gs
 48a:	70 5f                	jo     4eb <_init-0x40006d>
 48c:	62                   	(bad)  {%k5}
 48d:	79 5f                	jns    4ee <_init-0x40006a>
 48f:	73 70                	jae    501 <_init-0x400057>
 491:	61                   	(bad)  
 492:	63 65 00             	movslq 0x0(%rbp),%esp
 495:	5f                   	pop    %rdi
 496:	5f                   	pop    %rdi
 497:	70 72                	jo     50b <_init-0x40004d>
 499:	69 6f 72 69 74 79 00 	imul   $0x797469,0x72(%rdi),%ebp
 4a0:	5f                   	pop    %rdi
 4a1:	53                   	push   %rbx
 4a2:	5f                   	pop    %rdi
 4a3:	73 68                	jae    50d <_init-0x40004b>
 4a5:	6f                   	outsl  %ds:(%rsi),(%dx)
 4a6:	77 62                	ja     50a <_init-0x40004e>
 4a8:	61                   	(bad)  
 4a9:	73 65                	jae    510 <_init-0x400048>
 4ab:	00 5f 53             	add    %bl,0x53(%rdi)
 4ae:	5f                   	pop    %rdi
 4af:	69 6e 00 5f 5f 67 6e 	imul   $0x6e675f5f,0x0(%rsi),%ebp
 4b6:	75 5f                	jne    517 <_init-0x400041>
 4b8:	64                   	fs
 4b9:	65                   	gs
 4ba:	62                   	(bad)  {%k5}
 4bb:	75 67                	jne    524 <_init-0x400034>
 4bd:	00 76 66             	add    %dh,0x66(%rsi)
 4c0:	77 70                	ja     532 <_init-0x400026>
 4c2:	72 69                	jb     52d <_init-0x40002b>
 4c4:	6e                   	outsb  %ds:(%rsi),(%dx)
 4c5:	74 66                	je     52d <_init-0x40002b>
 4c7:	00 61 72             	add    %ah,0x72(%rcx)
 4ca:	67 31 00             	xor    %eax,(%eax)
 4cd:	61                   	(bad)  
 4ce:	72 67                	jb     537 <_init-0x400021>
 4d0:	32 00                	xor    (%rax),%al
 4d2:	61                   	(bad)  
 4d3:	72 67                	jb     53c <_init-0x40001c>
 4d5:	33 00                	xor    (%rax),%eax
 4d7:	61                   	(bad)  
 4d8:	72 67                	jb     541 <_init-0x400017>
 4da:	34 00                	xor    $0x0,%al
 4dc:	61                   	(bad)  
 4dd:	72 67                	jb     546 <_init-0x400012>
 4df:	35 00 61 72 67       	xor    $0x67726100,%eax
 4e4:	36 00 76 73          	add    %dh,%ss:0x73(%rsi)
 4e8:	77 73                	ja     55d <_init-0x3ffffb>
 4ea:	63 61 6e             	movslq 0x6e(%rcx),%esp
 4ed:	66                   	data16
 4ee:	00 5f 53             	add    %bl,0x53(%rdi)
 4f1:	5f                   	pop    %rdi
 4f2:	72 65                	jb     559 <_init-0x3fffff>
 4f4:	66 63 6f 75          	movslq 0x75(%rdi),%bp
 4f8:	6e                   	outsb  %ds:(%rsi),(%dx)
 4f9:	74 00                	je     4fb <_init-0x40005d>
 4fb:	5f                   	pop    %rdi
 4fc:	53                   	push   %rbx
 4fd:	5f                   	pop    %rdi
 4fe:	74 72                	je     572 <_init-0x3fffe6>
 500:	75 6e                	jne    570 <_init-0x3fffe8>
 502:	63 00                	movslq (%rax),%eax
 504:	5f                   	pop    %rdi
 505:	5f                   	pop    %rdi
 506:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%rsi),%ebp
 50d:	69 7a 65 5f 70 00 5f 	imul   $0x5f00705f,0x65(%rdx),%edi
 514:	53                   	push   %rbx
 515:	5f                   	pop    %rdi
 516:	73 68                	jae    580 <_init-0x3fffd8>
 518:	6f                   	outsl  %ds:(%rsi),(%dx)
 519:	77 70                	ja     58b <_init-0x3fffcd>
 51b:	6f                   	outsl  %ds:(%rsi),(%dx)
 51c:	73 00                	jae    51e <_init-0x40003a>
 51e:	5f                   	pop    %rdi
 51f:	47                   	rex.RXB
 520:	4c                   	rex.WR
 521:	4f                   	rex.WRXB
 522:	42                   	rex.X
 523:	41                   	rex.B
 524:	4c 5f                	rex.WR pop %rdi
 526:	5f                   	pop    %rdi
 527:	73 75                	jae    59e <_init-0x3fffba>
 529:	62                   	(bad)  {%k5}
 52a:	5f                   	pop    %rdi
 52b:	49 5f                	rex.WB pop %r15
 52d:	5f                   	pop    %rdi
 52e:	5a                   	pop    %rdx
 52f:	34 66                	xor    $0x66,%al
 531:	75 6e                	jne    5a1 <_init-0x3fffb7>
 533:	63 6c 69 69          	movslq 0x69(%rcx,%rbp,2),%ebp
 537:	69 69 69 00 77 6d 65 	imul   $0x656d7700,0x69(%rcx),%ebp
 53e:	6d                   	insl   (%dx),%es:(%rdi)
 53f:	63 70 79             	movslq 0x79(%rax),%esi
 542:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 546:	6d                   	insl   (%dx),%es:(%rdi)
 547:	6f                   	outsl  %ds:(%rsi),(%dx)
 548:	6e                   	outsb  %ds:(%rsi),(%dx)
 549:	00 5f 53             	add    %bl,0x53(%rdi)
 54c:	5f                   	pop    %rdi
 54d:	64 65 63 00          	fs movslq %fs:%gs:(%rax),%eax
 551:	5f                   	pop    %rdi
 552:	49 6f                	rex.WB outsl %ds:(%rsi),(%dx)
 554:	73 5f                	jae    5b5 <_init-0x3fffa3>
 556:	46 6d                	rex.RX insl (%dx),%es:(%rdi)
 558:	74 66                	je     5c0 <_init-0x3fff98>
 55a:	6c                   	insb   (%dx),%es:(%rdi)
 55b:	61                   	(bad)  
 55c:	67 73 00             	addr32 jae 55f <_init-0x3ffff9>
 55f:	5f                   	pop    %rdi
 560:	5a                   	pop    %rdx
 561:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 565:	67 6e                	outsb  %ds:(%esi),(%dx)
 567:	75 5f                	jne    5c8 <_init-0x3fff90>
 569:	63 78 78             	movslq 0x78(%rax),%edi
 56c:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 56f:	5f                   	pop    %rdi
 570:	6e                   	outsb  %ds:(%rsi),(%dx)
 571:	75 6d                	jne    5e0 <_init-0x3fff78>
 573:	65                   	gs
 574:	72 69                	jb     5df <_init-0x3fff79>
 576:	63 5f 74             	movslq 0x74(%rdi),%ebx
 579:	72 61                	jb     5dc <_init-0x3fff7c>
 57b:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 582:	65 
 583:	67                   	addr32
 584:	65                   	gs
 585:	72 49                	jb     5d0 <_init-0x3fff88>
 587:	73 45                	jae    5ce <_init-0x3fff8a>
 589:	35 5f 5f 6d 69       	xor    $0x696d5f5f,%eax
 58e:	6e                   	outsb  %ds:(%rsi),(%dx)
 58f:	45 00 77 63          	add    %r14b,0x63(%r15)
 593:	74 6f                	je     604 <_init-0x3fff54>
 595:	62                   	(bad)  {%k5}
 596:	00 5f 53             	add    %bl,0x53(%rdi)
 599:	5f                   	pop    %rdi
 59a:	73 68                	jae    604 <_init-0x3fff54>
 59c:	6f                   	outsl  %ds:(%rsi),(%dx)
 59d:	77 70                	ja     60f <_init-0x3fff49>
 59f:	6f                   	outsl  %ds:(%rsi),(%dx)
 5a0:	69 6e 74 00 5f 53 5f 	imul   $0x5f535f00,0x74(%rsi),%ebp
 5a7:	73 6b                	jae    614 <_init-0x3fff44>
 5a9:	69 70 77 73 00 67 70 	imul   $0x70670073,0x77(%rax),%esi
 5b0:	5f                   	pop    %rdi
 5b1:	6f                   	outsl  %ds:(%rsi),(%dx)
 5b2:	66                   	data16
 5b3:	66                   	data16
 5b4:	73 65                	jae    61b <_init-0x3fff3d>
 5b6:	74 00                	je     5b8 <_init-0x3fffa0>
 5b8:	5f                   	pop    %rdi
 5b9:	53                   	push   %rbx
 5ba:	5f                   	pop    %rdi
 5bb:	61                   	(bad)  
 5bc:	64                   	fs
 5bd:	6a 75                	pushq  $0x75
 5bf:	73 74                	jae    635 <_init-0x3fff23>
 5c1:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%rbp),%sp
 5c7:	5f                   	pop    %rdi
 5c8:	5a                   	pop    %rdx
 5c9:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 5cd:	67 6e                	outsb  %ds:(%esi),(%dx)
 5cf:	75 5f                	jne    630 <_init-0x3fff28>
 5d1:	63 78 78             	movslq 0x78(%rax),%edi
 5d4:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 5d7:	5f                   	pop    %rdi
 5d8:	6e                   	outsb  %ds:(%rsi),(%dx)
 5d9:	75 6d                	jne    648 <_init-0x3fff10>
 5db:	65                   	gs
 5dc:	72 69                	jb     647 <_init-0x3fff11>
 5de:	63 5f 74             	movslq 0x74(%rdi),%ebx
 5e1:	72 61                	jb     644 <_init-0x3fff14>
 5e3:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 5ea:	65 
 5eb:	67                   	addr32
 5ec:	65                   	gs
 5ed:	72 49                	jb     638 <_init-0x3fff20>
 5ef:	6d                   	insl   (%dx),%es:(%rdi)
 5f0:	45 38 5f 5f          	cmp    %r11b,0x5f(%r15)
 5f4:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
 5fb:	00 
 5fc:	66                   	data16
 5fd:	6c                   	insb   (%dx),%es:(%rdi)
 5fe:	6f                   	outsl  %ds:(%rsi),(%dx)
 5ff:	61                   	(bad)  
 600:	74 00                	je     602 <_init-0x3fff56>
 602:	74 6d                	je     671 <_init-0x3ffee7>
 604:	5f                   	pop    %rdi
 605:	6d                   	insl   (%dx),%es:(%rdi)
 606:	69 6e 00 5f 53 5f 6c 	imul   $0x6c5f535f,0x0(%rsi),%ebp
 60d:	65                   	gs
 60e:	66                   	data16
 60f:	74 00                	je     611 <_init-0x3fff47>
 611:	5f                   	pop    %rdi
 612:	53                   	push   %rbx
 613:	5f                   	pop    %rdi
 614:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
 61b:	6e                   	outsb  %ds:(%rsi),(%dx)
 61c:	6d                   	insl   (%dx),%es:(%rdi)
 61d:	6f                   	outsl  %ds:(%rsi),(%dx)
 61e:	64                   	fs
 61f:	65                   	gs
 620:	5f                   	pop    %rdi
 621:	65 6e                	outsb  %gs:(%rsi),(%dx)
 623:	64 00 47 4e          	add    %al,%fs:0x4e(%rdi)
 627:	55                   	push   %rbp
 628:	20 43 2b             	and    %al,0x2b(%rbx)
 62b:	2b 20                	sub    (%rax),%esp
 62d:	34 2e                	xor    $0x2e,%al
 62f:	38 2e                	cmp    %ch,(%rsi)
 631:	34 20                	xor    $0x20,%al
 633:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
 638:	65                   	gs
 639:	3d 67 65 6e 65       	cmp    $0x656e6567,%eax
 63e:	72 69                	jb     6a9 <_init-0x3ffeaf>
 640:	63 20                	movslq (%rax),%esp
 642:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 647:	68 3d 78 38 36       	pushq  $0x3638783d
 64c:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
 651:	67 20 2d 66 73 74 61 	and    %ch,0x61747366(%eip)        # 617479be <_end+0x61146966>
 658:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
 65b:	70 72                	jo     6cf <_init-0x3ffe89>
 65d:	6f                   	outsl  %ds:(%rsi),(%dx)
 65e:	74 65                	je     6c5 <_init-0x3ffe93>
 660:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
 664:	00 77 63             	add    %dh,0x63(%rdi)
 667:	73 73                	jae    6dc <_init-0x3ffe7c>
 669:	70 6e                	jo     6d9 <_init-0x3ffe7f>
 66b:	00 5f 53             	add    %bl,0x53(%rdi)
 66e:	5f                   	pop    %rdi
 66f:	75 70                	jne    6e1 <_init-0x3ffe77>
 671:	70 65                	jo     6d8 <_init-0x3ffe80>
 673:	72 63                	jb     6d8 <_init-0x3ffe80>
 675:	61                   	(bad)  
 676:	73 65                	jae    6dd <_init-0x3ffe7b>
 678:	00 5f 41             	add    %bl,0x41(%rdi)
 67b:	74 6f                	je     6ec <_init-0x3ffe6c>
 67d:	6d                   	insl   (%dx),%es:(%rdi)
 67e:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
 685:	00 6f 76             	add    %ch,0x76(%rdi)
 688:	65                   	gs
 689:	72 66                	jb     6f1 <_init-0x3ffe67>
 68b:	6c                   	insb   (%dx),%es:(%rdi)
 68c:	6f                   	outsl  %ds:(%rsi),(%dx)
 68d:	77 5f                	ja     6ee <_init-0x3ffe6a>
 68f:	61                   	(bad)  
 690:	72 67                	jb     6f9 <_init-0x3ffe5f>
 692:	5f                   	pop    %rdi
 693:	61                   	(bad)  
 694:	72 65                	jb     6fb <_init-0x3ffe5d>
 696:	61                   	(bad)  
 697:	00 5f 53             	add    %bl,0x53(%rdi)
 69a:	5f                   	pop    %rdi
 69b:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
 6a2:	66                   	data16
 6a3:	6c                   	insb   (%dx),%es:(%rdi)
 6a4:	61                   	(bad)  
 6a5:	67 73 5f             	addr32 jae 707 <_init-0x3ffe51>
 6a8:	65 6e                	outsb  %gs:(%rsi),(%dx)
 6aa:	64 00 5f 5f          	add    %bl,%fs:0x5f(%rdi)
 6ae:	63 6f 75             	movslq 0x75(%rdi),%ebp
 6b1:	6e                   	outsb  %ds:(%rsi),(%dx)
 6b2:	74 00                	je     6b4 <_init-0x3ffea4>
 6b4:	5f                   	pop    %rdi
 6b5:	5f                   	pop    %rdi
 6b6:	67 6e                	outsb  %ds:(%esi),(%dx)
 6b8:	75 5f                	jne    719 <_init-0x3ffe3f>
 6ba:	63 78 78             	movslq 0x78(%rax),%edi
 6bd:	00 62 6f             	add    %ah,0x6f(%rdx)
 6c0:	6f                   	outsl  %ds:(%rsi),(%dx)
 6c1:	6c                   	insb   (%dx),%es:(%rdi)
 6c2:	00 6c 6f 6e          	add    %ch,0x6e(%rdi,%rbp,2)
 6c6:	67 20 64 6f 75       	and    %ah,0x75(%edi,%ebp,2)
 6cb:	62                   	(bad)  {%k5}
 6cc:	6c                   	insb   (%dx),%es:(%rdi)
 6cd:	65 00 5f 5f          	add    %bl,%gs:0x5f(%rdi)
 6d1:	6e                   	outsb  %ds:(%rsi),(%dx)
 6d2:	75 6d                	jne    741 <_init-0x3ffe17>
 6d4:	65                   	gs
 6d5:	72 69                	jb     740 <_init-0x3ffe18>
 6d7:	63 5f 74             	movslq 0x74(%rdi),%ebx
 6da:	72 61                	jb     73d <_init-0x3ffe1b>
 6dc:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 6e3:	65 
 6e4:	67                   	addr32
 6e5:	65                   	gs
 6e6:	72 3c                	jb     724 <_init-0x3ffe34>
 6e8:	6c                   	insb   (%dx),%es:(%rdi)
 6e9:	6f                   	outsl  %ds:(%rsi),(%dx)
 6ea:	6e                   	outsb  %ds:(%rsi),(%dx)
 6eb:	67 20 69 6e          	and    %ch,0x6e(%ecx)
 6ef:	74 3e                	je     72f <_init-0x3ffe29>
 6f1:	00 5f 53             	add    %bl,0x53(%rdi)
 6f4:	5f                   	pop    %rdi
 6f5:	66                   	data16
 6f6:	6c                   	insb   (%dx),%es:(%rdi)
 6f7:	6f                   	outsl  %ds:(%rsi),(%dx)
 6f8:	61                   	(bad)  
 6f9:	74 66                	je     761 <_init-0x3ffdf7>
 6fb:	69 65 6c 64 00 5f 53 	imul   $0x535f0064,0x6c(%rbp),%esp
 702:	5f                   	pop    %rdi
 703:	6f                   	outsl  %ds:(%rsi),(%dx)
 704:	63 74 00 5f          	movslq 0x5f(%rax,%rax,1),%esi
 708:	5f                   	pop    %rdi
 709:	77 63                	ja     76e <_init-0x3ffdea>
 70b:	68 62 00 5f 5f       	pushq  $0x5f5f0062
 710:	73 74                	jae    786 <_init-0x3ffdd2>
 712:	61                   	(bad)  
 713:	74 69                	je     77e <_init-0x3ffdda>
 715:	63 5f 69             	movslq 0x69(%rdi),%ebx
 718:	6e                   	outsb  %ds:(%rsi),(%dx)
 719:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
 720:	61 
 721:	74 69                	je     78c <_init-0x3ffdcc>
 723:	6f                   	outsl  %ds:(%rsi),(%dx)
 724:	6e                   	outsb  %ds:(%rsi),(%dx)
 725:	5f                   	pop    %rdi
 726:	61                   	(bad)  
 727:	6e                   	outsb  %ds:(%rsi),(%dx)
 728:	64                   	fs
 729:	5f                   	pop    %rdi
 72a:	64                   	fs
 72b:	65                   	gs
 72c:	73 74                	jae    7a2 <_init-0x3ffdb6>
 72e:	72 75                	jb     7a5 <_init-0x3ffdb3>
 730:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
 734:	6e                   	outsb  %ds:(%rsi),(%dx)
 735:	5f                   	pop    %rdi
 736:	30 00                	xor    %al,(%rax)
 738:	6c                   	insb   (%dx),%es:(%rdi)
 739:	6f                   	outsl  %ds:(%rsi),(%dx)
 73a:	6e                   	outsb  %ds:(%rsi),(%dx)
 73b:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
 740:	67 20 75 6e          	and    %dh,0x6e(%ebp)
 744:	73 69                	jae    7af <_init-0x3ffda9>
 746:	67 6e                	outsb  %ds:(%esi),(%dx)
 748:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 74d:	74 00                	je     74f <_init-0x3ffe09>
 74f:	72 65                	jb     7b6 <_init-0x3ffda2>
 751:	67 5f                	addr32 pop %rdi
 753:	73 61                	jae    7b6 <_init-0x3ffda2>
 755:	76 65                	jbe    7bc <_init-0x3ffd9c>
 757:	5f                   	pop    %rdi
 758:	61                   	(bad)  
 759:	72 65                	jb     7c0 <_init-0x3ffd98>
 75b:	61                   	(bad)  
 75c:	00 77 63             	add    %dh,0x63(%rdi)
 75f:	73 74                	jae    7d5 <_init-0x3ffd83>
 761:	6f                   	outsl  %ds:(%rsi),(%dx)
 762:	6c                   	insb   (%dx),%es:(%rdi)
 763:	64 00 69 6e          	add    %ch,%fs:0x6e(%rcx)
 767:	74 5f                	je     7c8 <_init-0x3ffd90>
 769:	70 5f                	jo     7ca <_init-0x3ffd8e>
 76b:	73 65                	jae    7d2 <_init-0x3ffd86>
 76d:	70 5f                	jo     7ce <_init-0x3ffd8a>
 76f:	62                   	(bad)  {%k5}
 770:	79 5f                	jns    7d1 <_init-0x3ffd87>
 772:	73 70                	jae    7e4 <_init-0x3ffd74>
 774:	61                   	(bad)  
 775:	63 65 00             	movslq 0x0(%rbp),%esp
 778:	5f                   	pop    %rdi
 779:	53                   	push   %rbx
 77a:	5f                   	pop    %rdi
 77b:	69 6f 73 5f 73 65 65 	imul   $0x6565735f,0x73(%rdi),%ebp
 782:	6b 64 69 72 5f       	imul   $0x5f,0x72(%rcx,%rbp,2),%esp
 787:	65 6e                	outsb  %gs:(%rsi),(%dx)
 789:	64 00 77 63          	add    %dh,%fs:0x63(%rdi)
 78d:	73 74                	jae    803 <_init-0x3ffd55>
 78f:	6f                   	outsl  %ds:(%rsi),(%dx)
 790:	6c                   	insb   (%dx),%es:(%rdi)
 791:	6c                   	insb   (%dx),%es:(%rdi)
 792:	00 77 63             	add    %dh,0x63(%rdi)
 795:	73 73                	jae    80a <_init-0x3ffd4e>
 797:	74 72                	je     80b <_init-0x3ffd4d>
 799:	00 5f 49             	add    %bl,0x49(%rdi)
 79c:	6f                   	outsl  %ds:(%rsi),(%dx)
 79d:	73 5f                	jae    7fe <_init-0x3ffd5a>
 79f:	49 6f                	rex.WB outsl %ds:(%rsi),(%dx)
 7a1:	73 74                	jae    817 <_init-0x3ffd41>
 7a3:	61                   	(bad)  
 7a4:	74 65                	je     80b <_init-0x3ffd4d>
 7a6:	00 5f 5a             	add    %bl,0x5a(%rdi)
 7a9:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 7ad:	67 6e                	outsb  %ds:(%esi),(%dx)
 7af:	75 5f                	jne    810 <_init-0x3ffd48>
 7b1:	63 78 78             	movslq 0x78(%rax),%edi
 7b4:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 7b7:	5f                   	pop    %rdi
 7b8:	6e                   	outsb  %ds:(%rsi),(%dx)
 7b9:	75 6d                	jne    828 <_init-0x3ffd30>
 7bb:	65                   	gs
 7bc:	72 69                	jb     827 <_init-0x3ffd31>
 7be:	63 5f 74             	movslq 0x74(%rdi),%ebx
 7c1:	72 61                	jb     824 <_init-0x3ffd34>
 7c3:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 7ca:	65 
 7cb:	67                   	addr32
 7cc:	65                   	gs
 7cd:	72 49                	jb     818 <_init-0x3ffd40>
 7cf:	63 45 35             	movslq 0x35(%rbp),%eax
 7d2:	5f                   	pop    %rdi
 7d3:	5f                   	pop    %rdi
 7d4:	6d                   	insl   (%dx),%es:(%rdi)
 7d5:	61                   	(bad)  
 7d6:	78 45                	js     81d <_init-0x3ffd3b>
 7d8:	00 77 63             	add    %dh,0x63(%rdi)
 7db:	73 72                	jae    84f <_init-0x3ffd09>
 7dd:	74 6f                	je     84e <_init-0x3ffd0a>
 7df:	6d                   	insl   (%dx),%es:(%rdi)
 7e0:	62 73                	(bad)  {%k5}
 7e2:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 7e6:	77 64                	ja     84c <_init-0x3ffd0c>
 7e8:	61                   	(bad)  
 7e9:	79 00                	jns    7eb <_init-0x3ffd6d>
 7eb:	5f                   	pop    %rdi
 7ec:	53                   	push   %rbx
 7ed:	5f                   	pop    %rdi
 7ee:	75 6e                	jne    85e <_init-0x3ffcfa>
 7f0:	69 74 62 75 66 00 5f 	imul   $0x5f5f0066,0x75(%rdx,%riz,2),%esi
 7f7:	5f 
 7f8:	64 69 67 69 74 73 00 	imul   $0x77007374,%fs:0x69(%rdi),%esp
 7ff:	77 
 800:	63 73 74             	movslq 0x74(%rbx),%esi
 803:	6f                   	outsl  %ds:(%rsi),(%dx)
 804:	64 00 77 63          	add    %dh,%fs:0x63(%rdi)
 808:	73 74                	jae    87e <_init-0x3ffcda>
 80a:	6f                   	outsl  %ds:(%rsi),(%dx)
 80b:	66                   	data16
 80c:	00 77 63             	add    %dh,0x63(%rdi)
 80f:	73 74                	jae    885 <_init-0x3ffcd3>
 811:	6f                   	outsl  %ds:(%rsi),(%dx)
 812:	6b 00 77             	imul   $0x77,(%rax),%eax
 815:	63 73 74             	movslq 0x74(%rbx),%esi
 818:	6f                   	outsl  %ds:(%rsi),(%dx)
 819:	6c                   	insb   (%dx),%es:(%rdi)
 81a:	00 5f 5f             	add    %bl,0x5f(%rdi)
 81d:	46                   	rex.RX
 81e:	49                   	rex.WB
 81f:	4c                   	rex.WR
 820:	45 00 73 65          	add    %r14b,0x65(%r11)
 824:	74 6c                	je     892 <_init-0x3ffcc6>
 826:	6f                   	outsl  %ds:(%rsi),(%dx)
 827:	63 61 6c             	movslq 0x6c(%rcx),%esp
 82a:	65 00 77 69          	add    %dh,%gs:0x69(%rdi)
 82e:	6e                   	outsb  %ds:(%rsi),(%dx)
 82f:	74 5f                	je     890 <_init-0x3ffcc8>
 831:	74 00                	je     833 <_init-0x3ffd25>
 833:	5f                   	pop    %rdi
 834:	53                   	push   %rbx
 835:	5f                   	pop    %rdi
 836:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
 83d:	6e                   	outsb  %ds:(%rsi),(%dx)
 83e:	6d                   	insl   (%dx),%es:(%rdi)
 83f:	6f                   	outsl  %ds:(%rsi),(%dx)
 840:	64                   	fs
 841:	65                   	gs
 842:	5f                   	pop    %rdi
 843:	6d                   	insl   (%dx),%es:(%rdi)
 844:	61                   	(bad)  
 845:	78 00                	js     847 <_init-0x3ffd11>
 847:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 84e:	65 00 77 63          	add    %dh,%gs:0x63(%rdi)
 852:	73 6c                	jae    8c0 <_init-0x3ffc98>
 854:	65 6e                	outsb  %gs:(%rsi),(%dx)
 856:	00 69 6f             	add    %ch,0x6f(%rcx)
 859:	73 74                	jae    8cf <_init-0x3ffc89>
 85b:	61                   	(bad)  
 85c:	74 65                	je     8c3 <_init-0x3ffc95>
 85e:	00 5f 53             	add    %bl,0x53(%rdi)
 861:	5f                   	pop    %rdi
 862:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
 869:	66                   	data16
 86a:	6c                   	insb   (%dx),%es:(%rdi)
 86b:	61                   	(bad)  
 86c:	67 73 5f             	addr32 jae 8ce <_init-0x3ffc8a>
 86f:	6d                   	insl   (%dx),%es:(%rdi)
 870:	61                   	(bad)  
 871:	78 00                	js     873 <_init-0x3ffce5>
 873:	5f                   	pop    %rdi
 874:	5f                   	pop    %rdi
 875:	64                   	fs
 876:	65                   	gs
 877:	62                   	(bad)  {%k5}
 878:	75 67                	jne    8e1 <_init-0x3ffc77>
 87a:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 87e:	67 6d                	insl   (%dx),%es:(%edi)
 880:	74 6f                	je     8f1 <_init-0x3ffc67>
 882:	66                   	data16
 883:	66                   	data16
 884:	00 63 75             	add    %ah,0x75(%rbx)
 887:	72 72                	jb     8fb <_init-0x3ffc5d>
 889:	65 6e                	outsb  %gs:(%rsi),(%dx)
 88b:	63 79 5f             	movslq 0x5f(%rcx),%edi
 88e:	73 79                	jae    909 <_init-0x3ffc4f>
 890:	6d                   	insl   (%dx),%es:(%rdi)
 891:	62                   	(bad)  {%k5}
 892:	6f                   	outsl  %ds:(%rsi),(%dx)
 893:	6c                   	insb   (%dx),%es:(%rdi)
 894:	00 73 68             	add    %dh,0x68(%rbx)
 897:	6f                   	outsl  %ds:(%rsi),(%dx)
 898:	72 74                	jb     90e <_init-0x3ffc4a>
 89a:	20 69 6e             	and    %ch,0x6e(%rcx)
 89d:	74 00                	je     89f <_init-0x3ffcb9>
 89f:	77 63                	ja     904 <_init-0x3ffc54>
 8a1:	73 66                	jae    909 <_init-0x3ffc4f>
 8a3:	74 69                	je     90e <_init-0x3ffc4a>
 8a5:	6d                   	insl   (%dx),%es:(%rdi)
 8a6:	65 00 66 75          	add    %ah,%gs:0x75(%rsi)
 8aa:	6e                   	outsb  %ds:(%rsi),(%dx)
 8ab:	63 00                	movslq (%rax),%eax
 8ad:	6d                   	insl   (%dx),%es:(%rdi)
 8ae:	6f                   	outsl  %ds:(%rsi),(%dx)
 8af:	6e                   	outsb  %ds:(%rsi),(%dx)
 8b0:	5f                   	pop    %rdi
 8b1:	67 72 6f             	addr32 jb 923 <_init-0x3ffc35>
 8b4:	75 70                	jne    926 <_init-0x3ffc32>
 8b6:	69 6e 67 00 5f 53 5f 	imul   $0x5f535f00,0x67(%rsi),%ebp
 8bd:	63 75 72             	movslq 0x72(%rbp),%esi
 8c0:	00 77 63             	add    %dh,0x63(%rdi)
 8c3:	73 63                	jae    928 <_init-0x3ffc30>
 8c5:	61                   	(bad)  
 8c6:	74 00                	je     8c8 <_init-0x3ffc90>
 8c8:	31 31                	xor    %esi,(%rcx)
 8ca:	5f                   	pop    %rdi
 8cb:	5f                   	pop    %rdi
 8cc:	6d                   	insl   (%dx),%es:(%rdi)
 8cd:	62 73 74 61 74       	(bad)  {%k1}
 8d2:	65                   	gs
 8d3:	5f                   	pop    %rdi
 8d4:	74 00                	je     8d6 <_init-0x3ffc82>
 8d6:	69 6e 74 5f 70 5f 73 	imul   $0x735f705f,0x74(%rsi),%ebp
 8dd:	69 67 6e 5f 70 6f 73 	imul   $0x736f705f,0x6e(%rdi),%esp
 8e4:	6e                   	outsb  %ds:(%rsi),(%dx)
 8e5:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 8e9:	7a 6f                	jp     95a <_init-0x3ffbfe>
 8eb:	6e                   	outsb  %ds:(%rsi),(%dx)
 8ec:	65 00 76 77          	add    %dh,%gs:0x77(%rsi)
 8f0:	73 63                	jae    955 <_init-0x3ffc03>
 8f2:	61                   	(bad)  
 8f3:	6e                   	outsb  %ds:(%rsi),(%dx)
 8f4:	66                   	data16
 8f5:	00 5f 53             	add    %bl,0x53(%rdi)
 8f8:	5f                   	pop    %rdi
 8f9:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%rdi),%ebp
 900:	74 61                	je     963 <_init-0x3ffbf5>
 902:	74 65                	je     969 <_init-0x3ffbef>
 904:	5f                   	pop    %rdi
 905:	65 6e                	outsb  %gs:(%rsi),(%dx)
 907:	64 00 77 63          	add    %dh,%fs:0x63(%rdi)
 90b:	72 74                	jb     981 <_init-0x3ffbd7>
 90d:	6f                   	outsl  %ds:(%rsi),(%dx)
 90e:	6d                   	insl   (%dx),%es:(%rdi)
 90f:	62                   	(bad)  {%k1}
 910:	00 6c 63 6f          	add    %ch,0x6f(%rbx,%riz,2)
 914:	6e                   	outsb  %ds:(%rsi),(%dx)
 915:	76 00                	jbe    917 <_init-0x3ffc41>
 917:	77 63                	ja     97c <_init-0x3ffbdc>
 919:	73 6e                	jae    989 <_init-0x3ffbcf>
 91b:	63 61 74             	movslq 0x74(%rcx),%esp
 91e:	00 5f 5f             	add    %bl,0x5f(%rdi)
 921:	6e                   	outsb  %ds:(%rsi),(%dx)
 922:	75 6d                	jne    991 <_init-0x3ffbc7>
 924:	65                   	gs
 925:	72 69                	jb     990 <_init-0x3ffbc8>
 927:	63 5f 74             	movslq 0x74(%rdi),%ebx
 92a:	72 61                	jb     98d <_init-0x3ffbcb>
 92c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 933:	65 
 934:	67                   	addr32
 935:	65                   	gs
 936:	72 3c                	jb     974 <_init-0x3ffbe4>
 938:	73 68                	jae    9a2 <_init-0x3ffbb6>
 93a:	6f                   	outsl  %ds:(%rsi),(%dx)
 93b:	72 74                	jb     9b1 <_init-0x3ffba7>
 93d:	20 69 6e             	and    %ch,0x6e(%rcx)
 940:	74 3e                	je     980 <_init-0x3ffbd8>
 942:	00 5f 5f             	add    %bl,0x5f(%rdi)
 945:	64                   	fs
 946:	73 6f                	jae    9b7 <_init-0x3ffba1>
 948:	5f                   	pop    %rdi
 949:	68 61 6e 64 6c       	pushq  $0x6c646e61
 94e:	65 00 6c 6f 6e       	add    %ch,%gs:0x6e(%rdi,%rbp,2)
 953:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
 958:	67 20 69 6e          	and    %ch,0x6e(%ecx)
 95c:	74 00                	je     95e <_init-0x3ffbfa>
 95e:	66                   	data16
 95f:	70 75                	jo     9d6 <_init-0x3ffb82>
 961:	74 77                	je     9da <_init-0x3ffb7e>
 963:	63 00                	movslq (%rax),%eax
 965:	66                   	data16
 966:	70 75                	jo     9dd <_init-0x3ffb7b>
 968:	74 77                	je     9e1 <_init-0x3ffb77>
 96a:	73 00                	jae    96c <_init-0x3ffbec>
 96c:	7e 49                	jle    9b7 <_init-0x3ffba1>
 96e:	6e                   	outsb  %ds:(%rsi),(%dx)
 96f:	69 74 00 6d 62 73 72 	imul   $0x74727362,0x6d(%rax,%rax,1),%esi
 976:	74 
 977:	6f                   	outsl  %ds:(%rsi),(%dx)
 978:	77 63                	ja     9dd <_init-0x3ffb7b>
 97a:	73 00                	jae    97c <_init-0x3ffbdc>
 97c:	5f                   	pop    %rdi
 97d:	53                   	push   %rbx
 97e:	5f                   	pop    %rdi
 97f:	66                   	data16
 980:	61                   	(bad)  
 981:	69 6c 62 69 74 00 5f 	imul   $0x5f5f0074,0x69(%rdx,%riz,2),%ebp
 988:	5f 
 989:	6e                   	outsb  %ds:(%rsi),(%dx)
 98a:	75 6d                	jne    9f9 <_init-0x3ffb5f>
 98c:	65                   	gs
 98d:	72 69                	jb     9f8 <_init-0x3ffb60>
 98f:	63 5f 74             	movslq 0x74(%rdi),%ebx
 992:	72 61                	jb     9f5 <_init-0x3ffb63>
 994:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 99b:	65 
 99c:	67                   	addr32
 99d:	65                   	gs
 99e:	72 3c                	jb     9dc <_init-0x3ffb7c>
 9a0:	6c                   	insb   (%dx),%es:(%rdi)
 9a1:	6f                   	outsl  %ds:(%rsi),(%dx)
 9a2:	6e                   	outsb  %ds:(%rsi),(%dx)
 9a3:	67 20 75 6e          	and    %dh,0x6e(%ebp)
 9a7:	73 69                	jae    a12 <_init-0x3ffb46>
 9a9:	67 6e                	outsb  %ds:(%esi),(%dx)
 9ab:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 9b0:	74 3e                	je     9f0 <_init-0x3ffb68>
 9b2:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 9b6:	79 65                	jns    a1d <_init-0x3ffb3b>
 9b8:	61                   	(bad)  
 9b9:	72 00                	jb     9bb <_init-0x3ffb9d>
 9bb:	73 68                	jae    a25 <_init-0x3ffb33>
 9bd:	6f                   	outsl  %ds:(%rsi),(%dx)
 9be:	72 74                	jb     a34 <_init-0x3ffb24>
 9c0:	20 75 6e             	and    %dh,0x6e(%rbp)
 9c3:	73 69                	jae    a2e <_init-0x3ffb2a>
 9c5:	67 6e                	outsb  %ds:(%esi),(%dx)
 9c7:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 9cc:	74 00                	je     9ce <_init-0x3ffb8a>
 9ce:	76 66                	jbe    a36 <_init-0x3ffb22>
 9d0:	77 73                	ja     a45 <_init-0x3ffb13>
 9d2:	63 61 6e             	movslq 0x6e(%rcx),%esp
 9d5:	66                   	data16
 9d6:	00 5f 49             	add    %bl,0x49(%rdi)
 9d9:	6f                   	outsl  %ds:(%rsi),(%dx)
 9da:	73 5f                	jae    a3b <_init-0x3ffb1d>
 9dc:	53                   	push   %rbx
 9dd:	65 65 6b 64 69 72 00 	gs imul $0x0,%gs:0x72(%rcx,%rbp,2),%esp
 9e4:	66 6d                	insw   (%dx),%es:(%rdi)
 9e6:	74 66                	je     a4e <_init-0x3ffb0a>
 9e8:	6c                   	insb   (%dx),%es:(%rdi)
 9e9:	61                   	(bad)  
 9ea:	67 73 00             	addr32 jae 9ed <_init-0x3ffb6b>
 9ed:	5f                   	pop    %rdi
 9ee:	5f                   	pop    %rdi
 9ef:	69 6e 74 33 32 5f 74 	imul   $0x745f3233,0x74(%rsi),%ebp
 9f6:	00 6d 62             	add    %ch,0x62(%rbp)
 9f9:	73 69                	jae    a64 <_init-0x3ffaf4>
 9fb:	6e                   	outsb  %ds:(%rsi),(%dx)
 9fc:	69 74 00 69 73 77 63 	imul   $0x74637773,0x69(%rax,%rax,1),%esi
 a03:	74 
 a04:	79 70                	jns    a76 <_init-0x3ffae2>
 a06:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
 a0a:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 a0e:	67 6e                	outsb  %ds:(%esi),(%dx)
 a10:	75 5f                	jne    a71 <_init-0x3ffae7>
 a12:	63 78 78             	movslq 0x78(%rax),%edi
 a15:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 a18:	5f                   	pop    %rdi
 a19:	6e                   	outsb  %ds:(%rsi),(%dx)
 a1a:	75 6d                	jne    a89 <_init-0x3ffacf>
 a1c:	65                   	gs
 a1d:	72 69                	jb     a88 <_init-0x3ffad0>
 a1f:	63 5f 74             	movslq 0x74(%rdi),%ebx
 a22:	72 61                	jb     a85 <_init-0x3ffad3>
 a24:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 a2b:	65 
 a2c:	67                   	addr32
 a2d:	65                   	gs
 a2e:	72 49                	jb     a79 <_init-0x3ffadf>
 a30:	6c                   	insb   (%dx),%es:(%rdi)
 a31:	45 35 5f 5f 6d 69    	rex.RB xor $0x696d5f5f,%eax
 a37:	6e                   	outsb  %ds:(%rsi),(%dx)
 a38:	45 00 5f 53          	add    %r11b,0x53(%r15)
 a3c:	5f                   	pop    %rdi
 a3d:	73 63                	jae    aa2 <_init-0x3ffab6>
 a3f:	69 65 6e 74 69 66 69 	imul   $0x69666974,0x6e(%rbp),%esp
 a46:	63 00                	movslq (%rax),%eax
 a48:	77 63                	ja     aad <_init-0x3ffaab>
 a4a:	68 61 72 5f 74       	pushq  $0x745f7261
 a4f:	00 74 79 70          	add    %dh,0x70(%rcx,%rdi,2)
 a53:	65                   	gs
 a54:	64                   	fs
 a55:	65                   	gs
 a56:	66                   	data16
 a57:	20 5f 5f             	and    %bl,0x5f(%rdi)
 a5a:	76 61                	jbe    abd <_init-0x3ffa9b>
 a5c:	5f                   	pop    %rdi
 a5d:	6c                   	insb   (%dx),%es:(%rdi)
 a5e:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
 a65:	20 5f 5f             	and    %bl,0x5f(%rdi)
 a68:	76 61                	jbe    acb <_init-0x3ffa8d>
 a6a:	5f                   	pop    %rdi
 a6b:	6c                   	insb   (%dx),%es:(%rdi)
 a6c:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
 a73:	00 77 63             	add    %dh,0x63(%rdi)
 a76:	73 74                	jae    aec <_init-0x3ffa6c>
 a78:	6f                   	outsl  %ds:(%rsi),(%dx)
 a79:	75 6c                	jne    ae7 <_init-0x3ffa71>
	...
