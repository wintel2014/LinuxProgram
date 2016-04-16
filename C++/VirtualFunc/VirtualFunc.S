
VirtualFunc:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x43b>
  400248:	78 38                	js     400282 <_init-0x42e>
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
  400283:	00 a1 c9 aa 03 9d    	add    %ah,-0x62fc5537(%rcx)
  400289:	14 d9                	adc    $0xd9,%al
  40028b:	2e                   	cs
  40028c:	6d                   	insl   (%dx),%es:(%rdi)
  40028d:	c0 4b 4e 28          	rorb   $0x28,0x4e(%rbx)
  400291:	7b d4                	jnp    400267 <_init-0x449>
  400293:	45                   	rex.RB
  400294:	44 3b cb             	cmp    %ebx,%r9d
  400297:	29                   	.byte 0x29

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	03 00                	add    (%rax),%eax
  40029a:	00 00                	add    %al,(%rax)
  40029c:	0a 00                	or     (%rax),%al
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
  4002a2:	00 00                	add    %al,(%rax)
  4002a4:	06                   	(bad)  
  4002a5:	00 00                	add    %al,(%rax)
  4002a7:	00 80 01 10 00 01    	add    %al,0x1001001(%rax)
  4002ad:	01 00                	add    %eax,(%rax)
  4002af:	00 0a                	add    %cl,(%rdx)
  4002b1:	00 00                	add    %al,(%rax)
  4002b3:	00 00                	add    %al,(%rax)
  4002b5:	00 00                	add    %al,(%rax)
  4002b7:	00 0b                	add    %cl,(%rbx)
  4002b9:	00 00                	add    %al,(%rax)
  4002bb:	00 c9                	add    %cl,%cl
  4002bd:	81 0a d2 28 45 d5    	orl    $0xd54528d2,(%rdx)
  4002c3:	4c                   	rex.WR
  4002c4:	15                   	.byte 0x15
  4002c5:	98                   	cwtl   
  4002c6:	0c 43                	or     $0x43,%al

Disassembly of section .dynsym:

00000000004002c8 <.dynsym>:
	...
  4002e0:	10 00                	adc    %al,(%rax)
  4002e2:	00 00                	add    %al,(%rax)
  4002e4:	20 00                	and    %al,(%rax)
	...
  4002f6:	00 00                	add    %al,(%rax)
  4002f8:	1f                   	(bad)  
  4002f9:	00 00                	add    %al,(%rax)
  4002fb:	00 20                	add    %ah,(%rax)
	...
  40030d:	00 00                	add    %al,(%rax)
  40030f:	00 ef                	add    %ch,%bh
  400311:	00 00                	add    %al,(%rax)
  400313:	00 12                	add    %dl,(%rdx)
	...
  400325:	00 00                	add    %al,(%rax)
  400327:	00 1e                	add    %bl,(%rsi)
  400329:	01 00                	add    %eax,(%rax)
  40032b:	00 12                	add    %dl,(%rdx)
	...
  40033d:	00 00                	add    %al,(%rax)
  40033f:	00 11                	add    %dl,(%rcx)
  400341:	01 00                	add    %eax,(%rax)
  400343:	00 12                	add    %dl,(%rdx)
	...
  400355:	00 00                	add    %al,(%rax)
  400357:	00 33                	add    %dh,(%rbx)
  400359:	00 00                	add    %al,(%rax)
  40035b:	00 20                	add    %ah,(%rax)
	...
  40036d:	00 00                	add    %al,(%rax)
  40036f:	00 b7 00 00 00 12    	add    %dh,0x12000000(%rdi)
	...
  400385:	00 00                	add    %al,(%rax)
  400387:	00 4f 00             	add    %cl,0x0(%rdi)
  40038a:	00 00                	add    %al,(%rax)
  40038c:	20 00                	and    %al,(%rax)
	...
  40039e:	00 00                	add    %al,(%rax)
  4003a0:	b1 00                	mov    $0x0,%cl
  4003a2:	00 00                	add    %al,(%rax)
  4003a4:	12 00                	adc    (%rax),%al
	...
  4003b6:	00 00                	add    %al,(%rax)
  4003b8:	81 00 00 00 21 00    	addl   $0x210000,(%rax)
  4003be:	19 00                	sbb    %eax,(%rax)
  4003c0:	60                   	(bad)  
  4003c1:	10 60 00             	adc    %ah,0x0(%rax)
  4003c4:	00 00                	add    %al,(%rax)
  4003c6:	00 00                	add    %al,(%rax)
  4003c8:	58                   	pop    %rax
  4003c9:	00 00                	add    %al,(%rax)
  4003cb:	00 00                	add    %al,(%rax)
  4003cd:	00 00                	add    %al,(%rax)
  4003cf:	00 69 00             	add    %ch,0x0(%rcx)
  4003d2:	00 00                	add    %al,(%rax)
  4003d4:	12 00                	adc    (%rax),%al
  4003d6:	00 00                	add    %al,(%rax)
  4003d8:	20 07                	and    %al,(%rdi)
  4003da:	40 00 00             	add    %al,(%rax)
	...
  4003e5:	00 00                	add    %al,(%rax)
  4003e7:	00 a7 00 00 00 11    	add    %ah,0x11000000(%rdi)
  4003ed:	00 19                	add    %bl,(%rcx)
  4003ef:	00 c0                	add    %al,%al
  4003f1:	10 60 00             	adc    %ah,0x0(%rax)
  4003f4:	00 00                	add    %al,(%rax)
  4003f6:	00 00                	add    %al,(%rax)
  4003f8:	10 01                	adc    %al,(%rcx)
  4003fa:	00 00                	add    %al,(%rax)
  4003fc:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000400400 <.dynstr>:
  400400:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  400404:	73 74                	jae    40047a <_init-0x236>
  400406:	64 63 2b             	movslq %fs:(%rbx),%ebp
  400409:	2b 2e                	sub    (%rsi),%ebp
  40040b:	73 6f                	jae    40047c <_init-0x234>
  40040d:	2e 36 00 5f 5f       	cs add %bl,%cs:%ss:0x5f(%rdi)
  400412:	67 6d                	insl   (%dx),%es:(%edi)
  400414:	6f                   	outsl  %ds:(%rsi),(%dx)
  400415:	6e                   	outsb  %ds:(%rsi),(%dx)
  400416:	5f                   	pop    %rdi
  400417:	73 74                	jae    40048d <_init-0x223>
  400419:	61                   	(bad)  
  40041a:	72 74                	jb     400490 <_init-0x220>
  40041c:	5f                   	pop    %rdi
  40041d:	5f                   	pop    %rdi
  40041e:	00 5f 4a             	add    %bl,0x4a(%rdi)
  400421:	76 5f                	jbe    400482 <_init-0x22e>
  400423:	52                   	push   %rdx
  400424:	65 67 69 73 74 65 72 	imul   $0x6c437265,%gs:0x74(%ebx),%esi
  40042b:	43 6c 
  40042d:	61                   	(bad)  
  40042e:	73 73                	jae    4004a3 <_init-0x20d>
  400430:	65                   	gs
  400431:	73 00                	jae    400433 <_init-0x27d>
  400433:	5f                   	pop    %rdi
  400434:	49 54                	rex.WB push %r12
  400436:	4d 5f                	rex.WRB pop %r15
  400438:	64                   	fs
  400439:	65                   	gs
  40043a:	72 65                	jb     4004a1 <_init-0x20f>
  40043c:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  400443:	4d 
  400444:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  400446:	6f                   	outsl  %ds:(%rsi),(%dx)
  400447:	6e                   	outsb  %ds:(%rsi),(%dx)
  400448:	65                   	gs
  400449:	54                   	push   %rsp
  40044a:	61                   	(bad)  
  40044b:	62                   	(bad)  
  40044c:	6c                   	insb   (%dx),%es:(%rdi)
  40044d:	65 00 5f 49          	add    %bl,%gs:0x49(%rdi)
  400451:	54                   	push   %rsp
  400452:	4d 5f                	rex.WRB pop %r15
  400454:	72 65                	jb     4004bb <_init-0x1f5>
  400456:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
  40045d:	4d 
  40045e:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
  400460:	6f                   	outsl  %ds:(%rsi),(%dx)
  400461:	6e                   	outsb  %ds:(%rsi),(%dx)
  400462:	65                   	gs
  400463:	54                   	push   %rsp
  400464:	61                   	(bad)  
  400465:	62                   	(bad)  
  400466:	6c                   	insb   (%dx),%es:(%rdi)
  400467:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
  40046b:	4e 53                	rex.WRX push %rbx
  40046d:	74 38                	je     4004a7 <_init-0x209>
  40046f:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
  400476:	65                   	gs
  400477:	34 49                	xor    $0x49,%al
  400479:	6e                   	outsb  %ds:(%rsi),(%dx)
  40047a:	69 74 44 31 45 76 00 	imul   $0x5f007645,0x31(%rsp,%rax,2),%esi
  400481:	5f 
  400482:	5a                   	pop    %rdx
  400483:	54                   	push   %rsp
  400484:	56                   	push   %rsi
  400485:	4e 31 30             	rex.WRX xor %r14,(%rax)
  400488:	5f                   	pop    %rdi
  400489:	5f                   	pop    %rdi
  40048a:	63 78 78             	movslq 0x78(%rax),%edi
  40048d:	61                   	(bad)  
  40048e:	62                   	(bad)  
  40048f:	69 76 31 31 37 5f 5f 	imul   $0x5f5f3731,0x31(%rsi),%esi
  400496:	63 6c 61 73          	movslq 0x73(%rcx,%riz,2),%ebp
  40049a:	73 5f                	jae    4004fb <_init-0x1b5>
  40049c:	74 79                	je     400517 <_init-0x199>
  40049e:	70 65                	jo     400505 <_init-0x1ab>
  4004a0:	5f                   	pop    %rdi
  4004a1:	69 6e 66 6f 45 00 5f 	imul   $0x5f00456f,0x66(%rsi),%ebp
  4004a8:	5a                   	pop    %rdx
  4004a9:	53                   	push   %rbx
  4004aa:	74 34                	je     4004e0 <_init-0x1d0>
  4004ac:	63 6f 75             	movslq 0x75(%rdi),%ebp
  4004af:	74 00                	je     4004b1 <_init-0x1ff>
  4004b1:	5f                   	pop    %rdi
  4004b2:	5a                   	pop    %rdx
  4004b3:	6e                   	outsb  %ds:(%rsi),(%dx)
  4004b4:	77 6d                	ja     400523 <_init-0x18d>
  4004b6:	00 5f 5a             	add    %bl,0x5a(%rdi)
  4004b9:	53                   	push   %rbx
  4004ba:	74 6c                	je     400528 <_init-0x188>
  4004bc:	73 49                	jae    400507 <_init-0x1a9>
  4004be:	53                   	push   %rbx
  4004bf:	74 31                	je     4004f2 <_init-0x1be>
  4004c1:	31 63 68             	xor    %esp,0x68(%rbx)
  4004c4:	61                   	(bad)  
  4004c5:	72 5f                	jb     400526 <_init-0x18a>
  4004c7:	74 72                	je     40053b <_init-0x175>
  4004c9:	61                   	(bad)  
  4004ca:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%rbx,%rsi,2),%esi
  4004d1:	52 
  4004d2:	53                   	push   %rbx
  4004d3:	74 31                	je     400506 <_init-0x1aa>
  4004d5:	33 62 61             	xor    0x61(%rdx),%esp
  4004d8:	73 69                	jae    400543 <_init-0x16d>
  4004da:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
  4004dd:	73 74                	jae    400553 <_init-0x15d>
  4004df:	72 65                	jb     400546 <_init-0x16a>
  4004e1:	61                   	(bad)  
  4004e2:	6d                   	insl   (%dx),%es:(%rdi)
  4004e3:	49 63 54 5f 45       	movslq 0x45(%r15,%rbx,2),%rdx
  4004e8:	53                   	push   %rbx
  4004e9:	35 5f 50 4b 63       	xor    $0x634b505f,%eax
  4004ee:	00 5f 5a             	add    %bl,0x5a(%rdi)
  4004f1:	4e 53                	rex.WRX push %rbx
  4004f3:	74 38                	je     40052d <_init-0x183>
  4004f5:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
  4004fc:	65                   	gs
  4004fd:	34 49                	xor    $0x49,%al
  4004ff:	6e                   	outsb  %ds:(%rsi),(%dx)
  400500:	69 74 43 31 45 76 00 	imul   $0x6c007645,0x31(%rbx,%rax,2),%esi
  400507:	6c 
  400508:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%rdx),%esp
  40050f:	36 00 5f 5f          	add    %bl,%ss:0x5f(%rdi)
  400513:	63 78 61             	movslq 0x61(%rax),%edi
  400516:	5f                   	pop    %rdi
  400517:	61                   	(bad)  
  400518:	74 65                	je     40057f <_init-0x131>
  40051a:	78 69                	js     400585 <_init-0x12b>
  40051c:	74 00                	je     40051e <_init-0x192>
  40051e:	5f                   	pop    %rdi
  40051f:	5f                   	pop    %rdi
  400520:	6c                   	insb   (%dx),%es:(%rdi)
  400521:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  400528:	72 74                	jb     40059e <_init-0x112>
  40052a:	5f                   	pop    %rdi
  40052b:	6d                   	insl   (%dx),%es:(%rdi)
  40052c:	61                   	(bad)  
  40052d:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
  400534:	43 5f                	rex.XB pop %r15
  400536:	32 2e                	xor    (%rsi),%ch
  400538:	32 2e                	xor    (%rsi),%ch
  40053a:	35 00 43 58 58       	xor    $0x58584300,%eax
  40053f:	41                   	rex.B
  400540:	42                   	rex.X
  400541:	49 5f                	rex.WB pop %r15
  400543:	31 2e                	xor    %ebp,(%rsi)
  400545:	33 00                	xor    (%rax),%eax
  400547:	47                   	rex.RXB
  400548:	4c                   	rex.WR
  400549:	49                   	rex.WB
  40054a:	42                   	rex.X
  40054b:	43 58                	rex.XB pop %r8
  40054d:	58                   	pop    %rax
  40054e:	5f                   	pop    %rdi
  40054f:	33 2e                	xor    (%rsi),%ebp
  400551:	34 00                	xor    $0x0,%al

Disassembly of section .gnu.version:

0000000000400554 <.gnu.version>:
  400554:	00 00                	add    %al,(%rax)
  400556:	00 00                	add    %al,(%rax)
  400558:	00 00                	add    %al,(%rax)
  40055a:	02 00                	add    (%rax),%al
  40055c:	03 00                	add    (%rax),%eax
  40055e:	03 00                	add    (%rax),%eax
  400560:	00 00                	add    %al,(%rax)
  400562:	02 00                	add    (%rax),%al
  400564:	00 00                	add    %al,(%rax)
  400566:	02 00                	add    (%rax),%al
  400568:	04 00                	add    $0x0,%al
  40056a:	02 00                	add    (%rax),%al
  40056c:	02 00                	add    (%rax),%al

Disassembly of section .gnu.version_r:

0000000000400570 <.gnu.version_r>:
  400570:	01 00                	add    %eax,(%rax)
  400572:	01 00                	add    %eax,(%rax)
  400574:	07                   	(bad)  
  400575:	01 00                	add    %eax,(%rax)
  400577:	00 10                	add    %dl,(%rax)
  400579:	00 00                	add    %al,(%rax)
  40057b:	00 20                	add    %ah,(%rax)
  40057d:	00 00                	add    %al,(%rax)
  40057f:	00 75 1a             	add    %dh,0x1a(%rbp)
  400582:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
  400588:	30 01                	xor    %al,(%rcx)
  40058a:	00 00                	add    %al,(%rax)
  40058c:	00 00                	add    %al,(%rax)
  40058e:	00 00                	add    %al,(%rax)
  400590:	01 00                	add    %eax,(%rax)
  400592:	02 00                	add    (%rax),%al
  400594:	01 00                	add    %eax,(%rax)
  400596:	00 00                	add    %al,(%rax)
  400598:	10 00                	adc    %al,(%rax)
  40059a:	00 00                	add    %al,(%rax)
  40059c:	00 00                	add    %al,(%rax)
  40059e:	00 00                	add    %al,(%rax)
  4005a0:	d3 af 6b 05 00 00    	shrl   %cl,0x56b(%rdi)
  4005a6:	04 00                	add    $0x0,%al
  4005a8:	3c 01                	cmp    $0x1,%al
  4005aa:	00 00                	add    %al,(%rax)
  4005ac:	10 00                	adc    %al,(%rax)
  4005ae:	00 00                	add    %al,(%rax)
  4005b0:	74 29                	je     4005db <_init-0xd5>
  4005b2:	92                   	xchg   %eax,%edx
  4005b3:	08 00                	or     %al,(%rax)
  4005b5:	00 02                	add    %al,(%rdx)
  4005b7:	00 47 01             	add    %al,0x1(%rdi)
  4005ba:	00 00                	add    %al,(%rax)
  4005bc:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

00000000004005c0 <.rela.dyn>:
  4005c0:	f8                   	clc    
  4005c1:	0f 60 00             	punpcklbw (%rax),%mm0
  4005c4:	00 00                	add    %al,(%rax)
  4005c6:	00 00                	add    %al,(%rax)
  4005c8:	06                   	(bad)  
  4005c9:	00 00                	add    %al,(%rax)
  4005cb:	00 01                	add    %al,(%rcx)
	...
  4005d5:	00 00                	add    %al,(%rax)
  4005d7:	00 60 10             	add    %ah,0x10(%rax)
  4005da:	60                   	(bad)  
  4005db:	00 00                	add    %al,(%rax)
  4005dd:	00 00                	add    %al,(%rax)
  4005df:	00 05 00 00 00 0a    	add    %al,0xa000000(%rip)        # a4005e5 <_end+0x9dff40d>
	...
  4005ed:	00 00                	add    %al,(%rax)
  4005ef:	00 c0                	add    %al,%al
  4005f1:	10 60 00             	adc    %ah,0x0(%rax)
  4005f4:	00 00                	add    %al,(%rax)
  4005f6:	00 00                	add    %al,(%rax)
  4005f8:	05 00 00 00 0c       	add    $0xc000000,%eax
	...

Disassembly of section .rela.plt:

0000000000400608 <.rela.plt>:
  400608:	18 10                	sbb    %dl,(%rax)
  40060a:	60                   	(bad)  
  40060b:	00 00                	add    %al,(%rax)
  40060d:	00 00                	add    %al,(%rax)
  40060f:	00 07                	add    %al,(%rdi)
  400611:	00 00                	add    %al,(%rax)
  400613:	00 01                	add    %al,(%rcx)
	...
  40061d:	00 00                	add    %al,(%rax)
  40061f:	00 20                	add    %ah,(%rax)
  400621:	10 60 00             	adc    %ah,0x0(%rax)
  400624:	00 00                	add    %al,(%rax)
  400626:	00 00                	add    %al,(%rax)
  400628:	07                   	(bad)  
  400629:	00 00                	add    %al,(%rax)
  40062b:	00 03                	add    %al,(%rbx)
	...
  400635:	00 00                	add    %al,(%rax)
  400637:	00 28                	add    %ch,(%rax)
  400639:	10 60 00             	adc    %ah,0x0(%rax)
  40063c:	00 00                	add    %al,(%rax)
  40063e:	00 00                	add    %al,(%rax)
  400640:	07                   	(bad)  
  400641:	00 00                	add    %al,(%rax)
  400643:	00 04 00             	add    %al,(%rax,%rax,1)
	...
  40064e:	00 00                	add    %al,(%rax)
  400650:	30 10                	xor    %dl,(%rax)
  400652:	60                   	(bad)  
  400653:	00 00                	add    %al,(%rax)
  400655:	00 00                	add    %al,(%rax)
  400657:	00 07                	add    %al,(%rdi)
  400659:	00 00                	add    %al,(%rax)
  40065b:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 400661 <_init-0x4f>
  400661:	00 00                	add    %al,(%rax)
  400663:	00 00                	add    %al,(%rax)
  400665:	00 00                	add    %al,(%rax)
  400667:	00 38                	add    %bh,(%rax)
  400669:	10 60 00             	adc    %ah,0x0(%rax)
  40066c:	00 00                	add    %al,(%rax)
  40066e:	00 00                	add    %al,(%rax)
  400670:	07                   	(bad)  
  400671:	00 00                	add    %al,(%rax)
  400673:	00 0b                	add    %cl,(%rbx)
	...
  40067d:	00 00                	add    %al,(%rax)
  40067f:	00 40 10             	add    %al,0x10(%rax)
  400682:	60                   	(bad)  
  400683:	00 00                	add    %al,(%rax)
  400685:	00 00                	add    %al,(%rax)
  400687:	00 07                	add    %al,(%rdi)
  400689:	00 00                	add    %al,(%rax)
  40068b:	00 07                	add    %al,(%rdi)
	...
  400695:	00 00                	add    %al,(%rax)
  400697:	00 48 10             	add    %cl,0x10(%rax)
  40069a:	60                   	(bad)  
  40069b:	00 00                	add    %al,(%rax)
  40069d:	00 00                	add    %al,(%rax)
  40069f:	00 07                	add    %al,(%rdi)
  4006a1:	00 00                	add    %al,(%rax)
  4006a3:	00 09                	add    %cl,(%rcx)
	...

Disassembly of section .init:

00000000004006b0 <_init>:
  4006b0:	48 83 ec 08          	sub    $0x8,%rsp
  4006b4:	48 8b 05 3d 09 20 00 	mov    0x20093d(%rip),%rax        # 600ff8 <_DYNAMIC+0x1e0>
  4006bb:	48 85 c0             	test   %rax,%rax
  4006be:	74 05                	je     4006c5 <_init+0x15>
  4006c0:	e8 1b 00 00 00       	callq  4006e0 <__gmon_start__@plt>
  4006c5:	48 83 c4 08          	add    $0x8,%rsp
  4006c9:	c3                   	retq   

Disassembly of section .plt:

00000000004006d0 <__gmon_start__@plt-0x10>:
  4006d0:	ff 35 32 09 20 00    	pushq  0x200932(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4006d6:	ff 25 34 09 20 00    	jmpq   *0x200934(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4006dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006e0 <__gmon_start__@plt>:
  4006e0:	ff 25 32 09 20 00    	jmpq   *0x200932(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4006e6:	68 00 00 00 00       	pushq  $0x0
  4006eb:	e9 e0 ff ff ff       	jmpq   4006d0 <_init+0x20>

00000000004006f0 <_ZNSt8ios_base4InitC1Ev@plt>:
  4006f0:	ff 25 2a 09 20 00    	jmpq   *0x20092a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4006f6:	68 01 00 00 00       	pushq  $0x1
  4006fb:	e9 d0 ff ff ff       	jmpq   4006d0 <_init+0x20>

0000000000400700 <__libc_start_main@plt>:
  400700:	ff 25 22 09 20 00    	jmpq   *0x200922(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400706:	68 02 00 00 00       	pushq  $0x2
  40070b:	e9 c0 ff ff ff       	jmpq   4006d0 <_init+0x20>

0000000000400710 <__cxa_atexit@plt>:
  400710:	ff 25 1a 09 20 00    	jmpq   *0x20091a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400716:	68 03 00 00 00       	pushq  $0x3
  40071b:	e9 b0 ff ff ff       	jmpq   4006d0 <_init+0x20>

0000000000400720 <_ZNSt8ios_base4InitD1Ev@plt>:
  400720:	ff 25 12 09 20 00    	jmpq   *0x200912(%rip)        # 601038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400726:	68 04 00 00 00       	pushq  $0x4
  40072b:	e9 a0 ff ff ff       	jmpq   4006d0 <_init+0x20>

0000000000400730 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
  400730:	ff 25 0a 09 20 00    	jmpq   *0x20090a(%rip)        # 601040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400736:	68 05 00 00 00       	pushq  $0x5
  40073b:	e9 90 ff ff ff       	jmpq   4006d0 <_init+0x20>

0000000000400740 <_Znwm@plt>:
  400740:	ff 25 02 09 20 00    	jmpq   *0x200902(%rip)        # 601048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400746:	68 06 00 00 00       	pushq  $0x6
  40074b:	e9 80 ff ff ff       	jmpq   4006d0 <_init+0x20>

Disassembly of section .text:

0000000000400750 <_start>:
  400750:	31 ed                	xor    %ebp,%ebp
  400752:	49 89 d1             	mov    %rdx,%r9
  400755:	5e                   	pop    %rsi
  400756:	48 89 e2             	mov    %rsp,%rdx
  400759:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40075d:	50                   	push   %rax
  40075e:	54                   	push   %rsp
  40075f:	49 c7 c0 d0 09 40 00 	mov    $0x4009d0,%r8
  400766:	48 c7 c1 60 09 40 00 	mov    $0x400960,%rcx
  40076d:	48 c7 c7 3d 08 40 00 	mov    $0x40083d,%rdi
  400774:	e8 87 ff ff ff       	callq  400700 <__libc_start_main@plt>
  400779:	f4                   	hlt    
  40077a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400780 <deregister_tm_clones>:
  400780:	b8 67 10 60 00       	mov    $0x601067,%eax
  400785:	55                   	push   %rbp
  400786:	48 2d 60 10 60 00    	sub    $0x601060,%rax
  40078c:	48 83 f8 0e          	cmp    $0xe,%rax
  400790:	48 89 e5             	mov    %rsp,%rbp
  400793:	77 02                	ja     400797 <deregister_tm_clones+0x17>
  400795:	5d                   	pop    %rbp
  400796:	c3                   	retq   
  400797:	b8 00 00 00 00       	mov    $0x0,%eax
  40079c:	48 85 c0             	test   %rax,%rax
  40079f:	74 f4                	je     400795 <deregister_tm_clones+0x15>
  4007a1:	5d                   	pop    %rbp
  4007a2:	bf 60 10 60 00       	mov    $0x601060,%edi
  4007a7:	ff e0                	jmpq   *%rax
  4007a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004007b0 <register_tm_clones>:
  4007b0:	b8 60 10 60 00       	mov    $0x601060,%eax
  4007b5:	55                   	push   %rbp
  4007b6:	48 2d 60 10 60 00    	sub    $0x601060,%rax
  4007bc:	48 c1 f8 03          	sar    $0x3,%rax
  4007c0:	48 89 e5             	mov    %rsp,%rbp
  4007c3:	48 89 c2             	mov    %rax,%rdx
  4007c6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4007ca:	48 01 d0             	add    %rdx,%rax
  4007cd:	48 d1 f8             	sar    %rax
  4007d0:	75 02                	jne    4007d4 <register_tm_clones+0x24>
  4007d2:	5d                   	pop    %rbp
  4007d3:	c3                   	retq   
  4007d4:	ba 00 00 00 00       	mov    $0x0,%edx
  4007d9:	48 85 d2             	test   %rdx,%rdx
  4007dc:	74 f4                	je     4007d2 <register_tm_clones+0x22>
  4007de:	5d                   	pop    %rbp
  4007df:	48 89 c6             	mov    %rax,%rsi
  4007e2:	bf 60 10 60 00       	mov    $0x601060,%edi
  4007e7:	ff e2                	jmpq   *%rdx
  4007e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004007f0 <__do_global_dtors_aux>:
  4007f0:	80 3d d9 09 20 00 00 	cmpb   $0x0,0x2009d9(%rip)        # 6011d0 <completed.6973>
  4007f7:	75 11                	jne    40080a <__do_global_dtors_aux+0x1a>
  4007f9:	55                   	push   %rbp
  4007fa:	48 89 e5             	mov    %rsp,%rbp
  4007fd:	e8 7e ff ff ff       	callq  400780 <deregister_tm_clones>
  400802:	5d                   	pop    %rbp
  400803:	c6 05 c6 09 20 00 01 	movb   $0x1,0x2009c6(%rip)        # 6011d0 <completed.6973>
  40080a:	f3 c3                	repz retq 
  40080c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400810 <frame_dummy>:
  400810:	48 83 3d f8 05 20 00 	cmpq   $0x0,0x2005f8(%rip)        # 600e10 <__JCR_END__>
  400817:	00 
  400818:	74 1e                	je     400838 <frame_dummy+0x28>
  40081a:	b8 00 00 00 00       	mov    $0x0,%eax
  40081f:	48 85 c0             	test   %rax,%rax
  400822:	74 14                	je     400838 <frame_dummy+0x28>
  400824:	55                   	push   %rbp
  400825:	bf 10 0e 60 00       	mov    $0x600e10,%edi
  40082a:	48 89 e5             	mov    %rsp,%rbp
  40082d:	ff d0                	callq  *%rax
  40082f:	5d                   	pop    %rbp
  400830:	e9 7b ff ff ff       	jmpq   4007b0 <register_tm_clones>
  400835:	0f 1f 00             	nopl   (%rax)
  400838:	e9 73 ff ff ff       	jmpq   4007b0 <register_tm_clones>

000000000040083d <main>:
    private:
        int n;
};

int main()
{
  40083d:	55                   	push   %rbp
  40083e:	48 89 e5             	mov    %rsp,%rbp
  400841:	53                   	push   %rbx
  400842:	48 83 ec 18          	sub    $0x18,%rsp
    Base *pB = new Base();
  400846:	bf 10 00 00 00       	mov    $0x10,%edi
  40084b:	e8 f0 fe ff ff       	callq  400740 <_Znwm@plt>
  400850:	48 89 c3             	mov    %rax,%rbx
  400853:	48 89 df             	mov    %rbx,%rdi
  400856:	e8 9d 00 00 00       	callq  4008f8 <_ZN4BaseC1Ev>
  40085b:	48 89 5d e0          	mov    %rbx,-0x20(%rbp)
    pB->show();
  40085f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  400863:	48 8b 00             	mov    (%rax),%rax
  400866:	48 8b 00             	mov    (%rax),%rax
  400869:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  40086d:	48 89 d7             	mov    %rdx,%rdi
  400870:	ff d0                	callq  *%rax

    Base *pB2=NULL;
  400872:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  400879:	00 
    pB2->disp();
  40087a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40087e:	48 89 c7             	mov    %rax,%rdi
  400881:	e8 b0 00 00 00       	callq  400936 <_ZN4Base4dispEv>
    pB2->show();
  400886:	48 8b 45 e8          	mov    -0x18(%rbp),%rax  <=========="this" is moved to RAX
  40088a:	48 8b 00             	mov    (%rax),%rax       <==========VTABLE
  40088d:	48 8b 00             	mov    (%rax),%rax       <==========VTABLE[0]
  400890:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx 
  400894:	48 89 d7             	mov    %rdx,%rdi         <==========arg (this) is stored into RDI 
  400897:	ff d0                	callq  *%rax
}
  400899:	b8 00 00 00 00       	mov    $0x0,%eax
  40089e:	48 83 c4 18          	add    $0x18,%rsp
  4008a2:	5b                   	pop    %rbx
  4008a3:	5d                   	pop    %rbp
  4008a4:	c3                   	retq   

00000000004008a5 <_Z41__static_initialization_and_destruction_0ii>:
  4008a5:	55                   	push   %rbp
  4008a6:	48 89 e5             	mov    %rsp,%rbp
  4008a9:	48 83 ec 10          	sub    $0x10,%rsp
  4008ad:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4008b0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  4008b3:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4008b7:	75 27                	jne    4008e0 <_Z41__static_initialization_and_destruction_0ii+0x3b>
  4008b9:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
  4008c0:	75 1e                	jne    4008e0 <_Z41__static_initialization_and_destruction_0ii+0x3b>
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
  4008c2:	bf d1 11 60 00       	mov    $0x6011d1,%edi
  4008c7:	e8 24 fe ff ff       	callq  4006f0 <_ZNSt8ios_base4InitC1Ev@plt>
  4008cc:	ba 58 10 60 00       	mov    $0x601058,%edx
  4008d1:	be d1 11 60 00       	mov    $0x6011d1,%esi
  4008d6:	bf 20 07 40 00       	mov    $0x400720,%edi
  4008db:	e8 30 fe ff ff       	callq  400710 <__cxa_atexit@plt>
  4008e0:	c9                   	leaveq 
  4008e1:	c3                   	retq   

00000000004008e2 <_GLOBAL__sub_I_main>:
  4008e2:	55                   	push   %rbp
  4008e3:	48 89 e5             	mov    %rsp,%rbp
  4008e6:	be ff ff 00 00       	mov    $0xffff,%esi
  4008eb:	bf 01 00 00 00       	mov    $0x1,%edi
  4008f0:	e8 b0 ff ff ff       	callq  4008a5 <_Z41__static_initialization_and_destruction_0ii>
  4008f5:	5d                   	pop    %rbp
  4008f6:	c3                   	retq   
  4008f7:	90                   	nop

00000000004008f8 <_ZN4BaseC1Ev>:
#include<iostream>
using namespace std;

class Base {
    public:
        Base():n(0x123) {}
  4008f8:	55                   	push   %rbp
  4008f9:	48 89 e5             	mov    %rsp,%rbp
  4008fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400900:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400904:	48 c7 00 20 0a 40 00 	movq   $0x400a20,(%rax)
  40090b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40090f:	c7 40 08 23 01 00 00 	movl   $0x123,0x8(%rax)
  400916:	5d                   	pop    %rbp
  400917:	c3                   	retq   

0000000000400918 <_ZN4Base4showEv>:
        virtual void show() {cout<<"This is vitual func\n";}
  400918:	55                   	push   %rbp
  400919:	48 89 e5             	mov    %rsp,%rbp
  40091c:	48 83 ec 10          	sub    $0x10,%rsp
  400920:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400924:	be e4 09 40 00       	mov    $0x4009e4,%esi
  400929:	bf c0 10 60 00       	mov    $0x6010c0,%edi
  40092e:	e8 fd fd ff ff       	callq  400730 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400933:	c9                   	leaveq 
  400934:	c3                   	retq   
  400935:	90                   	nop

0000000000400936 <_ZN4Base4dispEv>:
        void disp() {cout<<"This is not virtual\n";}
  400936:	55                   	push   %rbp
  400937:	48 89 e5             	mov    %rsp,%rbp
  40093a:	48 83 ec 10          	sub    $0x10,%rsp
  40093e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400942:	be f9 09 40 00       	mov    $0x4009f9,%esi
  400947:	bf c0 10 60 00       	mov    $0x6010c0,%edi
  40094c:	e8 df fd ff ff       	callq  400730 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400951:	c9                   	leaveq 
  400952:	c3                   	retq   
  400953:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40095a:	00 00 00 
  40095d:	0f 1f 00             	nopl   (%rax)

0000000000400960 <__libc_csu_init>:
  400960:	41 57                	push   %r15
  400962:	41 89 ff             	mov    %edi,%r15d
  400965:	41 56                	push   %r14
  400967:	49 89 f6             	mov    %rsi,%r14
  40096a:	41 55                	push   %r13
  40096c:	49 89 d5             	mov    %rdx,%r13
  40096f:	41 54                	push   %r12
  400971:	4c 8d 25 80 04 20 00 	lea    0x200480(%rip),%r12        # 600df8 <__frame_dummy_init_array_entry>
  400978:	55                   	push   %rbp
  400979:	48 8d 2d 88 04 20 00 	lea    0x200488(%rip),%rbp        # 600e08 <__init_array_end>
  400980:	53                   	push   %rbx
  400981:	4c 29 e5             	sub    %r12,%rbp
  400984:	31 db                	xor    %ebx,%ebx
  400986:	48 c1 fd 03          	sar    $0x3,%rbp
  40098a:	48 83 ec 08          	sub    $0x8,%rsp
  40098e:	e8 1d fd ff ff       	callq  4006b0 <_init>
  400993:	48 85 ed             	test   %rbp,%rbp
  400996:	74 1e                	je     4009b6 <__libc_csu_init+0x56>
  400998:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40099f:	00 
  4009a0:	4c 89 ea             	mov    %r13,%rdx
  4009a3:	4c 89 f6             	mov    %r14,%rsi
  4009a6:	44 89 ff             	mov    %r15d,%edi
  4009a9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4009ad:	48 83 c3 01          	add    $0x1,%rbx
  4009b1:	48 39 eb             	cmp    %rbp,%rbx
  4009b4:	75 ea                	jne    4009a0 <__libc_csu_init+0x40>
  4009b6:	48 83 c4 08          	add    $0x8,%rsp
  4009ba:	5b                   	pop    %rbx
  4009bb:	5d                   	pop    %rbp
  4009bc:	41 5c                	pop    %r12
  4009be:	41 5d                	pop    %r13
  4009c0:	41 5e                	pop    %r14
  4009c2:	41 5f                	pop    %r15
  4009c4:	c3                   	retq   
  4009c5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  4009cc:	00 00 00 00 

00000000004009d0 <__libc_csu_fini>:
  4009d0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004009d4 <_fini>:
  4009d4:	48 83 ec 08          	sub    $0x8,%rsp
  4009d8:	48 83 c4 08          	add    $0x8,%rsp
  4009dc:	c3                   	retq   

Disassembly of section .rodata:

00000000004009e0 <_IO_stdin_used>:
  4009e0:	01 00                	add    %eax,(%rax)
  4009e2:	02 00                	add    (%rax),%al
  4009e4:	54                   	push   %rsp
  4009e5:	68 69 73 20 69       	pushq  $0x69207369
  4009ea:	73 20                	jae    400a0c <_IO_stdin_used+0x2c>
  4009ec:	76 69                	jbe    400a57 <_ZTI4Base+0x27>
  4009ee:	74 75                	je     400a65 <_ZTI4Base+0x35>
  4009f0:	61                   	(bad)  
  4009f1:	6c                   	insb   (%dx),%es:(%rdi)
  4009f2:	20 66 75             	and    %ah,0x75(%rsi)
  4009f5:	6e                   	outsb  %ds:(%rsi),(%dx)
  4009f6:	63 0a                	movslq (%rdx),%ecx
  4009f8:	00 54 68 69          	add    %dl,0x69(%rax,%rbp,2)
  4009fc:	73 20                	jae    400a1e <_ZTV4Base+0xe>
  4009fe:	69 73 20 6e 6f 74 20 	imul   $0x20746f6e,0x20(%rbx),%esi
  400a05:	76 69                	jbe    400a70 <_ZTI4Base+0x40>
  400a07:	72 74                	jb     400a7d <_ZTI4Base+0x4d>
  400a09:	75 61                	jne    400a6c <_ZTI4Base+0x3c>
  400a0b:	6c                   	insb   (%dx),%es:(%rdi)
  400a0c:	0a 00                	or     (%rax),%al
	...

0000000000400a10 <_ZTV4Base>:
	...
  400a18:	30 0a                	xor    %cl,(%rdx)
  400a1a:	40 00 00             	add    %al,(%rax)
  400a1d:	00 00                	add    %al,(%rax)
  400a1f:	00 18                	add    %bl,(%rax)
  400a21:	09 40 00             	or     %eax,0x0(%rax)
  400a24:	00 00                	add    %al,(%rax)
	...

0000000000400a28 <_ZTS4Base>:
  400a28:	34 42                	xor    $0x42,%al
  400a2a:	61                   	(bad)  
  400a2b:	73 65                	jae    400a92 <_ZTI4Base+0x62>
  400a2d:	00 00                	add    %al,(%rax)
	...

0000000000400a30 <_ZTI4Base>:
  400a30:	70 10                	jo     400a42 <_ZTI4Base+0x12>
  400a32:	60                   	(bad)  
  400a33:	00 00                	add    %al,(%rax)
  400a35:	00 00                	add    %al,(%rax)
  400a37:	00 28                	add    %ch,(%rax)
  400a39:	0a 40 00             	or     0x0(%rax),%al
  400a3c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .eh_frame_hdr:

0000000000400a40 <.eh_frame_hdr>:
  400a40:	01 1b                	add    %ebx,(%rbx)
  400a42:	03 3b                	add    (%rbx),%edi
  400a44:	5c                   	pop    %rsp
  400a45:	00 00                	add    %al,(%rax)
  400a47:	00 0a                	add    %cl,(%rdx)
  400a49:	00 00                	add    %al,(%rax)
  400a4b:	00 90 fc ff ff a8    	add    %dl,-0x57000004(%rax)
  400a51:	00 00                	add    %al,(%rax)
  400a53:	00 10                	add    %dl,(%rax)
  400a55:	fd                   	std    
  400a56:	ff                   	(bad)  
  400a57:	ff                   	(bad)  
  400a58:	78 00                	js     400a5a <_ZTI4Base+0x2a>
  400a5a:	00 00                	add    %al,(%rax)
  400a5c:	fd                   	std    
  400a5d:	fd                   	std    
  400a5e:	ff                   	(bad)  
  400a5f:	ff 30                	pushq  (%rax)
  400a61:	01 00                	add    %eax,(%rax)
  400a63:	00 65 fe             	add    %ah,-0x2(%rbp)
  400a66:	ff                   	(bad)  
  400a67:	ff 58 01             	lcallq *0x1(%rax)
  400a6a:	00 00                	add    %al,(%rax)
  400a6c:	a2 fe ff ff 78 01 00 	movabs %al,0xb800000178fffffe
  400a73:	00 b8 
  400a75:	fe                   	(bad)  
  400a76:	ff                   	(bad)  
  400a77:	ff d0                	callq  *%rax
  400a79:	00 00                	add    %al,(%rax)
  400a7b:	00 d8                	add    %bl,%al
  400a7d:	fe                   	(bad)  
  400a7e:	ff                   	(bad)  
  400a7f:	ff f0                	push   %rax
  400a81:	00 00                	add    %al,(%rax)
  400a83:	00 f6                	add    %dh,%dh
  400a85:	fe                   	(bad)  
  400a86:	ff                   	(bad)  
  400a87:	ff 10                	callq  *(%rax)
  400a89:	01 00                	add    %eax,(%rax)
  400a8b:	00 20                	add    %ah,(%rax)
  400a8d:	ff                   	(bad)  
  400a8e:	ff                   	(bad)  
  400a8f:	ff 98 01 00 00 90    	lcallq *-0x6fffffff(%rax)
  400a95:	ff                   	(bad)  
  400a96:	ff                   	(bad)  
  400a97:	ff e0                	jmpq   *%rax
  400a99:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .eh_frame:

0000000000400aa0 <__FRAME_END__-0x198>:
  400aa0:	14 00                	adc    $0x0,%al
  400aa2:	00 00                	add    %al,(%rax)
  400aa4:	00 00                	add    %al,(%rax)
  400aa6:	00 00                	add    %al,(%rax)
  400aa8:	01 7a 52             	add    %edi,0x52(%rdx)
  400aab:	00 01                	add    %al,(%rcx)
  400aad:	78 10                	js     400abf <_ZTI4Base+0x8f>
  400aaf:	01 1b                	add    %ebx,(%rbx)
  400ab1:	0c 07                	or     $0x7,%al
  400ab3:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  400ab9:	00 00                	add    %al,(%rax)
  400abb:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400abe:	00 00                	add    %al,(%rax)
  400ac0:	90                   	nop
  400ac1:	fc                   	cld    
  400ac2:	ff                   	(bad)  
  400ac3:	ff 2a                	ljmpq  *(%rdx)
	...
  400acd:	00 00                	add    %al,(%rax)
  400acf:	00 14 00             	add    %dl,(%rax,%rax,1)
  400ad2:	00 00                	add    %al,(%rax)
  400ad4:	00 00                	add    %al,(%rax)
  400ad6:	00 00                	add    %al,(%rax)
  400ad8:	01 7a 52             	add    %edi,0x52(%rdx)
  400adb:	00 01                	add    %al,(%rcx)
  400add:	78 10                	js     400aef <_ZTI4Base+0xbf>
  400adf:	01 1b                	add    %ebx,(%rbx)
  400ae1:	0c 07                	or     $0x7,%al
  400ae3:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  400ae9:	00 00                	add    %al,(%rax)
  400aeb:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400aee:	00 00                	add    %al,(%rax)
  400af0:	e0 fb                	loopne 400aed <_ZTI4Base+0xbd>
  400af2:	ff                   	(bad)  
  400af3:	ff 80 00 00 00 00    	incl   0x0(%rax)
  400af9:	0e                   	(bad)  
  400afa:	10 46 0e             	adc    %al,0xe(%rsi)
  400afd:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400b00:	0b 77 08             	or     0x8(%rdi),%esi
  400b03:	80 00 3f             	addb   $0x3f,(%rax)
  400b06:	1a 3b                	sbb    (%rbx),%bh
  400b08:	2a 33                	sub    (%rbx),%dh
  400b0a:	24 22                	and    $0x22,%al
  400b0c:	00 00                	add    %al,(%rax)
  400b0e:	00 00                	add    %al,(%rax)
  400b10:	1c 00                	sbb    $0x0,%al
  400b12:	00 00                	add    %al,(%rax)
  400b14:	44 00 00             	add    %r8b,(%rax)
  400b17:	00 e0                	add    %ah,%al
  400b19:	fd                   	std    
  400b1a:	ff                   	(bad)  
  400b1b:	ff 20                	jmpq   *(%rax)
  400b1d:	00 00                	add    %al,(%rax)
  400b1f:	00 00                	add    %al,(%rax)
  400b21:	41 0e                	rex.B (bad) 
  400b23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400b29:	5b                   	pop    %rbx
  400b2a:	0c 07                	or     $0x7,%al
  400b2c:	08 00                	or     %al,(%rax)
  400b2e:	00 00                	add    %al,(%rax)
  400b30:	1c 00                	sbb    $0x0,%al
  400b32:	00 00                	add    %al,(%rax)
  400b34:	64 00 00             	add    %al,%fs:(%rax)
  400b37:	00 e0                	add    %ah,%al
  400b39:	fd                   	std    
  400b3a:	ff                   	(bad)  
  400b3b:	ff 1d 00 00 00 00    	lcallq *0x0(%rip)        # 400b41 <_ZTI4Base+0x111>
  400b41:	41 0e                	rex.B (bad) 
  400b43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400b49:	58                   	pop    %rax
  400b4a:	0c 07                	or     $0x7,%al
  400b4c:	08 00                	or     %al,(%rax)
  400b4e:	00 00                	add    %al,(%rax)
  400b50:	1c 00                	sbb    $0x0,%al
  400b52:	00 00                	add    %al,(%rax)
  400b54:	84 00                	test   %al,(%rax)
  400b56:	00 00                	add    %al,(%rax)
  400b58:	de fd                	fdivrp %st,%st(5)
  400b5a:	ff                   	(bad)  
  400b5b:	ff 1d 00 00 00 00    	lcallq *0x0(%rip)        # 400b61 <_ZTI4Base+0x131>
  400b61:	41 0e                	rex.B (bad) 
  400b63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400b69:	58                   	pop    %rax
  400b6a:	0c 07                	or     $0x7,%al
  400b6c:	08 00                	or     %al,(%rax)
  400b6e:	00 00                	add    %al,(%rax)
  400b70:	24 00                	and    $0x0,%al
  400b72:	00 00                	add    %al,(%rax)
  400b74:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  400b75:	00 00                	add    %al,(%rax)
  400b77:	00 c5                	add    %al,%ch
  400b79:	fc                   	cld    
  400b7a:	ff                   	(bad)  
  400b7b:	ff 68 00             	ljmpq  *0x0(%rax)
  400b7e:	00 00                	add    %al,(%rax)
  400b80:	00 41 0e             	add    %al,0xe(%rcx)
  400b83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400b89:	45 83 03 02          	rex.RB addl $0x2,(%r11)
  400b8d:	5e                   	pop    %rsi
  400b8e:	0c 07                	or     $0x7,%al
  400b90:	08 00                	or     %al,(%rax)
  400b92:	00 00                	add    %al,(%rax)
  400b94:	00 00                	add    %al,(%rax)
  400b96:	00 00                	add    %al,(%rax)
  400b98:	1c 00                	sbb    $0x0,%al
  400b9a:	00 00                	add    %al,(%rax)
  400b9c:	cc                   	int3   
  400b9d:	00 00                	add    %al,(%rax)
  400b9f:	00 05 fd ff ff 3d    	add    %al,0x3dfffffd(%rip)        # 3e400ba2 <_end+0x3ddff9ca>
  400ba5:	00 00                	add    %al,(%rax)
  400ba7:	00 00                	add    %al,(%rax)
  400ba9:	41 0e                	rex.B (bad) 
  400bab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400bb1:	78 0c                	js     400bbf <_ZTI4Base+0x18f>
  400bb3:	07                   	(bad)  
  400bb4:	08 00                	or     %al,(%rax)
  400bb6:	00 00                	add    %al,(%rax)
  400bb8:	1c 00                	sbb    $0x0,%al
  400bba:	00 00                	add    %al,(%rax)
  400bbc:	ec                   	in     (%dx),%al
  400bbd:	00 00                	add    %al,(%rax)
  400bbf:	00 22                	add    %ah,(%rdx)
  400bc1:	fd                   	std    
  400bc2:	ff                   	(bad)  
  400bc3:	ff 15 00 00 00 00    	callq  *0x0(%rip)        # 400bc9 <_ZTI4Base+0x199>
  400bc9:	41 0e                	rex.B (bad) 
  400bcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400bd1:	50                   	push   %rax
  400bd2:	0c 07                	or     $0x7,%al
  400bd4:	08 00                	or     %al,(%rax)
  400bd6:	00 00                	add    %al,(%rax)
  400bd8:	44 00 00             	add    %r8b,(%rax)
  400bdb:	00 0c 01             	add    %cl,(%rcx,%rax,1)
  400bde:	00 00                	add    %al,(%rax)
  400be0:	80 fd ff             	cmp    $0xff,%ch
  400be3:	ff 65 00             	jmpq   *0x0(%rbp)
  400be6:	00 00                	add    %al,(%rax)
  400be8:	00 42 0e             	add    %al,0xe(%rdx)
  400beb:	10 8f 02 45 0e 18    	adc    %cl,0x180e4502(%rdi)
  400bf1:	8e 03                	mov    (%rbx),%es
  400bf3:	45 0e                	rex.RB (bad) 
  400bf5:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
  400bfb:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86701a49 <_end+0xffffffff86100871>
  400c01:	06                   	(bad)  
  400c02:	48 0e                	rex.W (bad) 
  400c04:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  400c0a:	6c                   	insb   (%dx),%es:(%rdi)
  400c0b:	0e                   	(bad)  
  400c0c:	38 41 0e             	cmp    %al,0xe(%rcx)
  400c0f:	30 41 0e             	xor    %al,0xe(%rcx)
  400c12:	28 42 0e             	sub    %al,0xe(%rdx)
  400c15:	20 42 0e             	and    %al,0xe(%rdx)
  400c18:	18 42 0e             	sbb    %al,0xe(%rdx)
  400c1b:	10 42 0e             	adc    %al,0xe(%rdx)
  400c1e:	08 00                	or     %al,(%rax)
  400c20:	14 00                	adc    $0x0,%al
  400c22:	00 00                	add    %al,(%rax)
  400c24:	54                   	push   %rsp
  400c25:	01 00                	add    %eax,(%rax)
  400c27:	00 a8 fd ff ff 02    	add    %ch,0x2fffffd(%rax)
	...

0000000000400c38 <__FRAME_END__>:
  400c38:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600df8 <__frame_dummy_init_array_entry>:
  600df8:	10 08                	adc    %cl,(%rax)
  600dfa:	40 00 00             	add    %al,(%rax)
  600dfd:	00 00                	add    %al,(%rax)
  600dff:	00 e2                	add    %ah,%dl
  600e01:	08 40 00             	or     %al,0x0(%rax)
  600e04:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000600e08 <__do_global_dtors_aux_fini_array_entry>:
  600e08:	f0 07                	lock (bad) 
  600e0a:	40 00 00             	add    %al,(%rax)
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
  600e30:	07                   	(bad)  
  600e31:	01 00                	add    %eax,(%rax)
  600e33:	00 00                	add    %al,(%rax)
  600e35:	00 00                	add    %al,(%rax)
  600e37:	00 0c 00             	add    %cl,(%rax,%rax,1)
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	b0 06                	mov    $0x6,%al
  600e42:	40 00 00             	add    %al,(%rax)
  600e45:	00 00                	add    %al,(%rax)
  600e47:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 600e4d <_DYNAMIC+0x35>
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 d4                	add    %dl,%ah
  600e51:	09 40 00             	or     %eax,0x0(%rax)
  600e54:	00 00                	add    %al,(%rax)
  600e56:	00 00                	add    %al,(%rax)
  600e58:	19 00                	sbb    %eax,(%rax)
  600e5a:	00 00                	add    %al,(%rax)
  600e5c:	00 00                	add    %al,(%rax)
  600e5e:	00 00                	add    %al,(%rax)
  600e60:	f8                   	clc    
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
  600eaf:	00 00                	add    %al,(%rax)
  600eb1:	04 40                	add    $0x40,%al
  600eb3:	00 00                	add    %al,(%rax)
  600eb5:	00 00                	add    %al,(%rax)
  600eb7:	00 06                	add    %al,(%rsi)
  600eb9:	00 00                	add    %al,(%rax)
  600ebb:	00 00                	add    %al,(%rax)
  600ebd:	00 00                	add    %al,(%rax)
  600ebf:	00 c8                	add    %cl,%al
  600ec1:	02 40 00             	add    0x0(%rax),%al
  600ec4:	00 00                	add    %al,(%rax)
  600ec6:	00 00                	add    %al,(%rax)
  600ec8:	0a 00                	or     (%rax),%al
  600eca:	00 00                	add    %al,(%rax)
  600ecc:	00 00                	add    %al,(%rax)
  600ece:	00 00                	add    %al,(%rax)
  600ed0:	53                   	push   %rbx
  600ed1:	01 00                	add    %eax,(%rax)
  600ed3:	00 00                	add    %al,(%rax)
  600ed5:	00 00                	add    %al,(%rax)
  600ed7:	00 0b                	add    %cl,(%rbx)
  600ed9:	00 00                	add    %al,(%rax)
  600edb:	00 00                	add    %al,(%rax)
  600edd:	00 00                	add    %al,(%rax)
  600edf:	00 18                	add    %bl,(%rax)
  600ee1:	00 00                	add    %al,(%rax)
  600ee3:	00 00                	add    %al,(%rax)
  600ee5:	00 00                	add    %al,(%rax)
  600ee7:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 600eed <_DYNAMIC+0xd5>
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
  600f10:	a8 00                	test   $0x0,%al
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
  600f2f:	00 08                	add    %cl,(%rax)
  600f31:	06                   	(bad)  
  600f32:	40 00 00             	add    %al,(%rax)
  600f35:	00 00                	add    %al,(%rax)
  600f37:	00 07                	add    %al,(%rdi)
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 c0                	add    %al,%al
  600f41:	05 40 00 00 00       	add    $0x40,%eax
  600f46:	00 00                	add    %al,(%rax)
  600f48:	08 00                	or     %al,(%rax)
  600f4a:	00 00                	add    %al,(%rax)
  600f4c:	00 00                	add    %al,(%rax)
  600f4e:	00 00                	add    %al,(%rax)
  600f50:	48 00 00             	rex.W add %al,(%rax)
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
  600f6f:	00 70 05             	add    %dh,0x5(%rax)
  600f72:	40 00 00             	add    %al,(%rax)
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
  600f8f:	00 54 05 40          	add    %dl,0x40(%rbp,%rax,1)
	...

Disassembly of section .got:

0000000000600ff8 <.got>:
	...

Disassembly of section .got.plt:

0000000000601000 <_GLOBAL_OFFSET_TABLE_>:
  601000:	18 0e                	sbb    %cl,(%rsi)
  601002:	60                   	(bad)  
	...
  601017:	00 e6                	add    %ah,%dh
  601019:	06                   	(bad)  
  60101a:	40 00 00             	add    %al,(%rax)
  60101d:	00 00                	add    %al,(%rax)
  60101f:	00 f6                	add    %dh,%dh
  601021:	06                   	(bad)  
  601022:	40 00 00             	add    %al,(%rax)
  601025:	00 00                	add    %al,(%rax)
  601027:	00 06                	add    %al,(%rsi)
  601029:	07                   	(bad)  
  60102a:	40 00 00             	add    %al,(%rax)
  60102d:	00 00                	add    %al,(%rax)
  60102f:	00 16                	add    %dl,(%rsi)
  601031:	07                   	(bad)  
  601032:	40 00 00             	add    %al,(%rax)
  601035:	00 00                	add    %al,(%rax)
  601037:	00 26                	add    %ah,(%rsi)
  601039:	07                   	(bad)  
  60103a:	40 00 00             	add    %al,(%rax)
  60103d:	00 00                	add    %al,(%rax)
  60103f:	00 36                	add    %dh,(%rsi)
  601041:	07                   	(bad)  
  601042:	40 00 00             	add    %al,(%rax)
  601045:	00 00                	add    %al,(%rax)
  601047:	00 46 07             	add    %al,0x7(%rsi)
  60104a:	40 00 00             	add    %al,(%rax)
  60104d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .data:

0000000000601050 <__data_start>:
	...

0000000000601058 <__dso_handle>:
	...

Disassembly of section .bss:

0000000000601060 <__bss_start>:
	...

00000000006010c0 <_ZSt4cout@@GLIBCXX_3.4>:
	...

00000000006011d0 <completed.6973>:
	...

00000000006011d1 <_ZStL8__ioinit>:
  6011d1:	00 00                	add    %al,(%rax)
  6011d3:	00 00                	add    %al,(%rax)
  6011d5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0x400638>
   a:	74 75                	je     81 <_init-0x40062f>
   c:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
   f:	38 2e                	cmp    %ch,(%rsi)
  11:	34 2d                	xor    $0x2d,%al
  13:	32 75 62             	xor    0x62(%rbp),%dh
  16:	75 6e                	jne    86 <_init-0x40062a>
  18:	74 75                	je     8f <_init-0x400621>
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
  33:	75 6e                	jne    a3 <_init-0x40060d>
  35:	74 75                	je     ac <_init-0x400604>
  37:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
  3a:	38 2e                	cmp    %ch,(%rsi)
  3c:	32 2d 31 39 75 62    	xor    0x62753931(%rip),%ch        # 62753973 <_end+0x6215279b>
  42:	75 6e                	jne    b2 <_init-0x4005fe>
  44:	74 75                	je     bb <_init-0x4005f5>
  46:	31 29                	xor    %ebp,(%rcx)
  48:	20 34 2e             	and    %dh,(%rsi,%rbp,1)
  4b:	38 2e                	cmp    %ch,(%rsi)
  4d:	32 00                	xor    (%rax),%al

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	5c                   	pop    %rsp
   1:	00 00                	add    %al,(%rax)
   3:	00 02                	add    %al,(%rdx)
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	00 08                	add    %cl,(%rax)
   b:	00 00                	add    %al,(%rax)
   d:	00 00                	add    %al,(%rax)
   f:	00 3d 08 40 00 00    	add    %bh,0x4008(%rip)        # 401d <_init-0x3fc693>
  15:	00 00                	add    %al,(%rax)
  17:	00 ba 00 00 00 00    	add    %bh,0x0(%rdx)
  1d:	00 00                	add    %al,(%rax)
  1f:	00 f8                	add    %bh,%al
  21:	08 40 00             	or     %al,0x0(%rax)
  24:	00 00                	add    %al,(%rax)
  26:	00 00                	add    %al,(%rax)
  28:	20 00                	and    %al,(%rax)
  2a:	00 00                	add    %al,(%rax)
  2c:	00 00                	add    %al,(%rax)
  2e:	00 00                	add    %al,(%rax)
  30:	18 09                	sbb    %cl,(%rcx)
  32:	40 00 00             	add    %al,(%rax)
  35:	00 00                	add    %al,(%rax)
  37:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # 3d <_init-0x400673>
  3d:	00 00                	add    %al,(%rax)
  3f:	00 36                	add    %dh,(%rsi)
  41:	09 40 00             	or     %eax,0x0(%rax)
  44:	00 00                	add    %al,(%rax)
  46:	00 00                	add    %al,(%rax)
  48:	1d 00 00 00 00       	sbb    $0x0,%eax
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
       0:	bf 16 00 00 04       	mov    $0x4000016,%edi
       5:	00 00                	add    %al,(%rax)
       7:	00 00                	add    %al,(%rax)
       9:	00 08                	add    %cl,(%rax)
       b:	01 7b 07             	add    %edi,0x7(%rbx)
       e:	00 00                	add    %al,(%rax)
      10:	04 ca                	add    $0xca,%al
      12:	04 00                	add    $0x0,%al
      14:	00 6d 08             	add    %ch,0x8(%rbp)
	...
      27:	00 00                	add    %al,(%rax)
      29:	02 5d 02             	add    0x2(%rbp),%bl
      2c:	00 00                	add    %al,(%rax)
      2e:	03 57 0a             	add    0xa(%rdi),%edx
      31:	00 00                	add    %al,(%rax)
      33:	04 40                	add    $0x40,%al
      35:	29 00                	sub    %eax,(%rax)
      37:	00 00                	add    %al,(%rax)
      39:	04 08                	add    $0x8,%al
      3b:	07                   	(bad)  
      3c:	22 00                	and    (%rax),%al
      3e:	00 00                	add    %al,(%rax)
      40:	05 07 0d 00 00       	add    $0xd07,%eax
      45:	18 03                	sbb    %al,(%rbx)
      47:	00 7d 00             	add    %bh,0x0(%rbp)
      4a:	00 00                	add    %al,(%rax)
      4c:	06                   	(bad)  
      4d:	a3 06 00 00 03 00 7d 	movabs %eax,0x7d0003000006
      54:	00 00 
      56:	00 00                	add    %al,(%rax)
      58:	06                   	(bad)  
      59:	e1 03                	loope  5e <_init-0x400652>
      5b:	00 00                	add    %al,(%rax)
      5d:	03 00                	add    (%rax),%eax
      5f:	7d 00                	jge    61 <_init-0x40064f>
      61:	00 00                	add    %al,(%rax)
      63:	04 06                	add    $0x6,%al
      65:	06                   	(bad)  
      66:	08 00                	or     %al,(%rax)
      68:	00 03                	add    %al,(%rbx)
      6a:	00 84 00 00 00 08 06 	add    %al,0x6080000(%rax,%rax,1)
      71:	64 09 00             	or     %eax,%fs:(%rax)
      74:	00 03                	add    %al,(%rbx)
      76:	00 84 00 00 00 10 00 	add    %al,0x100000(%rax,%rax,1)
      7d:	04 04                	add    $0x4,%al
      7f:	07                   	(bad)  
      80:	57                   	push   %rdi
      81:	09 00                	or     %eax,(%rax)
      83:	00 07                	add    %al,(%rdi)
      85:	08 03                	or     %al,(%rbx)
      87:	1b 00                	sbb    (%rax),%eax
      89:	00 00                	add    %al,(%rax)
      8b:	05 d4 91 00 00       	add    $0x91d4,%eax
      90:	00 04 08             	add    %al,(%rax,%rcx,1)
      93:	07                   	(bad)  
      94:	52                   	push   %rdx
      95:	09 00                	or     %eax,(%rax)
      97:	00 08                	add    %cl,(%rax)
      99:	70 0a                	jo     a5 <_init-0x40060b>
      9b:	00 00                	add    %al,(%rax)
      9d:	05 61 01 7d 00       	add    $0x7d0161,%eax
      a2:	00 00                	add    %al,(%rax)
      a4:	09 08                	or     %ecx,(%rax)
      a6:	06                   	(bad)  
      a7:	53                   	push   %rbx
      a8:	64 0b 00             	or     %fs:(%rax),%eax
      ab:	00 e8                	add    %ch,%al
      ad:	00 00                	add    %al,(%rax)
      af:	00 0a                	add    %cl,(%rdx)
      b1:	04 06                	add    $0x6,%al
      b3:	56                   	push   %rsi
      b4:	cf                   	iret   
      b5:	00 00                	add    %al,(%rax)
      b7:	00 0b                	add    %cl,(%rbx)
      b9:	5c                   	pop    %rsp
      ba:	01 00                	add    %eax,(%rax)
      bc:	00 06                	add    %al,(%rsi)
      be:	58                   	pop    %rax
      bf:	7d 00                	jge    c1 <_init-0x4005ef>
      c1:	00 00                	add    %al,(%rax)
      c3:	0b f6                	or     %esi,%esi
      c5:	08 00                	or     %al,(%rax)
      c7:	00 06                	add    %al,(%rsi)
      c9:	5c                   	pop    %rsp
      ca:	e8 00 00 00 00       	callq  cf <_init-0x4005e1>
      cf:	06                   	(bad)  
      d0:	34 08                	xor    $0x8,%al
      d2:	00 00                	add    %al,(%rax)
      d4:	06                   	(bad)  
      d5:	54                   	push   %rsp
      d6:	ff 00                	incl   (%rax)
      d8:	00 00                	add    %al,(%rax)
      da:	00 06                	add    %al,(%rsi)
      dc:	33 00                	xor    (%rax),%eax
      de:	00 00                	add    %al,(%rax)
      e0:	06                   	(bad)  
      e1:	5d                   	pop    %rbp
      e2:	b0 00                	mov    $0x0,%al
      e4:	00 00                	add    %al,(%rax)
      e6:	04 00                	add    $0x0,%al
      e8:	0c f8                	or     $0xf8,%al
      ea:	00 00                	add    %al,(%rax)
      ec:	00 f8                	add    %bh,%al
      ee:	00 00                	add    %al,(%rax)
      f0:	00 0d 39 00 00 00    	add    %cl,0x39(%rip)        # 12f <_init-0x400581>
      f6:	03 00                	add    (%rax),%eax
      f8:	04 01                	add    $0x1,%al
      fa:	06                   	(bad)  
      fb:	c5 02 00             	(bad)  
      fe:	00 0e                	add    %cl,(%rsi)
     100:	04 05                	add    $0x5,%al
     102:	69 6e 74 00 03 66 0b 	imul   $0xb660300,0x74(%rsi),%ebp
     109:	00 00                	add    %al,(%rax)
     10b:	06                   	(bad)  
     10c:	5e                   	pop    %rsi
     10d:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     10e:	00 00                	add    %al,(%rax)
     110:	00 03                	add    %al,(%rbx)
     112:	68 0b 00 00 06       	pushq  $0x600000b
     117:	6a 06                	pushq  $0x6
     119:	01 00                	add    %eax,(%rax)
     11b:	00 04 02             	add    %al,(%rdx,%rax,1)
     11e:	07                   	(bad)  
     11f:	73 0c                	jae    12d <_init-0x400583>
     121:	00 00                	add    %al,(%rax)
     123:	0f ff                	(bad)  
     125:	00 00                	add    %al,(%rax)
     127:	00 10                	add    %dl,(%rax)
     129:	08 2e                	or     %ch,(%rsi)
     12b:	01 00                	add    %eax,(%rax)
     12d:	00 0f                	add    %cl,(%rdi)
     12f:	f8                   	clc    
     130:	00 00                	add    %al,(%rax)
     132:	00 11                	add    %dl,(%rcx)
     134:	73 74                	jae    1aa <_init-0x400506>
     136:	64 00 03             	add    %al,%fs:(%rbx)
     139:	00 bd 08 00 00 12    	add    %bh,0x12000008(%rbp)
     13f:	07                   	(bad)  
     140:	40 11 01             	rex adc %eax,(%rcx)
     143:	00 00                	add    %al,(%rax)
     145:	12 07                	adc    (%rdi),%al
     147:	8b 98 00 00 00 12    	mov    0x12000000(%rax),%ebx
     14d:	07                   	(bad)  
     14e:	8d bd 08 00 00 12    	lea    0x12000008(%rbp),%edi
     154:	07                   	(bad)  
     155:	8e d3                	mov    %ebx,%ss
     157:	08 00                	or     %al,(%rax)
     159:	00 12                	add    %dl,(%rdx)
     15b:	07                   	(bad)  
     15c:	8f                   	(bad)  
     15d:	ef                   	out    %eax,(%dx)
     15e:	08 00                	or     %al,(%rax)
     160:	00 12                	add    %dl,(%rdx)
     162:	07                   	(bad)  
     163:	90                   	nop
     164:	1c 09                	sbb    $0x9,%al
     166:	00 00                	add    %al,(%rax)
     168:	12 07                	adc    (%rdi),%al
     16a:	91                   	xchg   %eax,%ecx
     16b:	37                   	(bad)  
     16c:	09 00                	or     %eax,(%rax)
     16e:	00 12                	add    %dl,(%rdx)
     170:	07                   	(bad)  
     171:	92                   	xchg   %eax,%edx
     172:	5d                   	pop    %rbp
     173:	09 00                	or     %eax,(%rax)
     175:	00 12                	add    %dl,(%rdx)
     177:	07                   	(bad)  
     178:	93                   	xchg   %eax,%ebx
     179:	78 09                	js     184 <_init-0x40052c>
     17b:	00 00                	add    %al,(%rax)
     17d:	12 07                	adc    (%rdi),%al
     17f:	94                   	xchg   %eax,%esp
     180:	94                   	xchg   %eax,%esp
     181:	09 00                	or     %eax,(%rax)
     183:	00 12                	add    %dl,(%rdx)
     185:	07                   	(bad)  
     186:	95                   	xchg   %eax,%ebp
     187:	b0 09                	mov    $0x9,%al
     189:	00 00                	add    %al,(%rax)
     18b:	12 07                	adc    (%rdi),%al
     18d:	96                   	xchg   %eax,%esi
     18e:	c6                   	(bad)  
     18f:	09 00                	or     %eax,(%rax)
     191:	00 12                	add    %dl,(%rdx)
     193:	07                   	(bad)  
     194:	97                   	xchg   %eax,%edi
     195:	d2 09                	rorb   %cl,(%rcx)
     197:	00 00                	add    %al,(%rax)
     199:	12 07                	adc    (%rdi),%al
     19b:	98                   	cwtl   
     19c:	f8                   	clc    
     19d:	09 00                	or     %eax,(%rax)
     19f:	00 12                	add    %dl,(%rdx)
     1a1:	07                   	(bad)  
     1a2:	99                   	cltd   
     1a3:	1d 0a 00 00 12       	sbb    $0x1200000a,%eax
     1a8:	07                   	(bad)  
     1a9:	9a                   	(bad)  
     1aa:	3e 0a 00             	or     %ds:(%rax),%al
     1ad:	00 12                	add    %dl,(%rdx)
     1af:	07                   	(bad)  
     1b0:	9b                   	fwait
     1b1:	69 0a 00 00 12 07    	imul   $0x7120000,(%rdx),%ecx
     1b7:	9c                   	pushfq 
     1b8:	84 0a                	test   %cl,(%rdx)
     1ba:	00 00                	add    %al,(%rax)
     1bc:	12 07                	adc    (%rdi),%al
     1be:	9e                   	sahf   
     1bf:	9a                   	(bad)  
     1c0:	0a 00                	or     (%rax),%al
     1c2:	00 12                	add    %dl,(%rdx)
     1c4:	07                   	(bad)  
     1c5:	a0 bb 0a 00 00 12 07 	movabs 0xd7a1071200000abb,%al
     1cc:	a1 d7 
     1ce:	0a 00                	or     (%rax),%al
     1d0:	00 12                	add    %dl,(%rdx)
     1d2:	07                   	(bad)  
     1d3:	a2 f2 0a 00 00 12 07 	movabs %al,0x18a4071200000af2
     1da:	a4 18 
     1dc:	0b 00                	or     (%rax),%eax
     1de:	00 12                	add    %dl,(%rdx)
     1e0:	07                   	(bad)  
     1e1:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
     1e2:	38 0b                	cmp    %cl,(%rbx)
     1e4:	00 00                	add    %al,(%rax)
     1e6:	12 07                	adc    (%rdi),%al
     1e8:	aa                   	stos   %al,%es:(%rdi)
     1e9:	5d                   	pop    %rbp
     1ea:	0b 00                	or     (%rax),%eax
     1ec:	00 12                	add    %dl,(%rdx)
     1ee:	07                   	(bad)  
     1ef:	ac                   	lods   %ds:(%rsi),%al
     1f0:	7d 0b                	jge    1fd <_init-0x4004b3>
     1f2:	00 00                	add    %al,(%rax)
     1f4:	12 07                	adc    (%rdi),%al
     1f6:	ae                   	scas   %es:(%rdi),%al
     1f7:	98                   	cwtl   
     1f8:	0b 00                	or     (%rax),%eax
     1fa:	00 12                	add    %dl,(%rdx)
     1fc:	07                   	(bad)  
     1fd:	b0 b3                	mov    $0xb3,%al
     1ff:	0b 00                	or     (%rax),%eax
     201:	00 12                	add    %dl,(%rdx)
     203:	07                   	(bad)  
     204:	b1 d9                	mov    $0xd9,%cl
     206:	0b 00                	or     (%rax),%eax
     208:	00 12                	add    %dl,(%rdx)
     20a:	07                   	(bad)  
     20b:	b2 f3                	mov    $0xf3,%dl
     20d:	0b 00                	or     (%rax),%eax
     20f:	00 12                	add    %dl,(%rdx)
     211:	07                   	(bad)  
     212:	b3 0d                	mov    $0xd,%bl
     214:	0c 00                	or     $0x0,%al
     216:	00 12                	add    %dl,(%rdx)
     218:	07                   	(bad)  
     219:	b4 27                	mov    $0x27,%ah
     21b:	0c 00                	or     $0x0,%al
     21d:	00 12                	add    %dl,(%rdx)
     21f:	07                   	(bad)  
     220:	b5 41                	mov    $0x41,%ch
     222:	0c 00                	or     $0x0,%al
     224:	00 12                	add    %dl,(%rdx)
     226:	07                   	(bad)  
     227:	b6 5b                	mov    $0x5b,%dh
     229:	0c 00                	or     $0x0,%al
     22b:	00 12                	add    %dl,(%rdx)
     22d:	07                   	(bad)  
     22e:	b7 1b                	mov    $0x1b,%bh
     230:	0d 00 00 12 07       	or     $0x7120000,%eax
     235:	b8 31 0d 00 00       	mov    $0xd31,%eax
     23a:	12 07                	adc    (%rdi),%al
     23c:	b9 50 0d 00 00       	mov    $0xd50,%ecx
     241:	12 07                	adc    (%rdi),%al
     243:	ba 6f 0d 00 00       	mov    $0xd6f,%edx
     248:	12 07                	adc    (%rdi),%al
     24a:	bb 8e 0d 00 00       	mov    $0xd8e,%ebx
     24f:	12 07                	adc    (%rdi),%al
     251:	bc b9 0d 00 00       	mov    $0xdb9,%esp
     256:	12 07                	adc    (%rdi),%al
     258:	bd d4 0d 00 00       	mov    $0xdd4,%ebp
     25d:	12 07                	adc    (%rdi),%al
     25f:	bf fc 0d 00 00       	mov    $0xdfc,%edi
     264:	12 07                	adc    (%rdi),%al
     266:	c1 1e 0e             	rcrl   $0xe,(%rsi)
     269:	00 00                	add    %al,(%rax)
     26b:	12 07                	adc    (%rdi),%al
     26d:	c2 3e 0e             	retq   $0xe3e
     270:	00 00                	add    %al,(%rax)
     272:	12 07                	adc    (%rdi),%al
     274:	c3                   	retq   
     275:	65                   	gs
     276:	0e                   	(bad)  
     277:	00 00                	add    %al,(%rax)
     279:	12 07                	adc    (%rdi),%al
     27b:	c4                   	(bad)  
     27c:	85 0e                	test   %ecx,(%rsi)
     27e:	00 00                	add    %al,(%rax)
     280:	12 07                	adc    (%rdi),%al
     282:	c5 a4 0e             	(bad)  
     285:	00 00                	add    %al,(%rax)
     287:	12 07                	adc    (%rdi),%al
     289:	c6                   	(bad)  
     28a:	ba 0e 00 00 12       	mov    $0x1200000e,%edx
     28f:	07                   	(bad)  
     290:	c7                   	(bad)  
     291:	da 0e                	fimull (%rsi)
     293:	00 00                	add    %al,(%rax)
     295:	12 07                	adc    (%rdi),%al
     297:	c8 fa 0e 00          	enterq $0xefa,$0x0
     29b:	00 12                	add    %dl,(%rdx)
     29d:	07                   	(bad)  
     29e:	c9                   	leaveq 
     29f:	1a 0f                	sbb    (%rdi),%cl
     2a1:	00 00                	add    %al,(%rax)
     2a3:	12 07                	adc    (%rdi),%al
     2a5:	ca 3a 0f             	lret   $0xf3a
     2a8:	00 00                	add    %al,(%rax)
     2aa:	12 07                	adc    (%rdi),%al
     2ac:	cb                   	lret   
     2ad:	51                   	push   %rcx
     2ae:	0f 00 00             	sldt   (%rax)
     2b1:	12 07                	adc    (%rdi),%al
     2b3:	cc                   	int3   
     2b4:	68 0f 00 00 12       	pushq  $0x1200000f
     2b9:	07                   	(bad)  
     2ba:	cd 86                	int    $0x86
     2bc:	0f 00 00             	sldt   (%rax)
     2bf:	12 07                	adc    (%rdi),%al
     2c1:	ce                   	(bad)  
     2c2:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
     2c3:	0f 00 00             	sldt   (%rax)
     2c6:	12 07                	adc    (%rdi),%al
     2c8:	cf                   	iret   
     2c9:	c3                   	retq   
     2ca:	0f 00 00             	sldt   (%rax)
     2cd:	12 07                	adc    (%rdi),%al
     2cf:	d0 e2                	shl    %dl
     2d1:	0f 00 00             	sldt   (%rax)
     2d4:	13 07                	adc    (%rdi),%eax
     2d6:	08 01                	or     %al,(%rcx)
     2d8:	7d 11                	jge    2eb <_init-0x4003c5>
     2da:	00 00                	add    %al,(%rax)
     2dc:	13 07                	adc    (%rdi),%eax
     2de:	09 01                	or     %eax,(%rcx)
     2e0:	9f                   	lahf   
     2e1:	11 00                	adc    %eax,(%rax)
     2e3:	00 13                	add    %dl,(%rbx)
     2e5:	07                   	(bad)  
     2e6:	0a 01                	or     (%rcx),%al
     2e8:	c6                   	(bad)  
     2e9:	11 00                	adc    %eax,(%rax)
     2eb:	00 14 d0             	add    %dl,(%rax,%rdx,8)
     2ee:	0a 00                	or     (%rax),%al
     2f0:	00 11                	add    %dl,(%rcx)
     2f2:	30 05 42 07 00 00    	xor    %al,0x742(%rip)        # a3a <_init-0x3ffc76>
     2f8:	01 08                	add    %ecx,(%rax)
     2fa:	e9 ba 04 00 00       	jmpq   7b9 <_init-0x3ffef7>
     2ff:	03 c6                	add    %esi,%eax
     301:	0a 00                	or     (%rax),%al
     303:	00 08                	add    %cl,(%rax)
     305:	eb f8                	jmp    2ff <_init-0x4003b1>
     307:	00 00                	add    %al,(%rax)
     309:	00 03                	add    %al,(%rbx)
     30b:	ba 0a 00 00 08       	mov    $0x800000a,%edx
     310:	ec                   	in     (%dx),%al
     311:	ff 00                	incl   (%rax)
     313:	00 00                	add    %al,(%rax)
     315:	15 c8 0c 00 00       	adc    $0xcc8,%eax
     31a:	08 f2                	or     %dh,%dl
     31c:	3a 0b                	cmp    (%rbx),%cl
     31e:	00 00                	add    %al,(%rax)
     320:	2f                   	(bad)  
     321:	03 00                	add    (%rax),%eax
     323:	00 16                	add    %dl,(%rsi)
     325:	15 12 00 00 16       	adc    $0x16000012,%eax
     32a:	1b 12                	sbb    (%rdx),%edx
     32c:	00 00                	add    %al,(%rax)
     32e:	00 0f                	add    %cl,(%rdi)
     330:	ff 02                	incl   (%rdx)
     332:	00 00                	add    %al,(%rax)
     334:	17                   	(bad)  
     335:	65                   	gs
     336:	71 00                	jno    338 <_init-0x400378>
     338:	08 f6                	or     %dh,%dh
     33a:	12 0a                	adc    (%rdx),%cl
     33c:	00 00                	add    %al,(%rax)
     33e:	21 12                	and    %edx,(%rdx)
     340:	00 00                	add    %al,(%rax)
     342:	51                   	push   %rcx
     343:	03 00                	add    (%rax),%eax
     345:	00 16                	add    %dl,(%rsi)
     347:	1b 12                	sbb    (%rdx),%edx
     349:	00 00                	add    %al,(%rax)
     34b:	16                   	(bad)  
     34c:	1b 12                	sbb    (%rdx),%edx
     34e:	00 00                	add    %al,(%rax)
     350:	00 17                	add    %dl,(%rdi)
     352:	6c                   	insb   (%dx),%es:(%rdi)
     353:	74 00                	je     355 <_init-0x40035b>
     355:	08 fa                	or     %bh,%dl
     357:	2c 05                	sub    $0x5,%al
     359:	00 00                	add    %al,(%rax)
     35b:	21 12                	and    %edx,(%rdx)
     35d:	00 00                	add    %al,(%rax)
     35f:	6e                   	outsb  %ds:(%rsi),(%dx)
     360:	03 00                	add    (%rax),%eax
     362:	00 16                	add    %dl,(%rsi)
     364:	1b 12                	sbb    (%rdx),%edx
     366:	00 00                	add    %al,(%rax)
     368:	16                   	(bad)  
     369:	1b 12                	sbb    (%rdx),%edx
     36b:	00 00                	add    %al,(%rax)
     36d:	00 18                	add    %bl,(%rax)
     36f:	87 04 00             	xchg   %eax,(%rax,%rax,1)
     372:	00 08                	add    %cl,(%rax)
     374:	fe                   	(bad)  
     375:	27                   	(bad)  
     376:	09 00                	or     %eax,(%rax)
     378:	00 ff                	add    %bh,%bh
     37a:	00 00                	add    %al,(%rax)
     37c:	00 91 03 00 00 16    	add    %dl,0x16000003(%rcx)
     382:	28 12                	sub    %dl,(%rdx)
     384:	00 00                	add    %al,(%rax)
     386:	16                   	(bad)  
     387:	28 12                	sub    %dl,(%rdx)
     389:	00 00                	add    %al,(%rax)
     38b:	16                   	(bad)  
     38c:	ba 04 00 00 00       	mov    $0x4,%edx
     391:	19 a0 09 00 00 08    	sbb    %esp,0x8000009(%rax)
     397:	02 01                	add    (%rcx),%al
     399:	fc                   	cld    
     39a:	0a 00                	or     (%rax),%al
     39c:	00 ba 04 00 00 ab    	add    %bh,-0x54fffffc(%rdx)
     3a2:	03 00                	add    (%rax),%eax
     3a4:	00 16                	add    %dl,(%rsi)
     3a6:	28 12                	sub    %dl,(%rdx)
     3a8:	00 00                	add    %al,(%rax)
     3aa:	00 19                	add    %bl,(%rcx)
     3ac:	97                   	xchg   %eax,%edi
     3ad:	04 00                	add    $0x0,%al
     3af:	00 08                	add    %cl,(%rax)
     3b1:	06                   	(bad)  
     3b2:	01 30                	add    %esi,(%rax)
     3b4:	06                   	(bad)  
     3b5:	00 00                	add    %al,(%rax)
     3b7:	28 12                	sub    %dl,(%rdx)
     3b9:	00 00                	add    %al,(%rax)
     3bb:	cf                   	iret   
     3bc:	03 00                	add    (%rax),%eax
     3be:	00 16                	add    %dl,(%rsi)
     3c0:	28 12                	sub    %dl,(%rdx)
     3c2:	00 00                	add    %al,(%rax)
     3c4:	16                   	(bad)  
     3c5:	ba 04 00 00 16       	mov    $0x16000004,%edx
     3ca:	1b 12                	sbb    (%rdx),%edx
     3cc:	00 00                	add    %al,(%rax)
     3ce:	00 19                	add    %bl,(%rcx)
     3d0:	b6 03                	mov    $0x3,%dh
     3d2:	00 00                	add    %al,(%rax)
     3d4:	08 0a                	or     %cl,(%rdx)
     3d6:	01 62 01             	add    %esp,0x1(%rdx)
     3d9:	00 00                	add    %al,(%rax)
     3db:	2e 12 00             	adc    %cs:(%rax),%al
     3de:	00 f3                	add    %dh,%bl
     3e0:	03 00                	add    (%rax),%eax
     3e2:	00 16                	add    %dl,(%rsi)
     3e4:	2e 12 00             	adc    %cs:(%rax),%al
     3e7:	00 16                	add    %dl,(%rsi)
     3e9:	28 12                	sub    %dl,(%rdx)
     3eb:	00 00                	add    %al,(%rax)
     3ed:	16                   	(bad)  
     3ee:	ba 04 00 00 00       	mov    $0x4,%edx
     3f3:	19 21                	sbb    %esp,(%rcx)
     3f5:	02 00                	add    (%rax),%al
     3f7:	00 08                	add    %cl,(%rax)
     3f9:	0e                   	(bad)  
     3fa:	01 0a                	add    %ecx,(%rdx)
     3fc:	05 00 00 2e 12       	add    $0x122e0000,%eax
     401:	00 00                	add    %al,(%rax)
     403:	17                   	(bad)  
     404:	04 00                	add    $0x0,%al
     406:	00 16                	add    %dl,(%rsi)
     408:	2e 12 00             	adc    %cs:(%rax),%al
     40b:	00 16                	add    %dl,(%rsi)
     40d:	28 12                	sub    %dl,(%rdx)
     40f:	00 00                	add    %al,(%rax)
     411:	16                   	(bad)  
     412:	ba 04 00 00 00       	mov    $0x4,%edx
     417:	19 c8                	sbb    %ecx,%eax
     419:	0c 00                	or     $0x0,%al
     41b:	00 08                	add    %cl,(%rax)
     41d:	12 01                	adc    (%rcx),%al
     41f:	4b 08 00             	rex.WXB or %al,(%r8)
     422:	00 2e                	add    %ch,(%rsi)
     424:	12 00                	adc    (%rax),%al
     426:	00 3b                	add    %bh,(%rbx)
     428:	04 00                	add    $0x0,%al
     42a:	00 16                	add    %dl,(%rsi)
     42c:	2e 12 00             	adc    %cs:(%rax),%al
     42f:	00 16                	add    %dl,(%rsi)
     431:	ba 04 00 00 16       	mov    $0x16000004,%edx
     436:	ff 02                	incl   (%rdx)
     438:	00 00                	add    %al,(%rax)
     43a:	00 19                	add    %bl,(%rcx)
     43c:	c3                   	retq   
     43d:	0a 00                	or     (%rax),%al
     43f:	00 08                	add    %cl,(%rax)
     441:	16                   	(bad)  
     442:	01 c1                	add    %eax,%ecx
     444:	05 00 00 ff 02       	add    $0x2ff0000,%eax
     449:	00 00                	add    %al,(%rax)
     44b:	55                   	push   %rbp
     44c:	04 00                	add    $0x0,%al
     44e:	00 16                	add    %dl,(%rsi)
     450:	34 12                	xor    $0x12,%al
     452:	00 00                	add    %al,(%rax)
     454:	00 0f                	add    %cl,(%rdi)
     456:	0a 03                	or     (%rbx),%al
     458:	00 00                	add    %al,(%rax)
     45a:	19 b7 0a 00 00 08    	sbb    %esi,0x800000a(%rdi)
     460:	1c 01                	sbb    $0x1,%al
     462:	96                   	xchg   %eax,%esi
     463:	01 00                	add    %eax,(%rax)
     465:	00 0a                	add    %cl,(%rdx)
     467:	03 00                	add    (%rax),%eax
     469:	00 74 04 00          	add    %dh,0x0(%rsp,%rax,1)
     46d:	00 16                	add    %dl,(%rsi)
     46f:	1b 12                	sbb    (%rdx),%edx
     471:	00 00                	add    %al,(%rax)
     473:	00 19                	add    %bl,(%rcx)
     475:	a9 05 00 00 08       	test   $0x8000005,%eax
     47a:	20 01                	and    %al,(%rcx)
     47c:	c2 07 00             	retq   $0x7
     47f:	00 21                	add    %ah,(%rcx)
     481:	12 00                	adc    (%rax),%al
     483:	00 93 04 00 00 16    	add    %dl,0x16000004(%rbx)
     489:	34 12                	xor    $0x12,%al
     48b:	00 00                	add    %al,(%rax)
     48d:	16                   	(bad)  
     48e:	34 12                	xor    $0x12,%al
     490:	00 00                	add    %al,(%rax)
     492:	00 1a                	add    %bl,(%rdx)
     494:	65 6f                	outsl  %gs:(%rsi),(%dx)
     496:	66                   	data16
     497:	00 08                	add    %cl,(%rax)
     499:	24 01                	and    $0x1,%al
     49b:	b3 0b                	mov    $0xb,%bl
     49d:	00 00                	add    %al,(%rax)
     49f:	0a 03                	or     (%rbx),%al
     4a1:	00 00                	add    %al,(%rax)
     4a3:	1b 1d 03 00 00 08    	sbb    0x8000003(%rip),%ebx        # 80004ac <_end+0x79ff2d4>
     4a9:	28 01                	sub    %al,(%rcx)
     4ab:	cf                   	iret   
     4ac:	0c 00                	or     $0x0,%al
     4ae:	00 0a                	add    %cl,(%rdx)
     4b0:	03 00                	add    (%rax),%eax
     4b2:	00 16                	add    %dl,(%rsi)
     4b4:	34 12                	xor    $0x12,%al
     4b6:	00 00                	add    %al,(%rax)
     4b8:	00 00                	add    %al,(%rax)
     4ba:	03 1b                	add    (%rbx),%ebx
     4bc:	00 00                	add    %al,(%rax)
     4be:	00 09                	add    %cl,(%rcx)
     4c0:	ba 91 00 00 00       	mov    $0x91,%edx
     4c5:	12 0a                	adc    (%rdx),%cl
     4c7:	35 3a 12 00 00       	xor    $0x123a,%eax
     4cc:	12 0a                	adc    (%rdx),%cl
     4ce:	36 67 13 00          	adc    %ss:(%eax),%eax
     4d2:	00 12                	add    %dl,(%rdx)
     4d4:	0a 37                	or     (%rdi),%dh
     4d6:	81 13 00 00 03 eb    	adcl   $0xeb030000,(%rbx)
     4dc:	03 00                	add    (%rax),%eax
     4de:	00 09                	add    %cl,(%rcx)
     4e0:	bb 5e 0e 00 00       	mov    $0xe5e,%ebx
     4e5:	1c 22                	sbb    $0x22,%al
     4e7:	06                   	(bad)  
     4e8:	00 00                	add    %al,(%rax)
     4ea:	04 0b                	add    $0xb,%al
     4ec:	33 88 05 00 00 1d    	xor    0x1d000005(%rax),%ecx
     4f2:	16                   	(bad)  
     4f3:	01 00                	add    %eax,(%rax)
     4f5:	00 01                	add    %al,(%rcx)
     4f7:	1d 1b 06 00 00       	sbb    $0x61b,%eax
     4fc:	02 1d 4c 05 00 00    	add    0x54c(%rip),%bl        # a4e <_init-0x3ffc62>
     502:	04 1d                	add    $0x1d,%al
     504:	46 04 00             	rex.RX add $0x0,%al
     507:	00 08                	add    %cl,(%rax)
     509:	1d 7b 04 00 00       	sbb    $0x47b,%eax
     50e:	10 1d 08 07 00 00    	adc    %bl,0x708(%rip)        # c1c <_init-0x3ffa94>
     514:	20 1d ef 08 00 00    	and    %bl,0x8ef(%rip)        # e09 <_init-0x3ff8a7>
     51a:	c0 00 1d             	rolb   $0x1d,(%rax)
     51d:	b3 02                	mov    $0x2,%bl
     51f:	00 00                	add    %al,(%rax)
     521:	80 01 1d             	addb   $0x1d,(%rcx)
     524:	f1                   	icebp  
     525:	0c 00                	or     $0x0,%al
     527:	00 80 02 1d 73 05    	add    %al,0x5731d02(%rax)
     52d:	00 00                	add    %al,(%rax)
     52f:	80 04 1d 8c 06 00 00 	addb   $0x80,0x68c(,%rbx,1)
     536:	80 
     537:	08 1d 01 06 00 00    	or     %bl,0x601(%rip)        # b3e <_init-0x3ffb72>
     53d:	80 10 1d             	adcb   $0x1d,(%rax)
     540:	99                   	cltd   
     541:	06                   	(bad)  
     542:	00 00                	add    %al,(%rax)
     544:	80 20 1d             	andb   $0x1d,(%rax)
     547:	07                   	(bad)  
     548:	0a 00                	or     (%rax),%al
     54a:	00 80 c0 00 1d ec    	add    %al,-0x13e2ff40(%rax)
     550:	07                   	(bad)  
     551:	00 00                	add    %al,(%rax)
     553:	80 80 01 1d ad 06 00 	addb   $0x0,0x6ad1d01(%rax)
     55a:	00 b0 01 1d 84 01    	add    %dh,0x1841d01(%rax)
     560:	00 00                	add    %al,(%rax)
     562:	ca 00 1d             	lret   $0x1d00
     565:	e1 08                	loope  56f <_init-0x400141>
     567:	00 00                	add    %al,(%rax)
     569:	84 02                	test   %al,(%rdx)
     56b:	1d 18 08 00 00       	sbb    $0x818,%eax
     570:	80 80 04 1d a3 0a 00 	addb   $0x0,0xaa31d04(%rax)
     577:	00 ff                	add    %bh,%bh
     579:	ff                   	(bad)  
     57a:	ff                   	(bad)  
     57b:	ff 07                	incl   (%rdi)
     57d:	1d d8 00 00 00       	sbb    $0xd8,%eax
     582:	80 80 80 80 78 00 1c 	addb   $0x1c,0x788080(%rax)
     589:	f7 01 00 00 04 0b    	testl  $0xb040000,(%rcx)
     58f:	69 d5 05 00 00 1d    	imul   $0x1d000005,%ebp,%edx
     595:	7f 03                	jg     59a <_init-0x400116>
     597:	00 00                	add    %al,(%rax)
     599:	01 1d 03 05 00 00    	add    %ebx,0x503(%rip)        # aa2 <_init-0x3ffc0e>
     59f:	02 1d 0f 03 00 00    	add    0x30f(%rip),%bl        # 8b4 <_init-0x3ffdfc>
     5a5:	04 1d                	add    $0x1d,%al
     5a7:	7f 05                	jg     5ae <_init-0x400102>
     5a9:	00 00                	add    %al,(%rax)
     5ab:	08 1d 78 03 00 00    	or     %bl,0x378(%rip)        # 929 <_init-0x3ffd87>
     5b1:	10 1d e9 05 00 00    	adc    %bl,0x5e9(%rip)        # ba0 <_init-0x3ffb10>
     5b7:	20 1d 67 07 00 00    	and    %bl,0x767(%rip)        # d24 <_init-0x3ff98c>
     5bd:	80 80 04 1d 77 0a 00 	addb   $0x0,0xa771d04(%rax)
     5c4:	00 ff                	add    %bh,%bh
     5c6:	ff                   	(bad)  
     5c7:	ff                   	(bad)  
     5c8:	ff 07                	incl   (%rdi)
     5ca:	1d 3b 00 00 00       	sbb    $0x3b,%eax
     5cf:	80 80 80 80 78 00 1c 	addb   $0x1c,0x788080(%rax)
     5d6:	b6 09                	mov    $0x9,%dh
     5d8:	00 00                	add    %al,(%rax)
     5da:	04 0b                	add    $0xb,%al
     5dc:	93                   	xchg   %eax,%ebx
     5dd:	16                   	(bad)  
     5de:	06                   	(bad)  
     5df:	00 00                	add    %al,(%rax)
     5e1:	1d d2 02 00 00       	sbb    $0x2d2,%eax
     5e6:	00 1d 23 01 00 00    	add    %bl,0x123(%rip)        # 70f <_init-0x3fffa1>
     5ec:	01 1d 4b 02 00 00    	add    %ebx,0x24b(%rip)        # 83d <_init-0x3ffe73>
     5f2:	02 1d 34 0c 00 00    	add    0xc34(%rip),%bl        # 122c <_init-0x3ff484>
     5f8:	04 1d                	add    $0x1d,%al
     5fa:	92                   	xchg   %eax,%edx
     5fb:	0b 00                	or     (%rax),%eax
     5fd:	00 80 80 04 1d ec    	add    %al,-0x13e2fb80(%rax)
     603:	00 00                	add    %al,(%rax)
     605:	00 ff                	add    %bh,%bh
     607:	ff                   	(bad)  
     608:	ff                   	(bad)  
     609:	ff 07                	incl   (%rdi)
     60b:	1d 5f 04 00 00       	sbb    $0x45f,%eax
     610:	80 80 80 80 78 00 1c 	addb   $0x1c,0x788080(%rax)
     617:	97                   	xchg   %eax,%edi
     618:	0c 00                	or     $0x0,%al
     61a:	00 04 0b             	add    %al,(%rbx,%rcx,1)
     61d:	bb 3d 06 00 00       	mov    $0x63d,%ebx
     622:	1d 4d 01 00 00       	sbb    $0x14d,%eax
     627:	00 1d 33 0b 00 00    	add    %bl,0xb33(%rip)        # 1160 <_init-0x3ff550>
     62d:	01 1d 14 00 00 00    	add    %ebx,0x14(%rip)        # 647 <_init-0x400069>
     633:	02 1d 8d 09 00 00    	add    0x98d(%rip),%bl        # fc6 <_init-0x3ff6ea>
     639:	80 80 04 00 1e 8b 0a 	addb   $0xa,-0x74e1fffc(%rax)
     640:	00 00                	add    %al,(%rax)
     642:	4a 08 00             	rex.WX or %al,(%rax)
     645:	00 1f                	add    %bl,(%rdi)
     647:	25 0c 00 00 01       	and    $0x100000c,%eax
     64c:	0b 1b                	or     (%rbx),%ebx
     64e:	02 01                	add    (%rcx),%al
     650:	9c                   	pushfq 
     651:	06                   	(bad)  
     652:	00 00                	add    %al,(%rax)
     654:	20 b5 05 00 00 0b    	and    %dh,0xb000005(%rbp)
     65a:	23 02                	and    (%rdx),%eax
     65c:	9d                   	popfq  
     65d:	13 00                	adc    (%rax),%eax
     65f:	00 20                	add    %ah,(%rax)
     661:	2f                   	(bad)  
     662:	02 00                	add    (%rax),%al
     664:	00 0b                	add    %cl,(%rbx)
     666:	24 02                	and    $0x2,%al
     668:	21 12                	and    %edx,(%rdx)
     66a:	00 00                	add    %al,(%rax)
     66c:	21 25 0c 00 00 0b    	and    %esp,0xb00000c(%rip)        # b00067e <_end+0xa9ff4a6>
     672:	1f                   	(bad)  
     673:	02 01                	add    (%rcx),%al
     675:	7d 06                	jge    67d <_init-0x400033>
     677:	00 00                	add    %al,(%rax)
     679:	83 06 00             	addl   $0x0,(%rsi)
     67c:	00 22                	add    %ah,(%rdx)
     67e:	b2 13                	mov    $0x13,%dl
     680:	00 00                	add    %al,(%rax)
     682:	00 23                	add    %ah,(%rbx)
     684:	24 0c                	and    $0xc,%al
     686:	00 00                	add    %al,(%rax)
     688:	0b 20                	or     (%rax),%esp
     68a:	02 01                	add    (%rcx),%al
     68c:	90                   	nop
     68d:	06                   	(bad)  
     68e:	00 00                	add    %al,(%rax)
     690:	22 b2 13 00 00 22    	and    0x22000013(%rdx),%dh
     696:	ff 00                	incl   (%rax)
     698:	00 00                	add    %al,(%rax)
     69a:	00 00                	add    %al,(%rax)
     69c:	24 a4                	and    $0xa4,%al
     69e:	0c 00                	or     $0x0,%al
     6a0:	00 0b                	add    %cl,(%rbx)
     6a2:	05 01 e5 04 00       	add    $0x4e501,%eax
     6a7:	00 01                	add    %al,(%rcx)
     6a9:	25 19 01 00 00       	and    $0x119,%eax
     6ae:	0b 08                	or     (%rax),%ecx
     6b0:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     6b6:	01 0f                	add    %ecx,(%rdi)
     6b8:	9c                   	pushfq 
     6b9:	06                   	(bad)  
     6ba:	00 00                	add    %al,(%rax)
     6bc:	26 64 65 63 00       	es fs movslq %es:%fs:%gs:(%rax),%eax
     6c1:	0b 0b                	or     (%rbx),%ecx
     6c3:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     6c9:	02 25 4f 05 00 00    	add    0x54f(%rip),%ah        # c1e <_init-0x3ffa92>
     6cf:	0b 0e                	or     (%rsi),%ecx
     6d1:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     6d7:	04 26                	add    $0x26,%al
     6d9:	68 65 78 00 0b       	pushq  $0xb007865
     6de:	11 01                	adc    %eax,(%rcx)
     6e0:	b7 06                	mov    $0x6,%bh
     6e2:	00 00                	add    %al,(%rax)
     6e4:	01 08                	add    %ecx,(%rax)
     6e6:	25 7e 04 00 00       	and    $0x47e,%eax
     6eb:	0b 16                	or     (%rsi),%edx
     6ed:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     6f3:	10 25 0b 07 00 00    	adc    %ah,0x70b(%rip)        # e04 <_init-0x3ff8ac>
     6f9:	0b 1a                	or     (%rdx),%ebx
     6fb:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     701:	20 26                	and    %ah,(%rsi)
     703:	6f                   	outsl  %ds:(%rsi),(%dx)
     704:	63 74 00 0b          	movslq 0xb(%rax,%rax,1),%esi
     708:	1d 01 b7 06 00       	sbb    $0x6b701,%eax
     70d:	00 01                	add    %al,(%rcx)
     70f:	40 25 b6 02 00 00    	rex and $0x2b6,%eax
     715:	0b 21                	or     (%rcx),%esp
     717:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     71d:	80 27 f4             	andb   $0xf4,(%rdi)
     720:	0c 00                	or     $0x0,%al
     722:	00 0b                	add    %cl,(%rbx)
     724:	24 01                	and    $0x1,%al
     726:	b7 06                	mov    $0x6,%bh
     728:	00 00                	add    %al,(%rax)
     72a:	01 00                	add    %eax,(%rax)
     72c:	01 27                	add    %esp,(%rdi)
     72e:	76 05                	jbe    735 <_init-0x3fff7b>
     730:	00 00                	add    %al,(%rax)
     732:	0b 28                	or     (%rax),%ebp
     734:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     73a:	00 02                	add    %al,(%rdx)
     73c:	27                   	(bad)  
     73d:	8f 06                	popq   (%rsi)
     73f:	00 00                	add    %al,(%rax)
     741:	0b 2c 01             	or     (%rcx,%rax,1),%ebp
     744:	b7 06                	mov    $0x6,%bh
     746:	00 00                	add    %al,(%rax)
     748:	01 00                	add    %eax,(%rax)
     74a:	04 27                	add    $0x27,%al
     74c:	04 06                	add    $0x6,%al
     74e:	00 00                	add    %al,(%rax)
     750:	0b 2f                	or     (%rdi),%ebp
     752:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     758:	00 08                	add    %cl,(%rax)
     75a:	27                   	(bad)  
     75b:	9c                   	pushfq 
     75c:	06                   	(bad)  
     75d:	00 00                	add    %al,(%rax)
     75f:	0b 32                	or     (%rdx),%esi
     761:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     767:	00 10                	add    %dl,(%rax)
     769:	27                   	(bad)  
     76a:	0a 0a                	or     (%rdx),%cl
     76c:	00 00                	add    %al,(%rax)
     76e:	0b 35 01 b7 06 00    	or     0x6b701(%rip),%esi        # 6be75 <_init-0x39483b>
     774:	00 01                	add    %al,(%rcx)
     776:	00 20                	add    %ah,(%rax)
     778:	27                   	(bad)  
     779:	ef                   	out    %eax,(%dx)
     77a:	07                   	(bad)  
     77b:	00 00                	add    %al,(%rax)
     77d:	0b 39                	or     (%rcx),%edi
     77f:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     785:	00 40 25             	add    %al,0x25(%rax)
     788:	b0 06                	mov    $0x6,%al
     78a:	00 00                	add    %al,(%rax)
     78c:	0b 3c 01             	or     (%rcx,%rax,1),%edi
     78f:	b7 06                	mov    $0x6,%bh
     791:	00 00                	add    %al,(%rax)
     793:	01 b0 25 87 01 00    	add    %esi,0x18725(%rax)
     799:	00 0b                	add    %cl,(%rbx)
     79b:	3f                   	(bad)  
     79c:	01 b7 06 00 00 01    	add    %esi,0x1000006(%rdi)
     7a2:	4a 27                	rex.WX (bad) 
     7a4:	e4 08                	in     $0x8,%al
     7a6:	00 00                	add    %al,(%rax)
     7a8:	0b 42 01             	or     0x1(%rdx),%eax
     7ab:	b7 06                	mov    $0x6,%bh
     7ad:	00 00                	add    %al,(%rax)
     7af:	01 04 01             	add    %eax,(%rcx,%rax,1)
     7b2:	24 9b                	and    $0x9b,%al
     7b4:	0a 00                	or     (%rax),%al
     7b6:	00 0b                	add    %cl,(%rbx)
     7b8:	50                   	push   %rax
     7b9:	01 d5                	add    %edx,%ebp
     7bb:	05 00 00 01 25       	add    $0x25010000,%eax
     7c0:	26 01 00             	add    %eax,%es:(%rax)
     7c3:	00 0b                	add    %cl,(%rbx)
     7c5:	54                   	push   %rsp
     7c6:	01 cd                	add    %ecx,%ebp
     7c8:	07                   	(bad)  
     7c9:	00 00                	add    %al,(%rax)
     7cb:	01 01                	add    %eax,(%rcx)
     7cd:	0f b2 07             	lss    (%rdi),%eax
     7d0:	00 00                	add    %al,(%rax)
     7d2:	25 4e 02 00 00       	and    $0x24e,%eax
     7d7:	0b 57 01             	or     0x1(%rdi),%edx
     7da:	cd 07                	int    $0x7
     7dc:	00 00                	add    %al,(%rax)
     7de:	01 02                	add    %eax,(%rdx)
     7e0:	25 37 0c 00 00       	and    $0xc37,%eax
     7e5:	0b 5c 01 cd          	or     -0x33(%rcx,%rax,1),%ebx
     7e9:	07                   	(bad)  
     7ea:	00 00                	add    %al,(%rax)
     7ec:	01 04 25 d5 02 00 00 	add    %eax,0x2d5
     7f3:	0b 5f 01             	or     0x1(%rdi),%ebx
     7f6:	cd 07                	int    $0x7
     7f8:	00 00                	add    %al,(%rax)
     7fa:	01 00                	add    %eax,(%rax)
     7fc:	24 86                	and    $0x86,%al
     7fe:	03 00                	add    (%rax),%eax
     800:	00 0b                	add    %cl,(%rbx)
     802:	6f                   	outsl  %ds:(%rsi),(%dx)
     803:	01 88 05 00 00 01    	add    %ecx,0x1000005(%rax)
     809:	26 69 6e 00 0b 7d 01 	imul   $0x16017d0b,%es:0x0(%rsi),%ebp
     810:	16 
     811:	08 00                	or     %al,(%rax)
     813:	00 01                	add    %al,(%rcx)
     815:	08 0f                	or     %cl,(%rdi)
     817:	fc                   	cld    
     818:	07                   	(bad)  
     819:	00 00                	add    %al,(%rax)
     81b:	26 6f                	outsl  %es:(%rsi),(%dx)
     81d:	75 74                	jne    893 <_init-0x3ffe1d>
     81f:	00 0b                	add    %cl,(%rbx)
     821:	80 01 16             	addb   $0x16,(%rcx)
     824:	08 00                	or     %al,(%rax)
     826:	00 01                	add    %al,(%rcx)
     828:	10 24 bc             	adc    %ah,(%rsp,%rdi,4)
     82b:	04 00                	add    $0x0,%al
     82d:	00 0b                	add    %cl,(%rbx)
     82f:	8f 01                	popq   (%rcx)
     831:	16                   	(bad)  
     832:	06                   	(bad)  
     833:	00 00                	add    %al,(%rax)
     835:	01 26                	add    %esp,(%rsi)
     837:	63 75 72             	movslq 0x72(%rbp),%esi
     83a:	00 0b                	add    %cl,(%rbx)
     83c:	95                   	xchg   %eax,%ebp
     83d:	01 44 08 00          	add    %eax,0x0(%rax,%rcx,1)
     841:	00 01                	add    %al,(%rcx)
     843:	01 0f                	add    %ecx,(%rdi)
     845:	29 08                	sub    %ecx,(%rax)
     847:	00 00                	add    %al,(%rax)
     849:	00 12                	add    %dl,(%rdx)
     84b:	0c 52                	or     $0x52,%al
     84d:	c3                   	retq   
     84e:	13 00                	adc    (%rax),%eax
     850:	00 12                	add    %dl,(%rdx)
     852:	0c 53                	or     $0x53,%al
     854:	b8 13 00 00 12       	mov    $0x12000013,%eax
     859:	0c 54                	or     $0x54,%al
     85b:	98                   	cwtl   
     85c:	00 00                	add    %al,(%rax)
     85e:	00 12                	add    %dl,(%rdx)
     860:	0c 5c                	or     $0x5c,%al
     862:	d9 13                	fsts   (%rbx)
     864:	00 00                	add    %al,(%rax)
     866:	12 0c 65 f3 13 00 00 	adc    0x13f3(,%riz,2),%cl
     86d:	12 0c 68             	adc    (%rax,%rbp,2),%cl
     870:	0d 14 00 00 12       	or     $0x12000014,%eax
     875:	0c 69                	or     $0x69,%al
     877:	22 14 00             	and    (%rax,%rax,1),%dl
     87a:	00 1e                	add    %bl,(%rsi)
     87c:	66                   	data16
     87d:	02 00                	add    (%rax),%al
     87f:	00 97 08 00 00 28    	add    %dl,0x28000008(%rdi)
     885:	a3 04 00 00 f8 00 00 	movabs %eax,0x28000000f8000004
     88c:	00 28 
     88e:	86 0c 00             	xchg   %cl,(%rax,%rax,1)
     891:	00 f3                	add    %dh,%bl
     893:	02 00                	add    (%rax),%al
     895:	00 00                	add    %al,(%rax)
     897:	03 2c 08             	add    (%rax,%rcx,1),%ebp
     89a:	00 00                	add    %al,(%rax)
     89c:	0d 88 7b 08 00       	or     $0x87b88,%eax
     8a1:	00 29                	add    %ch,(%rcx)
     8a3:	fc                   	cld    
     8a4:	06                   	(bad)  
     8a5:	00 00                	add    %al,(%rax)
     8a7:	02 3d f7 06 00 00    	add    0x6f7(%rip),%bh        # fa4 <_init-0x3ff70c>
     8ad:	97                   	xchg   %eax,%edi
     8ae:	08 00                	or     %al,(%rax)
     8b0:	00 2a                	add    %ch,(%rdx)
     8b2:	26 02 00             	add    %es:(%rax),%al
     8b5:	00 02                	add    %al,(%rdx)
     8b7:	4a                   	rex.WX
     8b8:	46 06                	rex.RX (bad) 
     8ba:	00 00                	add    %al,(%rax)
     8bc:	00 2b                	add    %ch,(%rbx)
     8be:	c1 03 00             	roll   $0x0,(%rbx)
     8c1:	00 06                	add    %al,(%rsi)
     8c3:	61                   	(bad)  
     8c4:	01 98 00 00 00 d3    	add    %ebx,-0x2d000000(%rax)
     8ca:	08 00                	or     %al,(%rax)
     8cc:	00 16                	add    %dl,(%rsi)
     8ce:	ff 00                	incl   (%rax)
     8d0:	00 00                	add    %al,(%rax)
     8d2:	00 2b                	add    %ch,(%rbx)
     8d4:	9c                   	pushfq 
     8d5:	02 00                	add    (%rax),%al
     8d7:	00 06                	add    %al,(%rsi)
     8d9:	e9 02 98 00 00       	jmpq   a0e0 <_init-0x3f65d0>
     8de:	00 e9                	add    %ch,%cl
     8e0:	08 00                	or     %al,(%rax)
     8e2:	00 16                	add    %dl,(%rsi)
     8e4:	e9 08 00 00 00       	jmpq   8f1 <_init-0x3ffdbf>
     8e9:	10 08                	adc    %cl,(%rax)
     8eb:	2e 00 00             	add    %al,%cs:(%rax)
     8ee:	00 2b                	add    %ch,(%rbx)
     8f0:	ac                   	lods   %ds:(%rsi),%al
     8f1:	02 00                	add    (%rax),%al
     8f3:	00 06                	add    %al,(%rsi)
     8f5:	06                   	(bad)  
     8f6:	03 0f                	add    (%rdi),%ecx
     8f8:	09 00                	or     %eax,(%rax)
     8fa:	00 0f                	add    %cl,(%rdi)
     8fc:	09 00                	or     %eax,(%rax)
     8fe:	00 16                	add    %dl,(%rsi)
     900:	0f 09                	wbinvd 
     902:	00 00                	add    %al,(%rax)
     904:	16                   	(bad)  
     905:	ff 00                	incl   (%rax)
     907:	00 00                	add    %al,(%rax)
     909:	16                   	(bad)  
     90a:	e9 08 00 00 00       	jmpq   917 <_init-0x3ffd99>
     90f:	10 08                	adc    %cl,(%rax)
     911:	15 09 00 00 04       	adc    $0x4000009,%eax
     916:	04 05                	add    $0x5,%al
     918:	ff 0c 00             	decl   (%rax,%rax,1)
     91b:	00 2b                	add    %ch,(%rbx)
     91d:	16                   	(bad)  
     91e:	0c 00                	or     $0x0,%al
     920:	00 06                	add    %al,(%rsi)
     922:	f7 02 98 00 00 00    	testl  $0x98,(%rdx)
     928:	37                   	(bad)  
     929:	09 00                	or     %eax,(%rax)
     92b:	00 16                	add    %dl,(%rsi)
     92d:	15 09 00 00 16       	adc    $0x16000009,%eax
     932:	e9 08 00 00 00       	jmpq   93f <_init-0x3ffd71>
     937:	2b 1d 0c 00 00 06    	sub    0x600000c(%rip),%ebx        # 6000949 <_end+0x59ff771>
     93d:	0d 03 ff 00 00       	or     $0xff03,%eax
     942:	00 52 09             	add    %dl,0x9(%rdx)
     945:	00 00                	add    %al,(%rax)
     947:	16                   	(bad)  
     948:	52                   	push   %rdx
     949:	09 00                	or     %eax,(%rax)
     94b:	00 16                	add    %dl,(%rsi)
     94d:	e9 08 00 00 00       	jmpq   95a <_init-0x3ffd56>
     952:	10 08                	adc    %cl,(%rax)
     954:	58                   	pop    %rax
     955:	09 00                	or     %eax,(%rax)
     957:	00 0f                	add    %cl,(%rdi)
     959:	15 09 00 00 2b       	adc    $0x2b000009,%eax
     95e:	c4                   	(bad)  
     95f:	04 00                	add    $0x0,%al
     961:	00 06                	add    %al,(%rsi)
     963:	4b 02 ff             	rex.WXB add %r15b,%dil
     966:	00 00                	add    %al,(%rax)
     968:	00 78 09             	add    %bh,0x9(%rax)
     96b:	00 00                	add    %al,(%rax)
     96d:	16                   	(bad)  
     96e:	e9 08 00 00 16       	jmpq   1600097b <_end+0x159ff7a3>
     973:	ff 00                	incl   (%rax)
     975:	00 00                	add    %al,(%rax)
     977:	00 2b                	add    %ch,(%rbx)
     979:	92                   	xchg   %eax,%edx
     97a:	05 00 00 06 52       	add    $0x52060000,%eax
     97f:	02 ff                	add    %bh,%bh
     981:	00 00                	add    %al,(%rax)
     983:	00 94 09 00 00 16 e9 	add    %dl,-0x16ea0000(%rcx,%rcx,1)
     98a:	08 00                	or     %al,(%rax)
     98c:	00 16                	add    %dl,(%rsi)
     98e:	52                   	push   %rdx
     98f:	09 00                	or     %eax,(%rax)
     991:	00 2c 00             	add    %ch,(%rax,%rax,1)
     994:	2b 8f 0c 00 00 06    	sub    0x600000c(%rdi),%ecx
     99a:	7b 02                	jnp    99e <_init-0x3ffd12>
     99c:	ff 00                	incl   (%rax)
     99e:	00 00                	add    %al,(%rax)
     9a0:	b0 09                	mov    $0x9,%al
     9a2:	00 00                	add    %al,(%rax)
     9a4:	16                   	(bad)  
     9a5:	e9 08 00 00 16       	jmpq   160009b2 <_end+0x159ff7da>
     9aa:	52                   	push   %rdx
     9ab:	09 00                	or     %eax,(%rax)
     9ad:	00 2c 00             	add    %ch,(%rax,%rax,1)
     9b0:	2b 9d 02 00 00 06    	sub    0x6000002(%rbp),%ebx
     9b6:	ea                   	(bad)  
     9b7:	02 98 00 00 00 c6    	add    -0x3a000000(%rax),%bl
     9bd:	09 00                	or     %eax,(%rax)
     9bf:	00 16                	add    %dl,(%rsi)
     9c1:	e9 08 00 00 00       	jmpq   9ce <_init-0x3ffce2>
     9c6:	2d a3 02 00 00       	sub    $0x2a3,%eax
     9cb:	06                   	(bad)  
     9cc:	f0 02 98 00 00 00 2b 	lock add 0x2b000000(%rax),%bl
     9d3:	31 04 00             	xor    %eax,(%rax,%rax,1)
     9d6:	00 06                	add    %al,(%rsi)
     9d8:	78 01                	js     9db <_init-0x3ffcd5>
     9da:	86 00                	xchg   %al,(%rax)
     9dc:	00 00                	add    %al,(%rax)
     9de:	f2 09 00             	repnz or %eax,(%rax)
     9e1:	00 16                	add    %dl,(%rsi)
     9e3:	28 01                	sub    %al,(%rcx)
     9e5:	00 00                	add    %al,(%rax)
     9e7:	16                   	(bad)  
     9e8:	86 00                	xchg   %al,(%rax)
     9ea:	00 00                	add    %al,(%rax)
     9ec:	16                   	(bad)  
     9ed:	f2 09 00             	repnz or %eax,(%rax)
     9f0:	00 00                	add    %al,(%rax)
     9f2:	10 08                	adc    %cl,(%rax)
     9f4:	11 01                	adc    %eax,(%rcx)
     9f6:	00 00                	add    %al,(%rax)
     9f8:	2b 2d 01 00 00 06    	sub    0x6000001(%rip),%ebp        # 60009ff <_end+0x59ff827>
     9fe:	6d                   	insl   (%dx),%es:(%rdi)
     9ff:	01 86 00 00 00 1d    	add    %eax,0x1d000000(%rsi)
     a05:	0a 00                	or     (%rax),%al
     a07:	00 16                	add    %dl,(%rsi)
     a09:	0f 09                	wbinvd 
     a0b:	00 00                	add    %al,(%rax)
     a0d:	16                   	(bad)  
     a0e:	28 01                	sub    %al,(%rcx)
     a10:	00 00                	add    %al,(%rax)
     a12:	16                   	(bad)  
     a13:	86 00                	xchg   %al,(%rax)
     a15:	00 00                	add    %al,(%rax)
     a17:	16                   	(bad)  
     a18:	f2 09 00             	repnz or %eax,(%rax)
     a1b:	00 00                	add    %al,(%rax)
     a1d:	2b b7 0c 00 00 06    	sub    0x600000c(%rdi),%esi
     a23:	69 01 ff 00 00 00    	imul   $0xff,(%rcx),%eax
     a29:	33 0a                	xor    (%rdx),%ecx
     a2b:	00 00                	add    %al,(%rax)
     a2d:	16                   	(bad)  
     a2e:	33 0a                	xor    (%rdx),%ecx
     a30:	00 00                	add    %al,(%rax)
     a32:	00 10                	add    %dl,(%rax)
     a34:	08 39                	or     %bh,(%rcx)
     a36:	0a 00                	or     (%rax),%al
     a38:	00 0f                	add    %cl,(%rdi)
     a3a:	11 01                	adc    %eax,(%rcx)
     a3c:	00 00                	add    %al,(%rax)
     a3e:	2b 2a                	sub    (%rdx),%ebp
     a40:	0c 00                	or     $0x0,%al
     a42:	00 06                	add    %al,(%rsi)
     a44:	98                   	cwtl   
     a45:	01 86 00 00 00 63    	add    %eax,0x63000000(%rsi)
     a4b:	0a 00                	or     (%rax),%al
     a4d:	00 16                	add    %dl,(%rsi)
     a4f:	0f 09                	wbinvd 
     a51:	00 00                	add    %al,(%rax)
     a53:	16                   	(bad)  
     a54:	63 0a                	movslq (%rdx),%ecx
     a56:	00 00                	add    %al,(%rax)
     a58:	16                   	(bad)  
     a59:	86 00                	xchg   %al,(%rax)
     a5b:	00 00                	add    %al,(%rax)
     a5d:	16                   	(bad)  
     a5e:	f2 09 00             	repnz or %eax,(%rax)
     a61:	00 00                	add    %al,(%rax)
     a63:	10 08                	adc    %cl,(%rax)
     a65:	28 01                	sub    %al,(%rcx)
     a67:	00 00                	add    %al,(%rax)
     a69:	2b 17                	sub    (%rdi),%edx
     a6b:	0c 00                	or     $0x0,%al
     a6d:	00 06                	add    %al,(%rsi)
     a6f:	f8                   	clc    
     a70:	02 98 00 00 00 84    	add    -0x7c000000(%rax),%bl
     a76:	0a 00                	or     (%rax),%al
     a78:	00 16                	add    %dl,(%rsi)
     a7a:	15 09 00 00 16       	adc    $0x16000009,%eax
     a7f:	e9 08 00 00 00       	jmpq   a8c <_init-0x3ffc24>
     a84:	2b f2                	sub    %edx,%esi
     a86:	04 00                	add    $0x0,%al
     a88:	00 06                	add    %al,(%rsi)
     a8a:	fe 02                	incb   (%rdx)
     a8c:	98                   	cwtl   
     a8d:	00 00                	add    %al,(%rax)
     a8f:	00 9a 0a 00 00 16    	add    %bl,0x1600000a(%rdx)
     a95:	15 09 00 00 00       	adc    $0x9,%eax
     a9a:	2b ab 04 00 00 06    	sub    0x6000004(%rbx),%ebp
     aa0:	5c                   	pop    %rsp
     aa1:	02 ff                	add    %bh,%bh
     aa3:	00 00                	add    %al,(%rax)
     aa5:	00 bb 0a 00 00 16    	add    %bh,0x1600000a(%rbx)
     aab:	0f 09                	wbinvd 
     aad:	00 00                	add    %al,(%rax)
     aaf:	16                   	(bad)  
     ab0:	86 00                	xchg   %al,(%rax)
     ab2:	00 00                	add    %al,(%rax)
     ab4:	16                   	(bad)  
     ab5:	52                   	push   %rdx
     ab6:	09 00                	or     %eax,(%rax)
     ab8:	00 2c 00             	add    %ch,(%rax,%rax,1)
     abb:	2b a1 05 00 00 06    	sub    0x6000005(%rcx),%esp
     ac1:	85 02                	test   %eax,(%rdx)
     ac3:	ff 00                	incl   (%rax)
     ac5:	00 00                	add    %al,(%rax)
     ac7:	d7                   	xlat   %ds:(%rbx)
     ac8:	0a 00                	or     (%rax),%al
     aca:	00 16                	add    %dl,(%rsi)
     acc:	52                   	push   %rdx
     acd:	09 00                	or     %eax,(%rax)
     acf:	00 16                	add    %dl,(%rsi)
     ad1:	52                   	push   %rdx
     ad2:	09 00                	or     %eax,(%rax)
     ad4:	00 2c 00             	add    %ch,(%rax,%rax,1)
     ad7:	2b d9                	sub    %ecx,%ebx
     ad9:	03 00                	add    (%rax),%eax
     adb:	00 06                	add    %al,(%rsi)
     add:	15 03 98 00 00       	adc    $0x9803,%eax
     ae2:	00 f2                	add    %dh,%dl
     ae4:	0a 00                	or     (%rax),%al
     ae6:	00 16                	add    %dl,(%rsi)
     ae8:	98                   	cwtl   
     ae9:	00 00                	add    %al,(%rax)
     aeb:	00 16                	add    %dl,(%rsi)
     aed:	e9 08 00 00 00       	jmpq   afa <_init-0x3ffbb6>
     af2:	2b 91 05 00 00 06    	sub    0x6000005(%rcx),%edx
     af8:	64                   	fs
     af9:	02 ff                	add    %bh,%bh
     afb:	00 00                	add    %al,(%rax)
     afd:	00 12                	add    %dl,(%rdx)
     aff:	0b 00                	or     (%rax),%eax
     b01:	00 16                	add    %dl,(%rsi)
     b03:	e9 08 00 00 16       	jmpq   16000b10 <_end+0x159ff938>
     b08:	52                   	push   %rdx
     b09:	09 00                	or     %eax,(%rax)
     b0b:	00 16                	add    %dl,(%rsi)
     b0d:	12 0b                	adc    (%rbx),%cl
     b0f:	00 00                	add    %al,(%rax)
     b11:	00 10                	add    %dl,(%rax)
     b13:	08 40 00             	or     %al,0x0(%rax)
     b16:	00 00                	add    %al,(%rax)
     b18:	2b 8e 0c 00 00 06    	sub    0x600000c(%rsi),%ecx
     b1e:	b1 02                	mov    $0x2,%cl
     b20:	ff 00                	incl   (%rax)
     b22:	00 00                	add    %al,(%rax)
     b24:	38 0b                	cmp    %cl,(%rbx)
     b26:	00 00                	add    %al,(%rax)
     b28:	16                   	(bad)  
     b29:	e9 08 00 00 16       	jmpq   16000b36 <_end+0x159ff95e>
     b2e:	52                   	push   %rdx
     b2f:	09 00                	or     %eax,(%rax)
     b31:	00 16                	add    %dl,(%rsi)
     b33:	12 0b                	adc    (%rbx),%cl
     b35:	00 00                	add    %al,(%rax)
     b37:	00 2b                	add    %ch,(%rbx)
     b39:	aa                   	stos   %al,%es:(%rdi)
     b3a:	04 00                	add    $0x0,%al
     b3c:	00 06                	add    %al,(%rsi)
     b3e:	71 02                	jno    b42 <_init-0x3ffb6e>
     b40:	ff 00                	incl   (%rax)
     b42:	00 00                	add    %al,(%rax)
     b44:	5d                   	pop    %rbp
     b45:	0b 00                	or     (%rax),%eax
     b47:	00 16                	add    %dl,(%rsi)
     b49:	0f 09                	wbinvd 
     b4b:	00 00                	add    %al,(%rax)
     b4d:	16                   	(bad)  
     b4e:	86 00                	xchg   %al,(%rax)
     b50:	00 00                	add    %al,(%rax)
     b52:	16                   	(bad)  
     b53:	52                   	push   %rdx
     b54:	09 00                	or     %eax,(%rax)
     b56:	00 16                	add    %dl,(%rsi)
     b58:	12 0b                	adc    (%rbx),%cl
     b5a:	00 00                	add    %al,(%rax)
     b5c:	00 2b                	add    %ch,(%rbx)
     b5e:	a0 05 00 00 06 bd 02 	movabs 0xff02bd06000005,%al
     b65:	ff 00 
     b67:	00 00                	add    %al,(%rax)
     b69:	7d 0b                	jge    b76 <_init-0x3ffb3a>
     b6b:	00 00                	add    %al,(%rax)
     b6d:	16                   	(bad)  
     b6e:	52                   	push   %rdx
     b6f:	09 00                	or     %eax,(%rax)
     b71:	00 16                	add    %dl,(%rsi)
     b73:	52                   	push   %rdx
     b74:	09 00                	or     %eax,(%rax)
     b76:	00 16                	add    %dl,(%rsi)
     b78:	12 0b                	adc    (%rbx),%cl
     b7a:	00 00                	add    %al,(%rax)
     b7c:	00 2b                	add    %ch,(%rbx)
     b7e:	ee                   	out    %al,(%dx)
     b7f:	01 00                	add    %eax,(%rax)
     b81:	00 06                	add    %al,(%rsi)
     b83:	6c                   	insb   (%dx),%es:(%rdi)
     b84:	02 ff                	add    %bh,%bh
     b86:	00 00                	add    %al,(%rax)
     b88:	00 98 0b 00 00 16    	add    %bl,0x1600000b(%rax)
     b8e:	52                   	push   %rdx
     b8f:	09 00                	or     %eax,(%rax)
     b91:	00 16                	add    %dl,(%rsi)
     b93:	12 0b                	adc    (%rbx),%cl
     b95:	00 00                	add    %al,(%rax)
     b97:	00 2b                	add    %ch,(%rbx)
     b99:	8a 0b                	mov    (%rbx),%cl
     b9b:	00 00                	add    %al,(%rax)
     b9d:	06                   	(bad)  
     b9e:	b9 02 ff 00 00       	mov    $0xff02,%ecx
     ba3:	00 b3 0b 00 00 16    	add    %dh,0x1600000b(%rbx)
     ba9:	52                   	push   %rdx
     baa:	09 00                	or     %eax,(%rax)
     bac:	00 16                	add    %dl,(%rsi)
     bae:	12 0b                	adc    (%rbx),%cl
     bb0:	00 00                	add    %al,(%rax)
     bb2:	00 2b                	add    %ch,(%rbx)
     bb4:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
     bb5:	0b 00                	or     (%rax),%eax
     bb7:	00 06                	add    %al,(%rsi)
     bb9:	72 01                	jb     bbc <_init-0x3ffaf4>
     bbb:	86 00                	xchg   %al,(%rax)
     bbd:	00 00                	add    %al,(%rax)
     bbf:	d3 0b                	rorl   %cl,(%rbx)
     bc1:	00 00                	add    %al,(%rax)
     bc3:	16                   	(bad)  
     bc4:	d3 0b                	rorl   %cl,(%rbx)
     bc6:	00 00                	add    %al,(%rax)
     bc8:	16                   	(bad)  
     bc9:	15 09 00 00 16       	adc    $0x16000009,%eax
     bce:	f2 09 00             	repnz or %eax,(%rax)
     bd1:	00 00                	add    %al,(%rax)
     bd3:	10 08                	adc    %cl,(%rax)
     bd5:	f8                   	clc    
     bd6:	00 00                	add    %al,(%rax)
     bd8:	00 2e                	add    %ch,(%rsi)
     bda:	5d                   	pop    %rbp
     bdb:	0b 00                	or     (%rax),%eax
     bdd:	00 06                	add    %al,(%rsi)
     bdf:	9b                   	fwait
     be0:	0f 09                	wbinvd 
     be2:	00 00                	add    %al,(%rax)
     be4:	f3 0b 00             	repz or (%rax),%eax
     be7:	00 16                	add    %dl,(%rsi)
     be9:	0f 09                	wbinvd 
     beb:	00 00                	add    %al,(%rax)
     bed:	16                   	(bad)  
     bee:	52                   	push   %rdx
     bef:	09 00                	or     %eax,(%rax)
     bf1:	00 00                	add    %al,(%rax)
     bf3:	2e                   	cs
     bf4:	16                   	(bad)  
     bf5:	03 00                	add    (%rax),%eax
     bf7:	00 06                	add    %al,(%rsi)
     bf9:	a3 ff 00 00 00 0d 0c 	movabs %eax,0xc0d000000ff
     c00:	00 00 
     c02:	16                   	(bad)  
     c03:	52                   	push   %rdx
     c04:	09 00                	or     %eax,(%rax)
     c06:	00 16                	add    %dl,(%rsi)
     c08:	52                   	push   %rdx
     c09:	09 00                	or     %eax,(%rax)
     c0b:	00 00                	add    %al,(%rax)
     c0d:	2e                   	cs
     c0e:	54                   	push   %rsp
     c0f:	01 00                	add    %eax,(%rax)
     c11:	00 06                	add    %al,(%rsi)
     c13:	c0 ff 00             	sar    $0x0,%bh
     c16:	00 00                	add    %al,(%rax)
     c18:	27                   	(bad)  
     c19:	0c 00                	or     $0x0,%al
     c1b:	00 16                	add    %dl,(%rsi)
     c1d:	52                   	push   %rdx
     c1e:	09 00                	or     %eax,(%rax)
     c20:	00 16                	add    %dl,(%rsi)
     c22:	52                   	push   %rdx
     c23:	09 00                	or     %eax,(%rax)
     c25:	00 00                	add    %al,(%rax)
     c27:	2e                   	cs
     c28:	9c                   	pushfq 
     c29:	04 00                	add    $0x0,%al
     c2b:	00 06                	add    %al,(%rsi)
     c2d:	93                   	xchg   %eax,%ebx
     c2e:	0f 09                	wbinvd 
     c30:	00 00                	add    %al,(%rax)
     c32:	41 0c 00             	rex.B or $0x0,%al
     c35:	00 16                	add    %dl,(%rsi)
     c37:	0f 09                	wbinvd 
     c39:	00 00                	add    %al,(%rax)
     c3b:	16                   	(bad)  
     c3c:	52                   	push   %rdx
     c3d:	09 00                	or     %eax,(%rax)
     c3f:	00 00                	add    %al,(%rax)
     c41:	2e                   	cs
     c42:	b5 00                	mov    $0x0,%ch
     c44:	00 00                	add    %al,(%rax)
     c46:	06                   	(bad)  
     c47:	fc                   	cld    
     c48:	86 00                	xchg   %al,(%rax)
     c4a:	00 00                	add    %al,(%rax)
     c4c:	5b                   	pop    %rbx
     c4d:	0c 00                	or     $0x0,%al
     c4f:	00 16                	add    %dl,(%rsi)
     c51:	52                   	push   %rdx
     c52:	09 00                	or     %eax,(%rax)
     c54:	00 16                	add    %dl,(%rsi)
     c56:	52                   	push   %rdx
     c57:	09 00                	or     %eax,(%rax)
     c59:	00 00                	add    %al,(%rax)
     c5b:	2b 1d 0b 00 00 06    	sub    0x600000b(%rip),%ebx        # 6000c6c <_end+0x59ffa94>
     c61:	57                   	push   %rdi
     c62:	03 86 00 00 00 80    	add    -0x80000000(%rsi),%eax
     c68:	0c 00                	or     $0x0,%al
     c6a:	00 16                	add    %dl,(%rsi)
     c6c:	0f 09                	wbinvd 
     c6e:	00 00                	add    %al,(%rax)
     c70:	16                   	(bad)  
     c71:	86 00                	xchg   %al,(%rax)
     c73:	00 00                	add    %al,(%rax)
     c75:	16                   	(bad)  
     c76:	52                   	push   %rdx
     c77:	09 00                	or     %eax,(%rax)
     c79:	00 16                	add    %dl,(%rsi)
     c7b:	80 0c 00 00          	orb    $0x0,(%rax,%rax,1)
     c7f:	00 10                	add    %dl,(%rax)
     c81:	08 86 0c 00 00 0f    	or     %al,0xf00000c(%rsi)
     c87:	8b 0c 00             	mov    (%rax,%rax,1),%ecx
     c8a:	00 2f                	add    %ch,(%rdi)
     c8c:	74 6d                	je     cfb <_init-0x3ff9b5>
     c8e:	00 38                	add    %bh,(%rax)
     c90:	0e                   	(bad)  
     c91:	85 1b                	test   %ebx,(%rbx)
     c93:	0d 00 00 06 da       	or     $0xda060000,%eax
     c98:	04 00                	add    $0x0,%al
     c9a:	00 0e                	add    %cl,(%rsi)
     c9c:	87 ff                	xchg   %edi,%edi
     c9e:	00 00                	add    %al,(%rax)
     ca0:	00 00                	add    %al,(%rax)
     ca2:	06                   	(bad)  
     ca3:	01 07                	add    %eax,(%rdi)
     ca5:	00 00                	add    %al,(%rax)
     ca7:	0e                   	(bad)  
     ca8:	88 ff                	mov    %bh,%bh
     caa:	00 00                	add    %al,(%rax)
     cac:	00 04 06             	add    %al,(%rsi,%rax,1)
     caf:	2b 00                	sub    (%rax),%eax
     cb1:	00 00                	add    %al,(%rax)
     cb3:	0e                   	(bad)  
     cb4:	89 ff                	mov    %edi,%edi
     cb6:	00 00                	add    %al,(%rax)
     cb8:	00 08                	add    %cl,(%rax)
     cba:	06                   	(bad)  
     cbb:	8f 04 00             	popq   (%rax,%rax,1)
     cbe:	00 0e                	add    %cl,(%rsi)
     cc0:	8a ff                	mov    %bh,%bh
     cc2:	00 00                	add    %al,(%rax)
     cc4:	00 0c 06             	add    %cl,(%rsi,%rax,1)
     cc7:	14 06                	adc    $0x6,%al
     cc9:	00 00                	add    %al,(%rax)
     ccb:	0e                   	(bad)  
     ccc:	8b ff                	mov    %edi,%edi
     cce:	00 00                	add    %al,(%rax)
     cd0:	00 10                	add    %dl,(%rax)
     cd2:	06                   	(bad)  
     cd3:	6b 0c 00 00          	imul   $0x0,(%rax,%rax,1),%ecx
     cd7:	0e                   	(bad)  
     cd8:	8c ff                	mov    %?,%edi
     cda:	00 00                	add    %al,(%rax)
     cdc:	00 14 06             	add    %dl,(%rsi,%rax,1)
     cdf:	ff 09                	decl   (%rcx)
     ce1:	00 00                	add    %al,(%rax)
     ce3:	0e                   	(bad)  
     ce4:	8d                   	(bad)  
     ce5:	ff 00                	incl   (%rax)
     ce7:	00 00                	add    %al,(%rax)
     ce9:	18 06                	sbb    %al,(%rsi)
     ceb:	55                   	push   %rbp
     cec:	02 00                	add    (%rax),%al
     cee:	00 0e                	add    %cl,(%rsi)
     cf0:	8e ff                	mov    %edi,%?
     cf2:	00 00                	add    %al,(%rax)
     cf4:	00 1c 06             	add    %bl,(%rsi,%rax,1)
     cf7:	e1 04                	loope  cfd <_init-0x3ff9b3>
     cf9:	00 00                	add    %al,(%rax)
     cfb:	0e                   	(bad)  
     cfc:	8f                   	(bad)  
     cfd:	ff 00                	incl   (%rax)
     cff:	00 00                	add    %al,(%rax)
     d01:	20 06                	and    %al,(%rsi)
     d03:	d8 0a                	fmuls  (%rdx)
     d05:	00 00                	add    %al,(%rax)
     d07:	0e                   	(bad)  
     d08:	92                   	xchg   %eax,%edx
     d09:	5e                   	pop    %rsi
     d0a:	0e                   	(bad)  
     d0b:	00 00                	add    %al,(%rax)
     d0d:	28 06                	sub    %al,(%rsi)
     d0f:	82                   	(bad)  
     d10:	0b 00                	or     (%rax),%eax
     d12:	00 0e                	add    %cl,(%rsi)
     d14:	93                   	xchg   %eax,%ebx
     d15:	28 01                	sub    %al,(%rcx)
     d17:	00 00                	add    %al,(%rax)
     d19:	30 00                	xor    %al,(%rax)
     d1b:	2b 94 0a 00 00 06 1f 	sub    0x1f060000(%rdx,%rcx,1),%edx
     d22:	01 86 00 00 00 31    	add    %eax,0x31000000(%rsi)
     d28:	0d 00 00 16 52       	or     $0x52160000,%eax
     d2d:	09 00                	or     %eax,(%rax)
     d2f:	00 00                	add    %al,(%rax)
     d31:	2e                   	cs
     d32:	cf                   	iret   
     d33:	0b 00                	or     (%rax),%eax
     d35:	00 06                	add    %al,(%rsi)
     d37:	9e                   	sahf   
     d38:	0f 09                	wbinvd 
     d3a:	00 00                	add    %al,(%rax)
     d3c:	50                   	push   %rax
     d3d:	0d 00 00 16 0f       	or     $0xf160000,%eax
     d42:	09 00                	or     %eax,(%rax)
     d44:	00 16                	add    %dl,(%rsi)
     d46:	52                   	push   %rdx
     d47:	09 00                	or     %eax,(%rax)
     d49:	00 16                	add    %dl,(%rsi)
     d4b:	86 00                	xchg   %al,(%rax)
     d4d:	00 00                	add    %al,(%rax)
     d4f:	00 2e                	add    %ch,(%rsi)
     d51:	9a                   	(bad)  
     d52:	03 00                	add    (%rax),%eax
     d54:	00 06                	add    %al,(%rsi)
     d56:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
     d57:	ff 00                	incl   (%rax)
     d59:	00 00                	add    %al,(%rax)
     d5b:	6f                   	outsl  %ds:(%rsi),(%dx)
     d5c:	0d 00 00 16 52       	or     $0x52160000,%eax
     d61:	09 00                	or     %eax,(%rax)
     d63:	00 16                	add    %dl,(%rsi)
     d65:	52                   	push   %rdx
     d66:	09 00                	or     %eax,(%rax)
     d68:	00 16                	add    %dl,(%rsi)
     d6a:	86 00                	xchg   %al,(%rax)
     d6c:	00 00                	add    %al,(%rax)
     d6e:	00 2e                	add    %ch,(%rsi)
     d70:	ea                   	(bad)  
     d71:	04 00                	add    $0x0,%al
     d73:	00 06                	add    %al,(%rsi)
     d75:	96                   	xchg   %eax,%esi
     d76:	0f 09                	wbinvd 
     d78:	00 00                	add    %al,(%rax)
     d7a:	8e 0d 00 00 16 0f    	mov    0xf160000(%rip),%cs        # f160d80 <_end+0xeb5fba8>
     d80:	09 00                	or     %eax,(%rax)
     d82:	00 16                	add    %dl,(%rsi)
     d84:	52                   	push   %rdx
     d85:	09 00                	or     %eax,(%rax)
     d87:	00 16                	add    %dl,(%rsi)
     d89:	86 00                	xchg   %al,(%rax)
     d8b:	00 00                	add    %al,(%rax)
     d8d:	00 2b                	add    %ch,(%rbx)
     d8f:	f5                   	cmc    
     d90:	09 00                	or     %eax,(%rax)
     d92:	00 06                	add    %al,(%rsi)
     d94:	9e                   	sahf   
     d95:	01 86 00 00 00 b3    	add    %eax,-0x4d000000(%rsi)
     d9b:	0d 00 00 16 d3       	or     $0xd3160000,%eax
     da0:	0b 00                	or     (%rax),%eax
     da2:	00 16                	add    %dl,(%rsi)
     da4:	b3 0d                	mov    $0xd,%bl
     da6:	00 00                	add    %al,(%rax)
     da8:	16                   	(bad)  
     da9:	86 00                	xchg   %al,(%rax)
     dab:	00 00                	add    %al,(%rax)
     dad:	16                   	(bad)  
     dae:	f2 09 00             	repnz or %eax,(%rax)
     db1:	00 00                	add    %al,(%rax)
     db3:	10 08                	adc    %cl,(%rax)
     db5:	52                   	push   %rdx
     db6:	09 00                	or     %eax,(%rax)
     db8:	00 2b                	add    %ch,(%rbx)
     dba:	bb 07 00 00 06       	mov    $0x6000007,%ebx
     dbf:	00 01                	add    %al,(%rcx)
     dc1:	86 00                	xchg   %al,(%rax)
     dc3:	00 00                	add    %al,(%rax)
     dc5:	d4                   	(bad)  
     dc6:	0d 00 00 16 52       	or     $0x52160000,%eax
     dcb:	09 00                	or     %eax,(%rax)
     dcd:	00 16                	add    %dl,(%rsi)
     dcf:	52                   	push   %rdx
     dd0:	09 00                	or     %eax,(%rax)
     dd2:	00 00                	add    %al,(%rax)
     dd4:	2b 3b                	sub    (%rbx),%edi
     dd6:	0a 00                	or     (%rax),%al
     dd8:	00 06                	add    %al,(%rsi)
     dda:	c2 01 ef             	retq   $0xef01
     ddd:	0d 00 00 ef 0d       	or     $0xdef0000,%eax
     de2:	00 00                	add    %al,(%rax)
     de4:	16                   	(bad)  
     de5:	52                   	push   %rdx
     de6:	09 00                	or     %eax,(%rax)
     de8:	00 16                	add    %dl,(%rsi)
     dea:	f6                   	(bad)  
     deb:	0d 00 00 00 04       	or     $0x4000000,%eax
     df0:	08 04 a7             	or     %al,(%rdi,%riz,4)
     df3:	08 00                	or     %al,(%rax)
     df5:	00 10                	add    %dl,(%rax)
     df7:	08 0f                	or     %cl,(%rdi)
     df9:	09 00                	or     %eax,(%rax)
     dfb:	00 2b                	add    %ch,(%rbx)
     dfd:	42 0a 00             	rex.X or (%rax),%al
     e00:	00 06                	add    %al,(%rsi)
     e02:	c9                   	leaveq 
     e03:	01 17                	add    %edx,(%rdi)
     e05:	0e                   	(bad)  
     e06:	00 00                	add    %al,(%rax)
     e08:	17                   	(bad)  
     e09:	0e                   	(bad)  
     e0a:	00 00                	add    %al,(%rax)
     e0c:	16                   	(bad)  
     e0d:	52                   	push   %rdx
     e0e:	09 00                	or     %eax,(%rax)
     e10:	00 16                	add    %dl,(%rsi)
     e12:	f6                   	(bad)  
     e13:	0d 00 00 00 04       	or     $0x4000000,%eax
     e18:	04 04                	add    $0x4,%al
     e1a:	f1                   	icebp  
     e1b:	06                   	(bad)  
     e1c:	00 00                	add    %al,(%rax)
     e1e:	2b 49 0a             	sub    0xa(%rcx),%ecx
     e21:	00 00                	add    %al,(%rax)
     e23:	06                   	(bad)  
     e24:	1a 01                	sbb    (%rcx),%al
     e26:	0f 09                	wbinvd 
     e28:	00 00                	add    %al,(%rax)
     e2a:	3e                   	ds
     e2b:	0e                   	(bad)  
     e2c:	00 00                	add    %al,(%rax)
     e2e:	16                   	(bad)  
     e2f:	0f 09                	wbinvd 
     e31:	00 00                	add    %al,(%rax)
     e33:	16                   	(bad)  
     e34:	52                   	push   %rdx
     e35:	09 00                	or     %eax,(%rax)
     e37:	00 16                	add    %dl,(%rsi)
     e39:	f6                   	(bad)  
     e3a:	0d 00 00 00 2b       	or     $0x2b000000,%eax
     e3f:	50                   	push   %rax
     e40:	0a 00                	or     (%rax),%al
     e42:	00 06                	add    %al,(%rsi)
     e44:	d4                   	(bad)  
     e45:	01 5e 0e             	add    %ebx,0xe(%rsi)
     e48:	00 00                	add    %al,(%rax)
     e4a:	5e                   	pop    %rsi
     e4b:	0e                   	(bad)  
     e4c:	00 00                	add    %al,(%rax)
     e4e:	16                   	(bad)  
     e4f:	52                   	push   %rdx
     e50:	09 00                	or     %eax,(%rax)
     e52:	00 16                	add    %dl,(%rsi)
     e54:	f6                   	(bad)  
     e55:	0d 00 00 16 ff       	or     $0xff160000,%eax
     e5a:	00 00                	add    %al,(%rax)
     e5c:	00 00                	add    %al,(%rax)
     e5e:	04 08                	add    $0x8,%al
     e60:	05 0d 0c 00 00       	add    $0xc0d,%eax
     e65:	2b 2b                	sub    (%rbx),%ebp
     e67:	0d 00 00 06 d9       	or     $0xd9060000,%eax
     e6c:	01 91 00 00 00 85    	add    %edx,-0x7b000000(%rcx)
     e72:	0e                   	(bad)  
     e73:	00 00                	add    %al,(%rax)
     e75:	16                   	(bad)  
     e76:	52                   	push   %rdx
     e77:	09 00                	or     %eax,(%rax)
     e79:	00 16                	add    %dl,(%rsi)
     e7b:	f6                   	(bad)  
     e7c:	0d 00 00 16 ff       	or     $0xff160000,%eax
     e81:	00 00                	add    %al,(%rax)
     e83:	00 00                	add    %al,(%rax)
     e85:	2e                   	cs
     e86:	35 01 00 00 06       	xor    $0x6000001,%eax
     e8b:	c4                   	(bad)  
     e8c:	86 00                	xchg   %al,(%rax)
     e8e:	00 00                	add    %al,(%rax)
     e90:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     e91:	0e                   	(bad)  
     e92:	00 00                	add    %al,(%rax)
     e94:	16                   	(bad)  
     e95:	0f 09                	wbinvd 
     e97:	00 00                	add    %al,(%rax)
     e99:	16                   	(bad)  
     e9a:	52                   	push   %rdx
     e9b:	09 00                	or     %eax,(%rax)
     e9d:	00 16                	add    %dl,(%rsi)
     e9f:	86 00                	xchg   %al,(%rax)
     ea1:	00 00                	add    %al,(%rax)
     ea3:	00 2b                	add    %ch,(%rbx)
     ea5:	86 06                	xchg   %al,(%rsi)
     ea7:	00 00                	add    %al,(%rax)
     ea9:	06                   	(bad)  
     eaa:	65                   	gs
     eab:	01 ff                	add    %edi,%edi
     ead:	00 00                	add    %al,(%rax)
     eaf:	00 ba 0e 00 00 16    	add    %bh,0x1600000e(%rdx)
     eb5:	98                   	cwtl   
     eb6:	00 00                	add    %al,(%rax)
     eb8:	00 00                	add    %al,(%rax)
     eba:	2b fb                	sub    %ebx,%edi
     ebc:	04 00                	add    $0x0,%al
     ebe:	00 06                	add    %al,(%rsi)
     ec0:	45 01 ff             	add    %r15d,%r15d
     ec3:	00 00                	add    %al,(%rax)
     ec5:	00 da                	add    %bl,%dl
     ec7:	0e                   	(bad)  
     ec8:	00 00                	add    %al,(%rax)
     eca:	16                   	(bad)  
     ecb:	52                   	push   %rdx
     ecc:	09 00                	or     %eax,(%rax)
     ece:	00 16                	add    %dl,(%rsi)
     ed0:	52                   	push   %rdx
     ed1:	09 00                	or     %eax,(%rax)
     ed3:	00 16                	add    %dl,(%rsi)
     ed5:	86 00                	xchg   %al,(%rax)
     ed7:	00 00                	add    %al,(%rax)
     ed9:	00 2b                	add    %ch,(%rbx)
     edb:	0c 06                	or     $0x6,%al
     edd:	00 00                	add    %al,(%rax)
     edf:	06                   	(bad)  
     ee0:	49 01 0f             	add    %rcx,(%r15)
     ee3:	09 00                	or     %eax,(%rax)
     ee5:	00 fa                	add    %bh,%dl
     ee7:	0e                   	(bad)  
     ee8:	00 00                	add    %al,(%rax)
     eea:	16                   	(bad)  
     eeb:	0f 09                	wbinvd 
     eed:	00 00                	add    %al,(%rax)
     eef:	16                   	(bad)  
     ef0:	52                   	push   %rdx
     ef1:	09 00                	or     %eax,(%rax)
     ef3:	00 16                	add    %dl,(%rsi)
     ef5:	86 00                	xchg   %al,(%rax)
     ef7:	00 00                	add    %al,(%rax)
     ef9:	00 2b                	add    %ch,(%rbx)
     efb:	b2 03                	mov    $0x3,%dl
     efd:	00 00                	add    %al,(%rax)
     eff:	06                   	(bad)  
     f00:	4e 01 0f             	rex.WRX add %r9,(%rdi)
     f03:	09 00                	or     %eax,(%rax)
     f05:	00 1a                	add    %bl,(%rdx)
     f07:	0f 00 00             	sldt   (%rax)
     f0a:	16                   	(bad)  
     f0b:	0f 09                	wbinvd 
     f0d:	00 00                	add    %al,(%rax)
     f0f:	16                   	(bad)  
     f10:	52                   	push   %rdx
     f11:	09 00                	or     %eax,(%rax)
     f13:	00 16                	add    %dl,(%rsi)
     f15:	86 00                	xchg   %al,(%rax)
     f17:	00 00                	add    %al,(%rax)
     f19:	00 2b                	add    %ch,(%rbx)
     f1b:	b4 04                	mov    $0x4,%ah
     f1d:	00 00                	add    %al,(%rax)
     f1f:	06                   	(bad)  
     f20:	52                   	push   %rdx
     f21:	01 0f                	add    %ecx,(%rdi)
     f23:	09 00                	or     %eax,(%rax)
     f25:	00 3a                	add    %bh,(%rdx)
     f27:	0f 00 00             	sldt   (%rax)
     f2a:	16                   	(bad)  
     f2b:	0f 09                	wbinvd 
     f2d:	00 00                	add    %al,(%rax)
     f2f:	16                   	(bad)  
     f30:	15 09 00 00 16       	adc    $0x16000009,%eax
     f35:	86 00                	xchg   %al,(%rax)
     f37:	00 00                	add    %al,(%rax)
     f39:	00 2b                	add    %ch,(%rbx)
     f3b:	93                   	xchg   %eax,%ebx
     f3c:	05 00 00 06 59       	add    $0x59060000,%eax
     f41:	02 ff                	add    %bh,%bh
     f43:	00 00                	add    %al,(%rax)
     f45:	00 51 0f             	add    %dl,0xf(%rcx)
     f48:	00 00                	add    %al,(%rax)
     f4a:	16                   	(bad)  
     f4b:	52                   	push   %rdx
     f4c:	09 00                	or     %eax,(%rax)
     f4e:	00 2c 00             	add    %ch,(%rax,%rax,1)
     f51:	2b 90 0c 00 00 06    	sub    0x600000c(%rax),%edx
     f57:	82                   	(bad)  
     f58:	02 ff                	add    %bh,%bh
     f5a:	00 00                	add    %al,(%rax)
     f5c:	00 68 0f             	add    %ch,0xf(%rax)
     f5f:	00 00                	add    %al,(%rax)
     f61:	16                   	(bad)  
     f62:	52                   	push   %rdx
     f63:	09 00                	or     %eax,(%rax)
     f65:	00 2c 00             	add    %ch,(%rax,%rax,1)
     f68:	18 0f                	sbb    %cl,(%rdi)
     f6a:	01 00                	add    %eax,(%rax)
     f6c:	00 06                	add    %al,(%rsi)
     f6e:	e0 0f                	loopne f7f <_init-0x3ff731>
     f70:	01 00                	add    %eax,(%rax)
     f72:	00 52 09             	add    %dl,0x9(%rdx)
     f75:	00 00                	add    %al,(%rax)
     f77:	86 0f                	xchg   %cl,(%rdi)
     f79:	00 00                	add    %al,(%rax)
     f7b:	16                   	(bad)  
     f7c:	52                   	push   %rdx
     f7d:	09 00                	or     %eax,(%rax)
     f7f:	00 16                	add    %dl,(%rsi)
     f81:	15 09 00 00 00       	adc    $0x9,%eax
     f86:	19 32                	sbb    %esi,(%rdx)
     f88:	03 00                	add    (%rax),%eax
     f8a:	00 06                	add    %al,(%rsi)
     f8c:	06                   	(bad)  
     f8d:	01 32                	add    %esi,(%rdx)
     f8f:	03 00                	add    (%rax),%eax
     f91:	00 52 09             	add    %dl,0x9(%rdx)
     f94:	00 00                	add    %al,(%rax)
     f96:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
     f97:	0f 00 00             	sldt   (%rax)
     f9a:	16                   	(bad)  
     f9b:	52                   	push   %rdx
     f9c:	09 00                	or     %eax,(%rax)
     f9e:	00 16                	add    %dl,(%rsi)
     fa0:	52                   	push   %rdx
     fa1:	09 00                	or     %eax,(%rax)
     fa3:	00 00                	add    %al,(%rax)
     fa5:	18 68 0a             	sbb    %ch,0xa(%rax)
     fa8:	00 00                	add    %al,(%rax)
     faa:	06                   	(bad)  
     fab:	ea                   	(bad)  
     fac:	68 0a 00 00 52       	pushq  $0x5200000a
     fb1:	09 00                	or     %eax,(%rax)
     fb3:	00 c3                	add    %al,%bl
     fb5:	0f 00 00             	sldt   (%rax)
     fb8:	16                   	(bad)  
     fb9:	52                   	push   %rdx
     fba:	09 00                	or     %eax,(%rax)
     fbc:	00 16                	add    %dl,(%rsi)
     fbe:	15 09 00 00 00       	adc    $0x9,%eax
     fc3:	19 af 09 00 00 06    	sbb    %ebp,0x6000009(%rdi)
     fc9:	11 01                	adc    %eax,(%rcx)
     fcb:	af                   	scas   %es:(%rdi),%eax
     fcc:	09 00                	or     %eax,(%rax)
     fce:	00 52 09             	add    %dl,0x9(%rdx)
     fd1:	00 00                	add    %al,(%rax)
     fd3:	e2 0f                	loop   fe4 <_init-0x3ff6cc>
     fd5:	00 00                	add    %al,(%rax)
     fd7:	16                   	(bad)  
     fd8:	52                   	push   %rdx
     fd9:	09 00                	or     %eax,(%rax)
     fdb:	00 16                	add    %dl,(%rsi)
     fdd:	52                   	push   %rdx
     fde:	09 00                	or     %eax,(%rax)
     fe0:	00 00                	add    %al,(%rax)
     fe2:	19 ca                	sbb    %ecx,%edx
     fe4:	02 00                	add    (%rax),%al
     fe6:	00 06                	add    %al,(%rsi)
     fe8:	3c 01                	cmp    $0x1,%al
     fea:	ca 02 00             	lret   $0x2
     fed:	00 52 09             	add    %dl,0x9(%rdx)
     ff0:	00 00                	add    %al,(%rax)
     ff2:	06                   	(bad)  
     ff3:	10 00                	adc    %al,(%rax)
     ff5:	00 16                	add    %dl,(%rsi)
     ff7:	52                   	push   %rdx
     ff8:	09 00                	or     %eax,(%rax)
     ffa:	00 16                	add    %dl,(%rsi)
     ffc:	15 09 00 00 16       	adc    $0x16000009,%eax
    1001:	86 00                	xchg   %al,(%rax)
    1003:	00 00                	add    %al,(%rax)
    1005:	00 30                	add    %dh,(%rax)
    1007:	3c 08                	cmp    $0x8,%al
    1009:	00 00                	add    %al,(%rax)
    100b:	07                   	(bad)  
    100c:	f2 7d 11             	bnd jge 1020 <_init-0x3ff690>
    100f:	00 00                	add    %al,(%rax)
    1011:	12 07                	adc    (%rdi),%al
    1013:	f8                   	clc    
    1014:	7d 11                	jge    1027 <_init-0x3ff689>
    1016:	00 00                	add    %al,(%rax)
    1018:	13 07                	adc    (%rdi),%eax
    101a:	01 01                	add    %eax,(%rcx)
    101c:	9f                   	lahf   
    101d:	11 00                	adc    %eax,(%rax)
    101f:	00 13                	add    %dl,(%rbx)
    1021:	07                   	(bad)  
    1022:	02 01                	add    (%rcx),%al
    1024:	c6                   	(bad)  
    1025:	11 00                	adc    %eax,(%rax)
    1027:	00 12                	add    %dl,(%rdx)
    1029:	0f 2c ba 04 00 00 12 	cvttps2pi 0x12000004(%rdx),%mm7
    1030:	0f 2d da             	cvtps2pi %xmm2,%mm3
    1033:	04 00                	add    $0x0,%al
    1035:	00 05 4f 00 00 00    	add    %al,0x4f(%rip)        # 108a <_init-0x3ff626>
    103b:	01 10                	add    %edx,(%rax)
    103d:	37                   	(bad)  
    103e:	78 10                	js     1050 <_init-0x3ff660>
    1040:	00 00                	add    %al,(%rax)
    1042:	31 bb 03 00 00 10    	xor    %edi,0x10000003(%rbx)
    1048:	3a 23                	cmp    (%rbx),%ah
    104a:	01 00                	add    %eax,(%rax)
    104c:	00 31                	add    %dh,(%rcx)
    104e:	af                   	scas   %es:(%rdi),%eax
    104f:	00 00                	add    %al,(%rax)
    1051:	00 10                	add    %dl,(%rax)
    1053:	3b 23                	cmp    (%rbx),%esp
    1055:	01 00                	add    %eax,(%rax)
    1057:	00 31                	add    %dh,(%rcx)
    1059:	6c                   	insb   (%dx),%es:(%rdi)
    105a:	03 00                	add    (%rax),%eax
    105c:	00 10                	add    %dl,(%rax)
    105e:	3f                   	(bad)  
    105f:	a8 13                	test   $0x13,%al
    1061:	00 00                	add    %al,(%rax)
    1063:	31 32                	xor    %esi,(%rdx)
    1065:	0a 00                	or     (%rax),%al
    1067:	00 10                	add    %dl,(%rax)
    1069:	40 23 01             	rex and (%rcx),%eax
    106c:	00 00                	add    %al,(%rax)
    106e:	28 44 02 00          	sub    %al,0x0(%rdx,%rax,1)
    1072:	00 ff                	add    %bh,%bh
    1074:	00 00                	add    %al,(%rax)
    1076:	00 00                	add    %al,(%rax)
    1078:	05 3f 0c 00 00       	add    $0xc3f,%eax
    107d:	01 10                	add    %edx,(%rax)
    107f:	37                   	(bad)  
    1080:	ba 10 00 00 31       	mov    $0x31000010,%edx
    1085:	bb 03 00 00 10       	mov    $0x10000003,%ebx
    108a:	3a ad 13 00 00 31    	cmp    0x31000013(%rbp),%ch
    1090:	af                   	scas   %es:(%rdi),%eax
    1091:	00 00                	add    %al,(%rax)
    1093:	00 10                	add    %dl,(%rax)
    1095:	3b ad 13 00 00 31    	cmp    0x31000013(%rbp),%ebp
    109b:	6c                   	insb   (%dx),%es:(%rdi)
    109c:	03 00                	add    (%rax),%eax
    109e:	00 10                	add    %dl,(%rax)
    10a0:	3f                   	(bad)  
    10a1:	a8 13                	test   $0x13,%al
    10a3:	00 00                	add    %al,(%rax)
    10a5:	31 32                	xor    %esi,(%rdx)
    10a7:	0a 00                	or     (%rax),%al
    10a9:	00 10                	add    %dl,(%rax)
    10ab:	40 23 01             	rex and (%rcx),%eax
    10ae:	00 00                	add    %al,(%rax)
    10b0:	28 44 02 00          	sub    %al,0x0(%rdx,%rax,1)
    10b4:	00 91 00 00 00 00    	add    %dl,0x0(%rcx)
    10ba:	05 cf 01 00 00       	add    $0x1cf,%eax
    10bf:	01 10                	add    %edx,(%rax)
    10c1:	37                   	(bad)  
    10c2:	fc                   	cld    
    10c3:	10 00                	adc    %al,(%rax)
    10c5:	00 31                	add    %dh,(%rcx)
    10c7:	bb 03 00 00 10       	mov    $0x10000003,%ebx
    10cc:	3a 2e                	cmp    (%rsi),%ch
    10ce:	01 00                	add    %eax,(%rax)
    10d0:	00 31                	add    %dh,(%rcx)
    10d2:	af                   	scas   %es:(%rdi),%eax
    10d3:	00 00                	add    %al,(%rax)
    10d5:	00 10                	add    %dl,(%rax)
    10d7:	3b 2e                	cmp    (%rsi),%ebp
    10d9:	01 00                	add    %eax,(%rax)
    10db:	00 31                	add    %dh,(%rcx)
    10dd:	6c                   	insb   (%dx),%es:(%rdi)
    10de:	03 00                	add    (%rax),%eax
    10e0:	00 10                	add    %dl,(%rax)
    10e2:	3f                   	(bad)  
    10e3:	a8 13                	test   $0x13,%al
    10e5:	00 00                	add    %al,(%rax)
    10e7:	31 32                	xor    %esi,(%rdx)
    10e9:	0a 00                	or     (%rax),%al
    10eb:	00 10                	add    %dl,(%rax)
    10ed:	40 23 01             	rex and (%rcx),%eax
    10f0:	00 00                	add    %al,(%rax)
    10f2:	28 44 02 00          	sub    %al,0x0(%rdx,%rax,1)
    10f6:	00 f8                	add    %bh,%al
    10f8:	00 00                	add    %al,(%rax)
    10fa:	00 00                	add    %al,(%rax)
    10fc:	05 d7 0b 00 00       	add    $0xbd7,%eax
    1101:	01 10                	add    %edx,(%rax)
    1103:	37                   	(bad)  
    1104:	3e 11 00             	adc    %eax,%ds:(%rax)
    1107:	00 31                	add    %dh,(%rcx)
    1109:	bb 03 00 00 10       	mov    $0x10000003,%ebx
    110e:	3a 37                	cmp    (%rdi),%dh
    1110:	14 00                	adc    $0x0,%al
    1112:	00 31                	add    %dh,(%rcx)
    1114:	af                   	scas   %es:(%rdi),%eax
    1115:	00 00                	add    %al,(%rax)
    1117:	00 10                	add    %dl,(%rax)
    1119:	3b 37                	cmp    (%rdi),%esi
    111b:	14 00                	adc    $0x0,%al
    111d:	00 31                	add    %dh,(%rcx)
    111f:	6c                   	insb   (%dx),%es:(%rdi)
    1120:	03 00                	add    (%rax),%eax
    1122:	00 10                	add    %dl,(%rax)
    1124:	3f                   	(bad)  
    1125:	a8 13                	test   $0x13,%al
    1127:	00 00                	add    %al,(%rax)
    1129:	31 32                	xor    %esi,(%rdx)
    112b:	0a 00                	or     (%rax),%al
    112d:	00 10                	add    %dl,(%rax)
    112f:	40 23 01             	rex and (%rcx),%eax
    1132:	00 00                	add    %al,(%rax)
    1134:	28 44 02 00          	sub    %al,0x0(%rdx,%rax,1)
    1138:	00 fb                	add    %bh,%bl
    113a:	11 00                	adc    %eax,(%rax)
    113c:	00 00                	add    %al,(%rax)
    113e:	32 be 08 00 00 01    	xor    0x1000008(%rsi),%bh
    1144:	10 37                	adc    %dh,(%rdi)
    1146:	31 bb 03 00 00 10    	xor    %edi,0x10000003(%rbx)
    114c:	3a 3c 14             	cmp    (%rsp,%rdx,1),%bh
    114f:	00 00                	add    %al,(%rax)
    1151:	31 af 00 00 00 10    	xor    %ebp,0x10000000(%rdi)
    1157:	3b 3c 14             	cmp    (%rsp,%rdx,1),%edi
    115a:	00 00                	add    %al,(%rax)
    115c:	31 6c 03 00          	xor    %ebp,0x0(%rbx,%rax,1)
    1160:	00 10                	add    %dl,(%rax)
    1162:	3f                   	(bad)  
    1163:	a8 13                	test   $0x13,%al
    1165:	00 00                	add    %al,(%rax)
    1167:	31 32                	xor    %esi,(%rdx)
    1169:	0a 00                	or     (%rax),%al
    116b:	00 10                	add    %dl,(%rax)
    116d:	40 23 01             	rex and (%rcx),%eax
    1170:	00 00                	add    %al,(%rax)
    1172:	28 44 02 00          	sub    %al,0x0(%rdx,%rax,1)
    1176:	00 5e 0e             	add    %bl,0xe(%rsi)
    1179:	00 00                	add    %al,(%rax)
    117b:	00 00                	add    %al,(%rax)
    117d:	2b 72 09             	sub    0x9(%rdx),%esi
    1180:	00 00                	add    %al,(%rax)
    1182:	06                   	(bad)  
    1183:	cb                   	lret   
    1184:	01 98 11 00 00 98    	add    %ebx,-0x67ffffef(%rax)
    118a:	11 00                	adc    %eax,(%rax)
    118c:	00 16                	add    %dl,(%rsi)
    118e:	52                   	push   %rdx
    118f:	09 00                	or     %eax,(%rax)
    1191:	00 16                	add    %dl,(%rsi)
    1193:	f6                   	(bad)  
    1194:	0d 00 00 00 04       	or     $0x4000000,%eax
    1199:	10 04 a2             	adc    %al,(%rdx,%riz,4)
    119c:	08 00                	or     %al,(%rax)
    119e:	00 2b                	add    %ch,(%rbx)
    11a0:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    11a1:	09 00                	or     %eax,(%rax)
    11a3:	00 06                	add    %al,(%rsi)
    11a5:	e3 01                	jrcxz  11a8 <_init-0x3ff508>
    11a7:	bf 11 00 00 bf       	mov    $0xbf000011,%edi
    11ac:	11 00                	adc    %eax,(%rax)
    11ae:	00 16                	add    %dl,(%rsi)
    11b0:	52                   	push   %rdx
    11b1:	09 00                	or     %eax,(%rax)
    11b3:	00 16                	add    %dl,(%rsi)
    11b5:	f6                   	(bad)  
    11b6:	0d 00 00 16 ff       	or     $0xff160000,%eax
    11bb:	00 00                	add    %al,(%rax)
    11bd:	00 00                	add    %al,(%rax)
    11bf:	04 08                	add    $0x8,%al
    11c1:	05 08 0c 00 00       	add    $0xc08,%eax
    11c6:	2b 72 04             	sub    0x4(%rdx),%esi
    11c9:	00 00                	add    %al,(%rax)
    11cb:	06                   	(bad)  
    11cc:	ea                   	(bad)  
    11cd:	01 e6                	add    %esp,%esi
    11cf:	11 00                	adc    %eax,(%rax)
    11d1:	00 e6                	add    %ah,%dh
    11d3:	11 00                	adc    %eax,(%rax)
    11d5:	00 16                	add    %dl,(%rsi)
    11d7:	52                   	push   %rdx
    11d8:	09 00                	or     %eax,(%rax)
    11da:	00 16                	add    %dl,(%rsi)
    11dc:	f6                   	(bad)  
    11dd:	0d 00 00 16 ff       	or     $0xff160000,%eax
    11e2:	00 00                	add    %al,(%rax)
    11e4:	00 00                	add    %al,(%rax)
    11e6:	04 08                	add    $0x8,%al
    11e8:	07                   	(bad)  
    11e9:	4d 09 00             	or     %r8,(%r8)
    11ec:	00 04 01             	add    %al,(%rcx,%rax,1)
    11ef:	08 bc 02 00 00 04 01 	or     %bh,0x1040000(%rdx,%rax,1)
    11f6:	06                   	(bad)  
    11f7:	be 02 00 00 04       	mov    $0x4000002,%esi
    11fc:	02 05 f2 0a 00 00    	add    0xaf2(%rip),%al        # 1cf4 <_init-0x3fe9bc>
    1202:	30 85 05 00 00 11    	xor    %al,0x11000005(%rbp)
    1208:	37                   	(bad)  
    1209:	15 12 00 00 33       	adc    $0x33000012,%eax
    120e:	11 38                	adc    %edi,(%rax)
    1210:	ec                   	in     (%dx),%al
    1211:	02 00                	add    (%rax),%al
    1213:	00 00                	add    %al,(%rax)
    1215:	34 08                	xor    $0x8,%al
    1217:	ff 02                	incl   (%rdx)
    1219:	00 00                	add    %al,(%rax)
    121b:	34 08                	xor    $0x8,%al
    121d:	2f                   	(bad)  
    121e:	03 00                	add    (%rax),%eax
    1220:	00 04 01             	add    %al,(%rcx,%rax,1)
    1223:	02 46 08             	add    0x8(%rsi),%al
    1226:	00 00                	add    %al,(%rax)
    1228:	10 08                	adc    %cl,(%rax)
    122a:	2f                   	(bad)  
    122b:	03 00                	add    (%rax),%eax
    122d:	00 10                	add    %dl,(%rax)
    122f:	08 ff                	or     %bh,%bh
    1231:	02 00                	add    (%rax),%al
    1233:	00 34 08             	add    %dh,(%rax,%rcx,1)
    1236:	55                   	push   %rbp
    1237:	04 00                	add    $0x0,%al
    1239:	00 05 ad 0b 00 00    	add    %al,0xbad(%rip)        # 1dec <_init-0x3fe8c4>
    123f:	60                   	(bad)  
    1240:	12 35 67 13 00 00    	adc    0x1367(%rip),%dh        # 25ad <_init-0x3fe103>
    1246:	06                   	(bad)  
    1247:	c1 01 00             	roll   $0x0,(%rcx)
    124a:	00 12                	add    %dl,(%rdx)
    124c:	39 d3                	cmp    %edx,%ebx
    124e:	0b 00                	or     (%rax),%eax
    1250:	00 00                	add    %al,(%rax)
    1252:	06                   	(bad)  
    1253:	cb                   	lret   
    1254:	03 00                	add    (%rax),%eax
    1256:	00 12                	add    %dl,(%rdx)
    1258:	3a d3                	cmp    %bl,%dl
    125a:	0b 00                	or     (%rax),%eax
    125c:	00 08                	add    %cl,(%rax)
    125e:	06                   	(bad)  
    125f:	2a 0b                	sub    (%rbx),%cl
    1261:	00 00                	add    %al,(%rax)
    1263:	12 40 d3             	adc    -0x2d(%rax),%al
    1266:	0b 00                	or     (%rax),%eax
    1268:	00 10                	add    %dl,(%rax)
    126a:	06                   	(bad)  
    126b:	ff 00                	incl   (%rax)
    126d:	00 00                	add    %al,(%rax)
    126f:	12 46 d3             	adc    -0x2d(%rsi),%al
    1272:	0b 00                	or     (%rax),%eax
    1274:	00 18                	add    %bl,(%rax)
    1276:	06                   	(bad)  
    1277:	e2 0a                	loop   1283 <_init-0x3ff42d>
    1279:	00 00                	add    %al,(%rax)
    127b:	12 47 d3             	adc    -0x2d(%rdi),%al
    127e:	0b 00                	or     (%rax),%eax
    1280:	00 20                	add    %ah,(%rax)
    1282:	06                   	(bad)  
    1283:	bd 01 00 00 12       	mov    $0x12000001,%ebp
    1288:	48 d3 0b             	rorq   %cl,(%rbx)
    128b:	00 00                	add    %al,(%rax)
    128d:	28 06                	sub    %al,(%rsi)
    128f:	c7 03 00 00 12 49    	movl   $0x49120000,(%rbx)
    1295:	d3 0b                	rorl   %cl,(%rbx)
    1297:	00 00                	add    %al,(%rax)
    1299:	30 06                	xor    %al,(%rsi)
    129b:	26 0b 00             	or     %es:(%rax),%eax
    129e:	00 12                	add    %dl,(%rdx)
    12a0:	4a d3 0b             	rex.WX rorq %cl,(%rbx)
    12a3:	00 00                	add    %al,(%rax)
    12a5:	38 06                	cmp    %al,(%rsi)
    12a7:	54                   	push   %rsp
    12a8:	07                   	(bad)  
    12a9:	00 00                	add    %al,(%rax)
    12ab:	12 4b d3             	adc    -0x2d(%rbx),%cl
    12ae:	0b 00                	or     (%rax),%eax
    12b0:	00 40 06             	add    %al,0x6(%rax)
    12b3:	38 04 00             	cmp    %al,(%rax,%rax,1)
    12b6:	00 12                	add    %dl,(%rdx)
    12b8:	4c d3 0b             	rex.WR rorq %cl,(%rbx)
    12bb:	00 00                	add    %al,(%rax)
    12bd:	48 06                	rex.W (bad) 
    12bf:	3d 01 00 00 12       	cmp    $0x12000001,%eax
    12c4:	4d f8                	rex.WRB clc 
    12c6:	00 00                	add    %al,(%rax)
    12c8:	00 50 06             	add    %dl,0x6(%rax)
    12cb:	41 01 00             	add    %eax,(%r8)
    12ce:	00 12                	add    %dl,(%rdx)
    12d0:	4e f8                	rex.WRX clc 
    12d2:	00 00                	add    %al,(%rax)
    12d4:	00 51 06             	add    %dl,0x6(%rcx)
    12d7:	51                   	push   %rcx
    12d8:	04 00                	add    $0x0,%al
    12da:	00 12                	add    %dl,(%rdx)
    12dc:	50                   	push   %rax
    12dd:	f8                   	clc    
    12de:	00 00                	add    %al,(%rax)
    12e0:	00 52 06             	add    %dl,0x6(%rdx)
    12e3:	7e 09                	jle    12ee <_init-0x3ff3c2>
    12e5:	00 00                	add    %al,(%rax)
    12e7:	12 52 f8             	adc    -0x8(%rdx),%dl
    12ea:	00 00                	add    %al,(%rax)
    12ec:	00 53 06             	add    %dl,0x6(%rbx)
    12ef:	09 02                	or     %eax,(%rdx)
    12f1:	00 00                	add    %al,(%rax)
    12f3:	12 54 f8 00          	adc    0x0(%rax,%rdi,8),%dl
    12f7:	00 00                	add    %al,(%rax)
    12f9:	54                   	push   %rsp
    12fa:	06                   	(bad)  
    12fb:	59                   	pop    %rcx
    12fc:	05 00 00 12 56       	add    $0x56120000,%eax
    1301:	f8                   	clc    
    1302:	00 00                	add    %al,(%rax)
    1304:	00 55 06             	add    %dl,0x6(%rbp)
    1307:	76 0b                	jbe    1314 <_init-0x3ff39c>
    1309:	00 00                	add    %al,(%rax)
    130b:	12 5d f8             	adc    -0x8(%rbp),%bl
    130e:	00 00                	add    %al,(%rax)
    1310:	00 56 06             	add    %dl,0x6(%rsi)
    1313:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1314:	03 00                	add    (%rax),%eax
    1316:	00 12                	add    %dl,(%rdx)
    1318:	5e                   	pop    %rsi
    1319:	f8                   	clc    
    131a:	00 00                	add    %al,(%rax)
    131c:	00 57 06             	add    %dl,0x6(%rdi)
    131f:	4d 04 00             	rex.WRB add $0x0,%al
    1322:	00 12                	add    %dl,(%rdx)
    1324:	61                   	(bad)  
    1325:	f8                   	clc    
    1326:	00 00                	add    %al,(%rax)
    1328:	00 58 06             	add    %bl,0x6(%rax)
    132b:	7a 09                	jp     1336 <_init-0x3ff37a>
    132d:	00 00                	add    %al,(%rax)
    132f:	12 63 f8             	adc    -0x8(%rbx),%ah
    1332:	00 00                	add    %al,(%rax)
    1334:	00 59 06             	add    %bl,0x6(%rcx)
    1337:	05 02 00 00 12       	add    $0x12000002,%eax
    133c:	65                   	gs
    133d:	f8                   	clc    
    133e:	00 00                	add    %al,(%rax)
    1340:	00 5a 06             	add    %bl,0x6(%rdx)
    1343:	55                   	push   %rbp
    1344:	05 00 00 12 67       	add    $0x67120000,%eax
    1349:	f8                   	clc    
    134a:	00 00                	add    %al,(%rax)
    134c:	00 5b 06             	add    %bl,0x6(%rbx)
    134f:	72 0b                	jb     135c <_init-0x3ff354>
    1351:	00 00                	add    %al,(%rax)
    1353:	12 6e f8             	adc    -0x8(%rsi),%ch
    1356:	00 00                	add    %al,(%rax)
    1358:	00 5c 06 a2          	add    %bl,-0x5e(%rsi,%rax,1)
    135c:	03 00                	add    (%rax),%eax
    135e:	00 12                	add    %dl,(%rdx)
    1360:	6f                   	outsl  %ds:(%rsi),(%dx)
    1361:	f8                   	clc    
    1362:	00 00                	add    %al,(%rax)
    1364:	00 5d 00             	add    %bl,0x0(%rbp)
    1367:	2e                   	cs
    1368:	5e                   	pop    %rsi
    1369:	0a 00                	or     (%rax),%al
    136b:	00 12                	add    %dl,(%rdx)
    136d:	7c d3                	jl     1342 <_init-0x3ff36e>
    136f:	0b 00                	or     (%rax),%eax
    1371:	00 81 13 00 00 16    	add    %al,0x16000013(%rcx)
    1377:	ff 00                	incl   (%rax)
    1379:	00 00                	add    %al,(%rax)
    137b:	16                   	(bad)  
    137c:	28 01                	sub    %al,(%rcx)
    137e:	00 00                	add    %al,(%rax)
    1380:	00 35 bd 00 00 00    	add    %dh,0xbd(%rip)        # 1443 <_init-0x3ff26d>
    1386:	12 7f 8c             	adc    -0x74(%rdi),%bh
    1389:	13 00                	adc    (%rax),%eax
    138b:	00 10                	add    %dl,(%rax)
    138d:	08 3a                	or     %bh,(%rdx)
    138f:	12 00                	adc    (%rax),%al
    1391:	00 03                	add    %al,(%rbx)
    1393:	ad                   	lods   %ds:(%rsi),%eax
    1394:	0c 00                	or     $0x0,%al
    1396:	00 13                	add    %dl,(%rbx)
    1398:	28 ff                	sub    %bh,%bh
    139a:	00 00                	add    %al,(%rax)
    139c:	00 03                	add    %al,(%rbx)
    139e:	f9                   	stc    
    139f:	07                   	(bad)  
    13a0:	00 00                	add    %al,(%rax)
    13a2:	14 20                	adc    $0x20,%al
    13a4:	ff 00                	incl   (%rax)
    13a6:	00 00                	add    %al,(%rax)
    13a8:	0f 21                	(bad)  
    13aa:	12 00                	adc    (%rax),%al
    13ac:	00 0f                	add    %cl,(%rdi)
    13ae:	91                   	xchg   %eax,%ecx
    13af:	00 00                	add    %al,(%rax)
    13b1:	00 10                	add    %dl,(%rax)
    13b3:	08 46 06             	or     %al,0x6(%rsi)
    13b6:	00 00                	add    %al,(%rax)
    13b8:	03 93 02 00 00 15    	add    0x15000002(%rbx),%edx
    13be:	34 91                	xor    $0x91,%al
    13c0:	00 00                	add    %al,(%rax)
    13c2:	00 03                	add    %al,(%rbx)
    13c4:	27                   	(bad)  
    13c5:	04 00                	add    $0x0,%al
    13c7:	00 15 ba ce 13 00    	add    %dl,0x13ceba(%rip)        # 13e287 <_init-0x2c2429>
    13cd:	00 10                	add    %dl,(%rax)
    13cf:	08 d4                	or     %dl,%ah
    13d1:	13 00                	adc    (%rax),%eax
    13d3:	00 0f                	add    %cl,(%rdi)
    13d5:	92                   	xchg   %eax,%edx
    13d6:	13 00                	adc    (%rax),%eax
    13d8:	00 2e                	add    %ch,(%rsi)
    13da:	bf 0c 00 00 15       	mov    $0x1500000c,%edi
    13df:	af                   	scas   %es:(%rdi),%eax
    13e0:	ff 00                	incl   (%rax)
    13e2:	00 00                	add    %al,(%rax)
    13e4:	f3 13 00             	repz adc (%rax),%eax
    13e7:	00 16                	add    %dl,(%rsi)
    13e9:	98                   	cwtl   
    13ea:	00 00                	add    %al,(%rax)
    13ec:	00 16                	add    %dl,(%rsi)
    13ee:	b8 13 00 00 00       	mov    $0x13,%eax
    13f3:	2e                   	cs
    13f4:	17                   	(bad)  
    13f5:	02 00                	add    (%rax),%al
    13f7:	00 15 dd 98 00 00    	add    %dl,0x98dd(%rip)        # acda <_init-0x3f59d6>
    13fd:	00 0d 14 00 00 16    	add    %cl,0x16000014(%rip)        # 16001417 <_end+0x15a0023f>
    1403:	98                   	cwtl   
    1404:	00 00                	add    %al,(%rax)
    1406:	00 16                	add    %dl,(%rsi)
    1408:	c3                   	retq   
    1409:	13 00                	adc    (%rax),%eax
    140b:	00 00                	add    %al,(%rax)
    140d:	2e 19 02             	sbb    %eax,%cs:(%rdx)
    1410:	00 00                	add    %al,(%rax)
    1412:	15 da c3 13 00       	adc    $0x13c3da,%eax
    1417:	00 22                	add    %ah,(%rdx)
    1419:	14 00                	adc    $0x0,%al
    141b:	00 16                	add    %dl,(%rsi)
    141d:	28 01                	sub    %al,(%rcx)
    141f:	00 00                	add    %al,(%rax)
    1421:	00 2e                	add    %ch,(%rsi)
    1423:	c1 0c 00 00          	rorl   $0x0,(%rax,%rax,1)
    1427:	15 ab b8 13 00       	adc    $0x13b8ab,%eax
    142c:	00 37                	add    %dh,(%rdi)
    142e:	14 00                	adc    $0x0,%al
    1430:	00 16                	add    %dl,(%rsi)
    1432:	28 01                	sub    %al,(%rcx)
    1434:	00 00                	add    %al,(%rax)
    1436:	00 0f                	add    %cl,(%rdi)
    1438:	fb                   	sti    
    1439:	11 00                	adc    %eax,(%rax)
    143b:	00 0f                	add    %cl,(%rdi)
    143d:	5e                   	pop    %rsi
    143e:	0e                   	(bad)  
    143f:	00 00                	add    %al,(%rax)
    1441:	33 01                	xor    (%rcx),%eax
    1443:	02 33                	add    (%rbx),%dh
    1445:	01 00                	add    %eax,(%rax)
    1447:	00 36                	add    %dh,(%rsi)
    1449:	95                   	xchg   %eax,%ebp
    144a:	03 00                	add    (%rax),%eax
    144c:	00 10                	add    %dl,(%rax)
    144e:	01 04 48             	add    %eax,(%rax,%rcx,2)
    1451:	14 00                	adc    $0x0,%al
    1453:	00 d5                	add    %dl,%ch
    1455:	14 00                	adc    $0x0,%al
    1457:	00 37                	add    %dh,(%rdi)
    1459:	8f 03                	popq   (%rbx)
    145b:	00 00                	add    %al,(%rax)
    145d:	e0 14                	loopne 1473 <_init-0x3ff23d>
    145f:	00 00                	add    %al,(%rax)
    1461:	00 01                	add    %al,(%rcx)
    1463:	38 6e 00             	cmp    %ch,0x0(%rsi)
    1466:	01 0a                	add    %ecx,(%rdx)
    1468:	ff 00                	incl   (%rax)
    146a:	00 00                	add    %al,(%rax)
    146c:	08 39                	or     %bh,(%rcx)
    146e:	95                   	xchg   %eax,%ebp
    146f:	03 00                	add    (%rax),%eax
    1471:	00 01                	add    %al,(%rcx)
    1473:	7b 14                	jnp    1489 <_init-0x3ff227>
    1475:	00 00                	add    %al,(%rax)
    1477:	86 14 00             	xchg   %dl,(%rax,%rax,1)
    147a:	00 22                	add    %ah,(%rdx)
    147c:	f0 14 00             	lock adc $0x0,%al
    147f:	00 16                	add    %dl,(%rsi)
    1481:	f6 14 00             	notb   (%rax,%rax,1)
    1484:	00 00                	add    %al,(%rax)
    1486:	3a 95 03 00 00 01    	cmp    0x1000003(%rbp),%dl
    148c:	06                   	(bad)  
    148d:	01 96 14 00 00 9c    	add    %edx,-0x63ffffec(%rsi)
    1493:	14 00                	adc    $0x0,%al
    1495:	00 22                	add    %ah,(%rdx)
    1497:	f0 14 00             	lock adc $0x0,%al
    149a:	00 00                	add    %al,(%rax)
    149c:	3b 91 01 00 00 01    	cmp    0x1000001(%rcx),%edx
    14a2:	07                   	(bad)  
    14a3:	9f                   	lahf   
    14a4:	00 00                	add    %al,(%rax)
    14a6:	00 01                	add    %al,(%rcx)
    14a8:	02 10                	add    (%rax),%dl
    14aa:	00 48 14             	add    %cl,0x14(%rax)
    14ad:	00 00                	add    %al,(%rax)
    14af:	01 b8 14 00 00 be    	add    %edi,-0x41ffffec(%rax)
    14b5:	14 00                	adc    $0x0,%al
    14b7:	00 22                	add    %ah,(%rdx)
    14b9:	f0 14 00             	lock adc $0x0,%al
    14bc:	00 00                	add    %al,(%rax)
    14be:	3c 62                	cmp    $0x62,%al
    14c0:	07                   	(bad)  
    14c1:	00 00                	add    %al,(%rax)
    14c3:	01 08                	add    %ecx,(%rax)
    14c5:	ae                   	scas   %es:(%rdi),%al
    14c6:	08 00                	or     %al,(%rax)
    14c8:	00 01                	add    %al,(%rcx)
    14ca:	ce                   	(bad)  
    14cb:	14 00                	adc    $0x0,%al
    14cd:	00 22                	add    %ah,(%rdx)
    14cf:	f0 14 00             	lock adc $0x0,%al
    14d2:	00 00                	add    %al,(%rax)
    14d4:	00 3d ff 00 00 00    	add    %bh,0xff(%rip)        # 15d9 <_init-0x3ff0d7>
    14da:	e0 14                	loopne 14f0 <_init-0x3ff1c0>
    14dc:	00 00                	add    %al,(%rax)
    14de:	2c 00                	sub    $0x0,%al
    14e0:	10 08                	adc    %cl,(%rax)
    14e2:	e6 14                	out    %al,$0x14
    14e4:	00 00                	add    %al,(%rax)
    14e6:	3e                   	ds
    14e7:	08 c8                	or     %cl,%al
    14e9:	00 00                	add    %al,(%rax)
    14eb:	00 d5                	add    %dl,%ch
    14ed:	14 00                	adc    $0x0,%al
    14ef:	00 10                	add    %dl,(%rax)
    14f1:	08 48 14             	or     %cl,0x14(%rax)
    14f4:	00 00                	add    %al,(%rax)
    14f6:	34 08                	xor    $0x8,%al
    14f8:	fc                   	cld    
    14f9:	14 00                	adc    $0x0,%al
    14fb:	00 0f                	add    %cl,(%rdi)
    14fd:	48 14 00             	rex.W adc $0x0,%al
    1500:	00 3f                	add    %bh,(%rdi)
    1502:	86 14 00             	xchg   %dl,(%rax,%rax,1)
    1505:	00 02                	add    %al,(%rdx)
    1507:	0f 15 00             	unpckhps (%rax),%xmm0
    150a:	00 19                	add    %bl,(%rcx)
    150c:	15 00 00 40 9b       	adc    $0x9b400000,%eax
    1511:	05 00 00 19 15       	add    $0x15190000,%eax
    1516:	00 00                	add    %al,(%rax)
    1518:	00 0f                	add    %cl,(%rdi)
    151a:	f0 14 00             	lock adc $0x0,%al
    151d:	00 41 01             	add    %al,0x1(%rcx)
    1520:	15 00 00 25 03       	adc    $0x3250000,%eax
    1525:	00 00                	add    %al,(%rax)
    1527:	f8                   	clc    
    1528:	08 40 00             	or     %al,0x0(%rax)
    152b:	00 00                	add    %al,(%rax)
    152d:	00 00                	add    %al,(%rax)
    152f:	20 00                	and    %al,(%rax)
    1531:	00 00                	add    %al,(%rax)
    1533:	00 00                	add    %al,(%rax)
    1535:	00 00                	add    %al,(%rax)
    1537:	01 9c 41 15 00 00 4a 	add    %ebx,0x4a000015(%rcx,%rax,2)
    153e:	15 00 00 42 0f       	adc    $0xf420000,%eax
    1543:	15 00 00 02 91       	adc    $0x91020000,%eax
    1548:	68 00 43 9c 14       	pushq  $0x149c4300
    154d:	00 00                	add    %al,(%rax)
    154f:	18 09                	sbb    %cl,(%rcx)
    1551:	40 00 00             	add    %al,(%rax)
    1554:	00 00                	add    %al,(%rax)
    1556:	00 1d 00 00 00 00    	add    %bl,0x0(%rip)        # 155c <_init-0x3ff154>
    155c:	00 00                	add    %al,(%rax)
    155e:	00 01                	add    %al,(%rcx)
    1560:	9c                   	pushfq 
    1561:	69 15 00 00 76 15 00 	imul   $0x9b440000,0x15760000(%rip),%edx        # 1576156b <_end+0x15160393>
    1568:	00 44 9b 
    156b:	05 00 00 19 15       	add    $0x15190000,%eax
    1570:	00 00                	add    %al,(%rax)
    1572:	02 91 68 00 43 be    	add    -0x41bcff98(%rcx),%dl
    1578:	14 00                	adc    $0x0,%al
    157a:	00 36                	add    %dh,(%rsi)
    157c:	09 40 00             	or     %eax,0x0(%rax)
    157f:	00 00                	add    %al,(%rax)
    1581:	00 00                	add    %al,(%rax)
    1583:	1d 00 00 00 00       	sbb    $0x0,%eax
    1588:	00 00                	add    %al,(%rax)
    158a:	00 01                	add    %al,(%rcx)
    158c:	9c                   	pushfq 
    158d:	95                   	xchg   %eax,%ebp
    158e:	15 00 00 a2 15       	adc    $0x15a20000,%eax
    1593:	00 00                	add    %al,(%rax)
    1595:	44                   	rex.R
    1596:	9b                   	fwait
    1597:	05 00 00 19 15       	add    $0x15190000,%eax
    159c:	00 00                	add    %al,(%rax)
    159e:	02 91 68 00 45 0f    	add    0xf450068(%rcx),%dl
    15a4:	00 00                	add    %al,(%rax)
    15a6:	00 01                	add    %al,(%rcx)
    15a8:	0d ff 00 00 00       	or     $0xff,%eax
    15ad:	3d 08 40 00 00       	cmp    $0x4008,%eax
    15b2:	00 00                	add    %al,(%rax)
    15b4:	00 68 00             	add    %ch,0x0(%rax)
    15b7:	00 00                	add    %al,(%rax)
    15b9:	00 00                	add    %al,(%rax)
    15bb:	00 00                	add    %al,(%rax)
    15bd:	01 9c f1 15 00 00 46 	add    %ebx,0x46000015(%rcx,%rsi,8)
    15c4:	46 08 40 00          	rex.RX or %r8b,0x0(%rax)
    15c8:	00 00                	add    %al,(%rax)
    15ca:	00 00                	add    %al,(%rax)
    15cc:	53                   	push   %rbx
    15cd:	00 00                	add    %al,(%rax)
    15cf:	00 00                	add    %al,(%rax)
    15d1:	00 00                	add    %al,(%rax)
    15d3:	00 47 70             	add    %al,0x70(%rdi)
    15d6:	42 00 01             	rex.X add %al,(%rcx)
    15d9:	0f f0                	(bad)  
    15db:	14 00                	adc    $0x0,%al
    15dd:	00 02                	add    %al,(%rdx)
    15df:	91                   	xchg   %eax,%ecx
    15e0:	50                   	push   %rax
    15e1:	47 70 42             	rex.RXB jo 1626 <_init-0x3ff08a>
    15e4:	32 00                	xor    (%rax),%al
    15e6:	01 12                	add    %edx,(%rdx)
    15e8:	f0 14 00             	lock adc $0x0,%al
    15eb:	00 02                	add    %al,(%rdx)
    15ed:	91                   	xchg   %eax,%ecx
    15ee:	58                   	pop    %rax
    15ef:	00 00                	add    %al,(%rax)
    15f1:	48 fd                	rex.W std 
    15f3:	08 00                	or     %al,(%rax)
    15f5:	00 a5 08 40 00 00    	add    %ah,0x4008(%rbp)
    15fb:	00 00                	add    %al,(%rax)
    15fd:	00 3d 00 00 00 00    	add    %bh,0x0(%rip)        # 1603 <_init-0x3ff0ad>
    1603:	00 00                	add    %al,(%rax)
    1605:	00 01                	add    %al,(%rcx)
    1607:	9c                   	pushfq 
    1608:	29 16                	sub    %edx,(%rsi)
    160a:	00 00                	add    %al,(%rax)
    160c:	49                   	rex.WB
    160d:	f2 05 00 00 01 15    	repnz add $0x15010000,%eax
    1613:	ff 00                	incl   (%rax)
    1615:	00 00                	add    %al,(%rax)
    1617:	02 91 6c 49 68 05    	add    0x568496c(%rcx),%dl
    161d:	00 00                	add    %al,(%rax)
    161f:	01 15 ff 00 00 00    	add    %edx,0xff(%rip)        # 1724 <_init-0x3fef8c>
    1625:	02 91 68 00 4a 00    	add    0x4a0068(%rcx),%dl
    162b:	00 00                	add    %al,(%rax)
    162d:	00 e2                	add    %ah,%dl
    162f:	08 40 00             	or     %al,0x0(%rax)
    1632:	00 00                	add    %al,(%rax)
    1634:	00 00                	add    %al,(%rax)
    1636:	15 00 00 00 00       	adc    $0x0,%eax
    163b:	00 00                	add    %al,(%rax)
    163d:	00 01                	add    %al,(%rcx)
    163f:	9c                   	pushfq 
    1640:	4b fb                	rex.WXB sti 
    1642:	0b 00                	or     (%rax),%eax
    1644:	00 84 00 00 00 4c b1 	add    %al,-0x4eb40000(%rax,%rax,1)
    164b:	08 00                	or     %al,(%rax)
    164d:	00 09                	add    %cl,(%rcx)
    164f:	03 d1                	add    %ecx,%edx
    1651:	11 60 00             	adc    %esp,0x0(%rax)
    1654:	00 00                	add    %al,(%rax)
    1656:	00 00                	add    %al,(%rax)
    1658:	4d                   	rex.WRB
    1659:	42 10 00             	rex.X adc %al,(%rax)
    165c:	00 f5                	add    %dh,%ch
    165e:	03 00                	add    (%rax),%eax
    1660:	00 80 80 80 80 78    	add    %al,0x78808080(%rax)
    1666:	4e                   	rex.WRX
    1667:	4d 10 00             	rex.WRB adc %r8b,(%r8)
    166a:	00 6d 00             	add    %ch,0x0(%rbp)
    166d:	00 00                	add    %al,(%rax)
    166f:	ff                   	(bad)  
    1670:	ff                   	(bad)  
    1671:	ff                   	(bad)  
    1672:	7f 4f                	jg     16c3 <_init-0x3fefed>
    1674:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
    1675:	10 00                	adc    %al,(%rax)
    1677:	00 bc 06 00 00 40 4f 	add    %bh,0x4f400000(%rsi,%rax,1)
    167e:	d1 10                	rcll   (%rax)
    1680:	00 00                	add    %al,(%rax)
    1682:	c3                   	retq   
    1683:	09 00                	or     %eax,(%rax)
    1685:	00 7f 4d             	add    %bh,0x4d(%rdi)
    1688:	08 11                	or     %dl,(%rcx)
    168a:	00 00                	add    %al,(%rax)
    168c:	54                   	push   %rsp
    168d:	06                   	(bad)  
    168e:	00 00                	add    %al,(%rax)
    1690:	80 80 7e 50 13 11 00 	addb   $0x0,0x1113507e(%rax)
    1697:	00 dd                	add    %bl,%ch
    1699:	02 00                	add    (%rax),%al
    169b:	00 ff                	add    %bh,%bh
    169d:	7f 4d                	jg     16ec <_init-0x3fefc4>
    169f:	46 11 00             	rex.RX adc %r8d,(%rax)
    16a2:	00 10                	add    %dl,(%rax)
    16a4:	07                   	(bad)  
    16a5:	00 00                	add    %al,(%rax)
    16a7:	80 80 80 80 80 80 80 	addb   $0x80,-0x7f7f7f80(%rax)
    16ae:	80 80 7f 51 51 11 00 	addb   $0x0,0x1151517f(%rax)
    16b5:	00 3a                	add    %bh,(%rdx)
    16b7:	03 00                	add    (%rax),%eax
    16b9:	00 ff                	add    %bh,%bh
    16bb:	ff                   	(bad)  
    16bc:	ff                   	(bad)  
    16bd:	ff                   	(bad)  
    16be:	ff                   	(bad)  
    16bf:	ff                   	(bad)  
    16c0:	ff                   	(bad)  
    16c1:	7f 00                	jg     16c3 <_init-0x3fefed>

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x2ab013e>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    (%rsi),%ecx
   b:	55                   	push   %rbp
   c:	17                   	(bad)  
   d:	11 01                	adc    %eax,(%rcx)
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
  60:	3b 05 49 13 00 00    	cmp    0x1349(%rip),%eax        # 13af <_init-0x3ff301>
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
  ea:	15 2e 01 3f 19       	adc    $0x193f012e,%eax
  ef:	03 0e                	add    (%rsi),%ecx
  f1:	3a 0b                	cmp    (%rbx),%cl
  f3:	3b 0b                	cmp    (%rbx),%ecx
  f5:	6e                   	outsb  %ds:(%rsi),(%dx)
  f6:	0e                   	(bad)  
  f7:	3c 19                	cmp    $0x19,%al
  f9:	01 13                	add    %edx,(%rbx)
  fb:	00 00                	add    %al,(%rax)
  fd:	16                   	(bad)  
  fe:	05 00 49 13 00       	add    $0x134900,%eax
 103:	00 17                	add    %dl,(%rdi)
 105:	2e 01 3f             	add    %edi,%cs:(%rdi)
 108:	19 03                	sbb    %eax,(%rbx)
 10a:	08 3a                	or     %bh,(%rdx)
 10c:	0b 3b                	or     (%rbx),%edi
 10e:	0b 6e 0e             	or     0xe(%rsi),%ebp
 111:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 115:	01 13                	add    %edx,(%rbx)
 117:	00 00                	add    %al,(%rax)
 119:	18 2e                	sbb    %ch,(%rsi)
 11b:	01 3f                	add    %edi,(%rdi)
 11d:	19 03                	sbb    %eax,(%rbx)
 11f:	0e                   	(bad)  
 120:	3a 0b                	cmp    (%rbx),%cl
 122:	3b 0b                	cmp    (%rbx),%ecx
 124:	6e                   	outsb  %ds:(%rsi),(%dx)
 125:	0e                   	(bad)  
 126:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 12a:	01 13                	add    %edx,(%rbx)
 12c:	00 00                	add    %al,(%rax)
 12e:	19 2e                	sbb    %ebp,(%rsi)
 130:	01 3f                	add    %edi,(%rdi)
 132:	19 03                	sbb    %eax,(%rbx)
 134:	0e                   	(bad)  
 135:	3a 0b                	cmp    (%rbx),%cl
 137:	3b 05 6e 0e 49 13    	cmp    0x13490e6e(%rip),%eax        # 13490fab <_end+0x12e8fdd3>
 13d:	3c 19                	cmp    $0x19,%al
 13f:	01 13                	add    %edx,(%rbx)
 141:	00 00                	add    %al,(%rax)
 143:	1a 2e                	sbb    (%rsi),%ch
 145:	00 3f                	add    %bh,(%rdi)
 147:	19 03                	sbb    %eax,(%rbx)
 149:	08 3a                	or     %bh,(%rdx)
 14b:	0b 3b                	or     (%rbx),%edi
 14d:	05 6e 0e 49 13       	add    $0x13490e6e,%eax
 152:	3c 19                	cmp    $0x19,%al
 154:	00 00                	add    %al,(%rax)
 156:	1b 2e                	sbb    (%rsi),%ebp
 158:	01 3f                	add    %edi,(%rdi)
 15a:	19 03                	sbb    %eax,(%rbx)
 15c:	0e                   	(bad)  
 15d:	3a 0b                	cmp    (%rbx),%cl
 15f:	3b 05 6e 0e 49 13    	cmp    0x13490e6e(%rip),%eax        # 13490fd3 <_end+0x12e8fdfb>
 165:	3c 19                	cmp    $0x19,%al
 167:	00 00                	add    %al,(%rax)
 169:	1c 04                	sbb    $0x4,%al
 16b:	01 03                	add    %eax,(%rbx)
 16d:	0e                   	(bad)  
 16e:	0b 0b                	or     (%rbx),%ecx
 170:	3a 0b                	cmp    (%rbx),%cl
 172:	3b 0b                	cmp    (%rbx),%ecx
 174:	01 13                	add    %edx,(%rbx)
 176:	00 00                	add    %al,(%rax)
 178:	1d 28 00 03 0e       	sbb    $0xe030028,%eax
 17d:	1c 0d                	sbb    $0xd,%al
 17f:	00 00                	add    %al,(%rax)
 181:	1e                   	(bad)  
 182:	02 01                	add    (%rcx),%al
 184:	03 0e                	add    (%rsi),%ecx
 186:	3c 19                	cmp    $0x19,%al
 188:	01 13                	add    %edx,(%rbx)
 18a:	00 00                	add    %al,(%rax)
 18c:	1f                   	(bad)  
 18d:	02 01                	add    (%rcx),%al
 18f:	03 0e                	add    (%rsi),%ecx
 191:	0b 0b                	or     (%rbx),%ecx
 193:	3a 0b                	cmp    (%rbx),%cl
 195:	3b 05 32 0b 01 13    	cmp    0x13010b32(%rip),%eax        # 13010ccd <_end+0x12a0faf5>
 19b:	00 00                	add    %al,(%rax)
 19d:	20 0d 00 03 0e 3a    	and    %cl,0x3a0e0300(%rip)        # 3a0e04a3 <_end+0x39adf2cb>
 1a3:	0b 3b                	or     (%rbx),%edi
 1a5:	05 49 13 3f 19       	add    $0x193f1349,%eax
 1aa:	3c 19                	cmp    $0x19,%al
 1ac:	00 00                	add    %al,(%rax)
 1ae:	21 2e                	and    %ebp,(%rsi)
 1b0:	01 3f                	add    %edi,(%rdi)
 1b2:	19 03                	sbb    %eax,(%rbx)
 1b4:	0e                   	(bad)  
 1b5:	3a 0b                	cmp    (%rbx),%cl
 1b7:	3b 05 32 0b 3c 19    	cmp    0x193c0b32(%rip),%eax        # 193c0cef <_end+0x18dbfb17>
 1bd:	64 13 01             	adc    %fs:(%rcx),%eax
 1c0:	13 00                	adc    (%rax),%eax
 1c2:	00 22                	add    %ah,(%rdx)
 1c4:	05 00 49 13 34       	add    $0x34134900,%eax
 1c9:	19 00                	sbb    %eax,(%rax)
 1cb:	00 23                	add    %ah,(%rbx)
 1cd:	2e 01 3f             	add    %edi,%cs:(%rdi)
 1d0:	19 03                	sbb    %eax,(%rbx)
 1d2:	0e                   	(bad)  
 1d3:	3a 0b                	cmp    (%rbx),%cl
 1d5:	3b 05 32 0b 3c 19    	cmp    0x193c0b32(%rip),%eax        # 193c0d0d <_end+0x18dbfb35>
 1db:	64 13 00             	adc    %fs:(%rax),%eax
 1de:	00 24 16             	add    %ah,(%rsi,%rdx,1)
 1e1:	00 03                	add    %al,(%rbx)
 1e3:	0e                   	(bad)  
 1e4:	3a 0b                	cmp    (%rbx),%cl
 1e6:	3b 05 49 13 32 0b    	cmp    0xb321349(%rip),%eax        # b321535 <_end+0xad2035d>
 1ec:	00 00                	add    %al,(%rax)
 1ee:	25 0d 00 03 0e       	and    $0xe03000d,%eax
 1f3:	3a 0b                	cmp    (%rbx),%cl
 1f5:	3b 05 49 13 3f 19    	cmp    0x193f1349(%rip),%eax        # 193f1544 <_end+0x18df036c>
 1fb:	32 0b                	xor    (%rbx),%cl
 1fd:	3c 19                	cmp    $0x19,%al
 1ff:	1c 0b                	sbb    $0xb,%al
 201:	00 00                	add    %al,(%rax)
 203:	26                   	es
 204:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 209:	0b 3b                	or     (%rbx),%edi
 20b:	05 49 13 3f 19       	add    $0x193f1349,%eax
 210:	32 0b                	xor    (%rbx),%cl
 212:	3c 19                	cmp    $0x19,%al
 214:	1c 0b                	sbb    $0xb,%al
 216:	00 00                	add    %al,(%rax)
 218:	27                   	(bad)  
 219:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 21e:	0b 3b                	or     (%rbx),%edi
 220:	05 49 13 3f 19       	add    $0x193f1349,%eax
 225:	32 0b                	xor    (%rbx),%cl
 227:	3c 19                	cmp    $0x19,%al
 229:	1c 05                	sbb    $0x5,%al
 22b:	00 00                	add    %al,(%rax)
 22d:	28 2f                	sub    %ch,(%rdi)
 22f:	00 03                	add    %al,(%rbx)
 231:	0e                   	(bad)  
 232:	49 13 00             	adc    (%r8),%rax
 235:	00 29                	add    %ch,(%rcx)
 237:	34 00                	xor    $0x0,%al
 239:	03 0e                	add    (%rsi),%ecx
 23b:	3a 0b                	cmp    (%rbx),%cl
 23d:	3b 0b                	cmp    (%rbx),%ecx
 23f:	6e                   	outsb  %ds:(%rsi),(%dx)
 240:	0e                   	(bad)  
 241:	49 13 3f             	adc    (%r15),%rdi
 244:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 247:	00 00                	add    %al,(%rax)
 249:	2a 34 00             	sub    (%rax,%rax,1),%dh
 24c:	03 0e                	add    (%rsi),%ecx
 24e:	3a 0b                	cmp    (%rbx),%cl
 250:	3b 0b                	cmp    (%rbx),%ecx
 252:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 256:	00 00                	add    %al,(%rax)
 258:	2b 2e                	sub    (%rsi),%ebp
 25a:	01 3f                	add    %edi,(%rdi)
 25c:	19 03                	sbb    %eax,(%rbx)
 25e:	0e                   	(bad)  
 25f:	3a 0b                	cmp    (%rbx),%cl
 261:	3b 05 49 13 3c 19    	cmp    0x193c1349(%rip),%eax        # 193c15b0 <_end+0x18dc03d8>
 267:	01 13                	add    %edx,(%rbx)
 269:	00 00                	add    %al,(%rax)
 26b:	2c 18                	sub    $0x18,%al
 26d:	00 00                	add    %al,(%rax)
 26f:	00 2d 2e 00 3f 19    	add    %ch,0x193f002e(%rip)        # 193f02a3 <_end+0x18def0cb>
 275:	03 0e                	add    (%rsi),%ecx
 277:	3a 0b                	cmp    (%rbx),%cl
 279:	3b 05 49 13 3c 19    	cmp    0x193c1349(%rip),%eax        # 193c15c8 <_end+0x18dc03f0>
 27f:	00 00                	add    %al,(%rax)
 281:	2e 2e 01 3f          	cs add %edi,%cs:(%rdi)
 285:	19 03                	sbb    %eax,(%rbx)
 287:	0e                   	(bad)  
 288:	3a 0b                	cmp    (%rbx),%cl
 28a:	3b 0b                	cmp    (%rbx),%ecx
 28c:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 290:	01 13                	add    %edx,(%rbx)
 292:	00 00                	add    %al,(%rax)
 294:	2f                   	(bad)  
 295:	13 01                	adc    (%rcx),%eax
 297:	03 08                	add    (%rax),%ecx
 299:	0b 0b                	or     (%rbx),%ecx
 29b:	3a 0b                	cmp    (%rbx),%cl
 29d:	3b 0b                	cmp    (%rbx),%ecx
 29f:	01 13                	add    %edx,(%rbx)
 2a1:	00 00                	add    %al,(%rax)
 2a3:	30 39                	xor    %bh,(%rcx)
 2a5:	01 03                	add    %eax,(%rbx)
 2a7:	0e                   	(bad)  
 2a8:	3a 0b                	cmp    (%rbx),%cl
 2aa:	3b 0b                	cmp    (%rbx),%ecx
 2ac:	01 13                	add    %edx,(%rbx)
 2ae:	00 00                	add    %al,(%rax)
 2b0:	31 0d 00 03 0e 3a    	xor    %ecx,0x3a0e0300(%rip)        # 3a0e05b6 <_end+0x39adf3de>
 2b6:	0b 3b                	or     (%rbx),%edi
 2b8:	0b 49 13             	or     0x13(%rcx),%ecx
 2bb:	3f                   	(bad)  
 2bc:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 2bf:	00 00                	add    %al,(%rax)
 2c1:	32 13                	xor    (%rbx),%dl
 2c3:	01 03                	add    %eax,(%rbx)
 2c5:	0e                   	(bad)  
 2c6:	0b 0b                	or     (%rbx),%ecx
 2c8:	3a 0b                	cmp    (%rbx),%cl
 2ca:	3b 0b                	cmp    (%rbx),%ecx
 2cc:	00 00                	add    %al,(%rax)
 2ce:	33 3a                	xor    (%rdx),%edi
 2d0:	00 3a                	add    %bh,(%rdx)
 2d2:	0b 3b                	or     (%rbx),%edi
 2d4:	0b 18                	or     (%rax),%ebx
 2d6:	13 00                	adc    (%rax),%eax
 2d8:	00 34 10             	add    %dh,(%rax,%rdx,1)
 2db:	00 0b                	add    %cl,(%rbx)
 2dd:	0b 49 13             	or     0x13(%rcx),%ecx
 2e0:	00 00                	add    %al,(%rax)
 2e2:	35 2e 00 3f 19       	xor    $0x193f002e,%eax
 2e7:	03 0e                	add    (%rsi),%ecx
 2e9:	3a 0b                	cmp    (%rbx),%cl
 2eb:	3b 0b                	cmp    (%rbx),%ecx
 2ed:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 2f1:	00 00                	add    %al,(%rax)
 2f3:	36 02 01             	add    %ss:(%rcx),%al
 2f6:	03 0e                	add    (%rsi),%ecx
 2f8:	0b 0b                	or     (%rbx),%ecx
 2fa:	3a 0b                	cmp    (%rbx),%cl
 2fc:	3b 0b                	cmp    (%rbx),%ecx
 2fe:	1d 13 01 13 00       	sbb    $0x130113,%eax
 303:	00 37                	add    %dh,(%rdi)
 305:	0d 00 03 0e 49       	or     $0x490e0300,%eax
 30a:	13 38                	adc    (%rax),%edi
 30c:	0b 34 19             	or     (%rcx,%rbx,1),%esi
 30f:	32 0b                	xor    (%rbx),%cl
 311:	00 00                	add    %al,(%rax)
 313:	38 0d 00 03 08 3a    	cmp    %cl,0x3a080300(%rip)        # 3a080619 <_end+0x39a7f441>
 319:	0b 3b                	or     (%rbx),%edi
 31b:	0b 49 13             	or     0x13(%rcx),%ecx
 31e:	38 0b                	cmp    %cl,(%rbx)
 320:	00 00                	add    %al,(%rax)
 322:	39 2e                	cmp    %ebp,(%rsi)
 324:	01 3f                	add    %edi,(%rdi)
 326:	19 03                	sbb    %eax,(%rbx)
 328:	0e                   	(bad)  
 329:	34 19                	xor    $0x19,%al
 32b:	32 0b                	xor    (%rbx),%cl
 32d:	3c 19                	cmp    $0x19,%al
 32f:	64 13 01             	adc    %fs:(%rcx),%eax
 332:	13 00                	adc    (%rax),%eax
 334:	00 3a                	add    %bh,(%rdx)
 336:	2e 01 3f             	add    %edi,%cs:(%rdi)
 339:	19 03                	sbb    %eax,(%rbx)
 33b:	0e                   	(bad)  
 33c:	3a 0b                	cmp    (%rbx),%cl
 33e:	3b 0b                	cmp    (%rbx),%ecx
 340:	32 0b                	xor    (%rbx),%cl
 342:	3c 19                	cmp    $0x19,%al
 344:	64 13 01             	adc    %fs:(%rcx),%eax
 347:	13 00                	adc    (%rax),%eax
 349:	00 3b                	add    %bh,(%rbx)
 34b:	2e 01 3f             	add    %edi,%cs:(%rdi)
 34e:	19 03                	sbb    %eax,(%rbx)
 350:	0e                   	(bad)  
 351:	3a 0b                	cmp    (%rbx),%cl
 353:	3b 0b                	cmp    (%rbx),%ecx
 355:	6e                   	outsb  %ds:(%rsi),(%dx)
 356:	0e                   	(bad)  
 357:	4c 0b 4d 18          	or     0x18(%rbp),%r9
 35b:	1d 13 32 0b 3c       	sbb    $0x3c0b3213,%eax
 360:	19 64 13 01          	sbb    %esp,0x1(%rbx,%rdx,1)
 364:	13 00                	adc    (%rax),%eax
 366:	00 3c 2e             	add    %bh,(%rsi,%rbp,1)
 369:	01 3f                	add    %edi,(%rdi)
 36b:	19 03                	sbb    %eax,(%rbx)
 36d:	0e                   	(bad)  
 36e:	3a 0b                	cmp    (%rbx),%cl
 370:	3b 0b                	cmp    (%rbx),%ecx
 372:	6e                   	outsb  %ds:(%rsi),(%dx)
 373:	0e                   	(bad)  
 374:	32 0b                	xor    (%rbx),%cl
 376:	3c 19                	cmp    $0x19,%al
 378:	64 13 00             	adc    %fs:(%rax),%eax
 37b:	00 3d 15 01 49 13    	add    %bh,0x13490115(%rip)        # 13490496 <_end+0x12e8f2be>
 381:	01 13                	add    %edx,(%rbx)
 383:	00 00                	add    %al,(%rax)
 385:	3e 0f 00 0b          	str    %ds:(%rbx)
 389:	0b 03                	or     (%rbx),%eax
 38b:	0e                   	(bad)  
 38c:	49 13 00             	adc    (%r8),%rax
 38f:	00 3f                	add    %bh,(%rdi)
 391:	2e 01 47 13          	add    %eax,%cs:0x13(%rdi)
 395:	20 0b                	and    %cl,(%rbx)
 397:	64 13 01             	adc    %fs:(%rcx),%eax
 39a:	13 00                	adc    (%rax),%eax
 39c:	00 40 05             	add    %al,0x5(%rax)
 39f:	00 03                	add    %al,(%rbx)
 3a1:	0e                   	(bad)  
 3a2:	49 13 34 19          	adc    (%r9,%rbx,1),%rsi
 3a6:	00 00                	add    %al,(%rax)
 3a8:	41                   	rex.B
 3a9:	2e 01 31             	add    %esi,%cs:(%rcx)
 3ac:	13 6e 0e             	adc    0xe(%rsi),%ebp
 3af:	11 01                	adc    %eax,(%rcx)
 3b1:	12 07                	adc    (%rdi),%al
 3b3:	40 18 64 13 97       	sbb    %spl,-0x69(%rbx,%rdx,1)
 3b8:	42 19 01             	rex.X sbb %eax,(%rcx)
 3bb:	13 00                	adc    (%rax),%eax
 3bd:	00 42 05             	add    %al,0x5(%rdx)
 3c0:	00 31                	add    %dh,(%rcx)
 3c2:	13 02                	adc    (%rdx),%eax
 3c4:	18 00                	sbb    %al,(%rax)
 3c6:	00 43 2e             	add    %al,0x2e(%rbx)
 3c9:	01 47 13             	add    %eax,0x13(%rdi)
 3cc:	11 01                	adc    %eax,(%rcx)
 3ce:	12 07                	adc    (%rdi),%al
 3d0:	40 18 64 13 96       	sbb    %spl,-0x6a(%rbx,%rdx,1)
 3d5:	42 19 01             	rex.X sbb %eax,(%rcx)
 3d8:	13 00                	adc    (%rax),%eax
 3da:	00 44 05 00          	add    %al,0x0(%rbp,%rax,1)
 3de:	03 0e                	add    (%rsi),%ecx
 3e0:	49 13 34 19          	adc    (%r9,%rbx,1),%rsi
 3e4:	02 18                	add    (%rax),%bl
 3e6:	00 00                	add    %al,(%rax)
 3e8:	45                   	rex.RB
 3e9:	2e 01 3f             	add    %edi,%cs:(%rdi)
 3ec:	19 03                	sbb    %eax,(%rbx)
 3ee:	0e                   	(bad)  
 3ef:	3a 0b                	cmp    (%rbx),%cl
 3f1:	3b 0b                	cmp    (%rbx),%ecx
 3f3:	49 13 11             	adc    (%r9),%rdx
 3f6:	01 12                	add    %edx,(%rdx)
 3f8:	07                   	(bad)  
 3f9:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 400:	00 00                	add    %al,(%rax)
 402:	46 0b 01             	rex.RX or (%rcx),%r8d
 405:	11 01                	adc    %eax,(%rcx)
 407:	12 07                	adc    (%rdi),%al
 409:	00 00                	add    %al,(%rax)
 40b:	47 34 00             	rex.RXB xor $0x0,%al
 40e:	03 08                	add    (%rax),%ecx
 410:	3a 0b                	cmp    (%rbx),%cl
 412:	3b 0b                	cmp    (%rbx),%ecx
 414:	49 13 02             	adc    (%r10),%rax
 417:	18 00                	sbb    %al,(%rax)
 419:	00 48 2e             	add    %cl,0x2e(%rax)
 41c:	01 03                	add    %eax,(%rbx)
 41e:	0e                   	(bad)  
 41f:	34 19                	xor    $0x19,%al
 421:	11 01                	adc    %eax,(%rcx)
 423:	12 07                	adc    (%rdi),%al
 425:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 42c:	00 00                	add    %al,(%rax)
 42e:	49 05 00 03 0e 3a    	rex.WB add $0x3a0e0300,%rax
 434:	0b 3b                	or     (%rbx),%edi
 436:	0b 49 13             	or     0x13(%rcx),%ecx
 439:	02 18                	add    (%rax),%bl
 43b:	00 00                	add    %al,(%rax)
 43d:	4a                   	rex.WX
 43e:	2e 00 03             	add    %al,%cs:(%rbx)
 441:	0e                   	(bad)  
 442:	34 19                	xor    $0x19,%al
 444:	11 01                	adc    %eax,(%rcx)
 446:	12 07                	adc    (%rdi),%al
 448:	40 18 96 42 19 00 00 	sbb    %dl,0x1942(%rsi)
 44f:	4b 34 00             	rex.WXB xor $0x0,%al
 452:	03 0e                	add    (%rsi),%ecx
 454:	49 13 3f             	adc    (%r15),%rdi
 457:	19 34 19             	sbb    %esi,(%rcx,%rbx,1)
 45a:	3c 19                	cmp    $0x19,%al
 45c:	00 00                	add    %al,(%rax)
 45e:	4c 34 00             	rex.WR xor $0x0,%al
 461:	47 13 02             	rex.RXB adc (%r10),%r8d
 464:	18 00                	sbb    %al,(%rax)
 466:	00 4d 34             	add    %cl,0x34(%rbp)
 469:	00 47 13             	add    %al,0x13(%rdi)
 46c:	6e                   	outsb  %ds:(%rsi),(%dx)
 46d:	0e                   	(bad)  
 46e:	1c 0d                	sbb    $0xd,%al
 470:	00 00                	add    %al,(%rax)
 472:	4e 34 00             	rex.WRX xor $0x0,%al
 475:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 479:	1c 06                	sbb    $0x6,%al
 47b:	00 00                	add    %al,(%rax)
 47d:	4f 34 00             	rex.WRXB xor $0x0,%al
 480:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 484:	1c 0b                	sbb    $0xb,%al
 486:	00 00                	add    %al,(%rax)
 488:	50                   	push   %rax
 489:	34 00                	xor    $0x0,%al
 48b:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 48f:	1c 05                	sbb    $0x5,%al
 491:	00 00                	add    %al,(%rax)
 493:	51                   	push   %rcx
 494:	34 00                	xor    $0x0,%al
 496:	47 13 6e 0e          	rex.RXB adc 0xe(%r14),%r13d
 49a:	1c 07                	sbb    $0x7,%al
 49c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	7d 02                	jge    4 <_init-0x4006ac>
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	12 02                	adc    (%rdx),%al
   8:	00 00                	add    %al,(%rax)
   a:	01 01                	add    %eax,(%rcx)
   c:	fb                   	sti    
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	01 00                	add    %eax,(%rax)
  19:	00 01                	add    %al,(%rcx)
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <_init-0x40061f>
  1e:	72 2f                	jb     4f <_init-0x400661>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  27:	2f                   	(bad)  
  28:	63 2b                	movslq (%rbx),%ebp
  2a:	2b 2f                	sub    (%rdi),%ebp
  2c:	34 2e                	xor    $0x2e,%al
  2e:	38 00                	cmp    %al,(%rax)
  30:	2f                   	(bad)  
  31:	75 73                	jne    a6 <_init-0x40060a>
  33:	72 2f                	jb     64 <_init-0x40064c>
  35:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  3c:	00 2f                	add    %ch,(%rdi)
  3e:	75 73                	jne    b3 <_init-0x4005fd>
  40:	72 2f                	jb     71 <_init-0x40063f>
  42:	6c                   	insb   (%dx),%es:(%rdi)
  43:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  4a:	78 38                	js     84 <_init-0x40062c>
  4c:	36                   	ss
  4d:	5f                   	pop    %rdi
  4e:	36                   	ss
  4f:	34 2d                	xor    $0x2d,%al
  51:	6c                   	insb   (%dx),%es:(%rdi)
  52:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  59:	75 2f                	jne    8a <_init-0x400626>
  5b:	34 2e                	xor    $0x2e,%al
  5d:	38 2f                	cmp    %ch,(%rdi)
  5f:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  66:	00 2f                	add    %ch,(%rdi)
  68:	75 73                	jne    dd <_init-0x4005d3>
  6a:	72 2f                	jb     9b <_init-0x400615>
  6c:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  73:	2f                   	(bad)  
  74:	63 2b                	movslq (%rbx),%ebp
  76:	2b 2f                	sub    (%rdi),%ebp
  78:	34 2e                	xor    $0x2e,%al
  7a:	38 2f                	cmp    %ch,(%rdi)
  7c:	62                   	(bad)  
  7d:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  84:	72 
  85:	2f                   	(bad)  
  86:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  8d:	2f                   	(bad)  
  8e:	78 38                	js     c8 <_init-0x4005e8>
  90:	36                   	ss
  91:	5f                   	pop    %rdi
  92:	36                   	ss
  93:	34 2d                	xor    $0x2d,%al
  95:	6c                   	insb   (%dx),%es:(%rdi)
  96:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  9d:	75 2f                	jne    ce <_init-0x4005e2>
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
  c2:	78 74                	js     138 <_init-0x400578>
  c4:	00 2f                	add    %ch,(%rdi)
  c6:	75 73                	jne    13b <_init-0x400575>
  c8:	72 2f                	jb     f9 <_init-0x4005b7>
  ca:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  d1:	2f                   	(bad)  
  d2:	63 2b                	movslq (%rbx),%ebp
  d4:	2b 2f                	sub    (%rdi),%ebp
  d6:	34 2e                	xor    $0x2e,%al
  d8:	38 2f                	cmp    %ch,(%rdi)
  da:	64                   	fs
  db:	65                   	gs
  dc:	62                   	(bad)  
  dd:	75 67                	jne    146 <_init-0x40056a>
  df:	00 2f                	add    %ch,(%rdi)
  e1:	75 73                	jne    156 <_init-0x40055a>
  e3:	72 2f                	jb     114 <_init-0x40059c>
  e5:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  ec:	2f                   	(bad)  
  ed:	78 38                	js     127 <_init-0x400589>
  ef:	36                   	ss
  f0:	5f                   	pop    %rdi
  f1:	36                   	ss
  f2:	34 2d                	xor    $0x2d,%al
  f4:	6c                   	insb   (%dx),%es:(%rdi)
  f5:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  fc:	75 2f                	jne    12d <_init-0x400583>
  fe:	62                   	(bad)  
  ff:	69 74 73 00 00 56 69 	imul   $0x72695600,0x0(%rbx,%rsi,2),%esi
 106:	72 
 107:	74 75                	je     17e <_init-0x400532>
 109:	61                   	(bad)  
 10a:	6c                   	insb   (%dx),%es:(%rdi)
 10b:	46 75 6e             	rex.RX jne 17c <_init-0x400534>
 10e:	63 2e                	movslq (%rsi),%ebp
 110:	63 70 70             	movslq 0x70(%rax),%esi
 113:	00 00                	add    %al,(%rax)
 115:	00 00                	add    %al,(%rax)
 117:	69 6f 73 74 72 65 61 	imul   $0x61657274,0x73(%rdi),%ebp
 11e:	6d                   	insl   (%dx),%es:(%rdi)
 11f:	00 01                	add    %al,(%rcx)
 121:	00 00                	add    %al,(%rax)
 123:	3c 62                	cmp    $0x62,%al
 125:	75 69                	jne    190 <_init-0x400520>
 127:	6c                   	insb   (%dx),%es:(%rdi)
 128:	74 2d                	je     157 <_init-0x400559>
 12a:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
 131:	73 74                	jae    1a7 <_init-0x400509>
 133:	64 69 6f 2e 68 00 02 	imul   $0x20068,%fs:0x2e(%rdi),%ebp
 13a:	00 
 13b:	00 73 74             	add    %dh,0x74(%rbx)
 13e:	64                   	fs
 13f:	64                   	fs
 140:	65                   	gs
 141:	66                   	data16
 142:	2e                   	cs
 143:	68 00 03 00 00       	pushq  $0x300
 148:	77 63                	ja     1ad <_init-0x400503>
 14a:	68 61 72 2e 68       	pushq  $0x682e7261
 14f:	00 02                	add    %al,(%rdx)
 151:	00 00                	add    %al,(%rax)
 153:	63 77 63             	movslq 0x63(%rdi),%esi
 156:	68 61 72 00 01       	pushq  $0x1007261
 15b:	00 00                	add    %al,(%rax)
 15d:	63 68 61             	movslq 0x61(%rax),%ebp
 160:	72 5f                	jb     1c1 <_init-0x4004ef>
 162:	74 72                	je     1d6 <_init-0x4004da>
 164:	61                   	(bad)  
 165:	69 74 73 2e 68 00 04 	imul   $0x40068,0x2e(%rbx,%rsi,2),%esi
 16c:	00 
 16d:	00 63 2b             	add    %ah,0x2b(%rbx)
 170:	2b 63 6f             	sub    0x6f(%rbx),%esp
 173:	6e                   	outsb  %ds:(%rsi),(%dx)
 174:	66 69 67 2e 68 00    	imul   $0x68,0x2e(%rdi),%sp
 17a:	05 00 00 63 6c       	add    $0x6c630000,%eax
 17f:	6f                   	outsl  %ds:(%rsi),(%dx)
 180:	63 61 6c             	movslq 0x6c(%rcx),%esp
 183:	65 00 01             	add    %al,%gs:(%rcx)
 186:	00 00                	add    %al,(%rax)
 188:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 18f:	65                   	gs
 190:	2e                   	cs
 191:	68 00 04 00 00       	pushq  $0x400
 196:	63 77 63             	movslq 0x63(%rdi),%esi
 199:	74 79                	je     214 <_init-0x40049c>
 19b:	70 65                	jo     202 <_init-0x4004ae>
 19d:	00 01                	add    %al,(%rcx)
 19f:	00 00                	add    %al,(%rax)
 1a1:	69 6f 73 66 77 64 00 	imul   $0x647766,0x73(%rdi),%ebp
 1a8:	01 00                	add    %eax,(%rax)
 1aa:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
 1ae:	65                   	gs
 1af:	2e                   	cs
 1b0:	68 00 02 00 00       	pushq  $0x200
 1b5:	6e                   	outsb  %ds:(%rsi),(%dx)
 1b6:	65                   	gs
 1b7:	77 5f                	ja     218 <_init-0x400498>
 1b9:	61                   	(bad)  
 1ba:	6c                   	insb   (%dx),%es:(%rdi)
 1bb:	6c                   	insb   (%dx),%es:(%rdi)
 1bc:	6f                   	outsl  %ds:(%rsi),(%dx)
 1bd:	63 61 74             	movslq 0x74(%rcx),%esp
 1c0:	6f                   	outsl  %ds:(%rsi),(%dx)
 1c1:	72 2e                	jb     1f1 <_init-0x4004bf>
 1c3:	68 00 06 00 00       	pushq  $0x600
 1c8:	6e                   	outsb  %ds:(%rsi),(%dx)
 1c9:	75 6d                	jne    238 <_init-0x400478>
 1cb:	65                   	gs
 1cc:	72 69                	jb     237 <_init-0x400479>
 1ce:	63 5f 74             	movslq 0x74(%rdi),%ebx
 1d1:	72 61                	jb     234 <_init-0x40047c>
 1d3:	69 74 73 2e 68 00 06 	imul   $0x60068,0x2e(%rbx,%rsi,2),%esi
 1da:	00 
 1db:	00 64 65 62          	add    %ah,0x62(%rbp,%riz,2)
 1df:	75 67                	jne    248 <_init-0x400468>
 1e1:	2e                   	cs
 1e2:	68 00 07 00 00       	pushq  $0x700
 1e7:	6c                   	insb   (%dx),%es:(%rdi)
 1e8:	6f                   	outsl  %ds:(%rsi),(%dx)
 1e9:	63 61 6c             	movslq 0x6c(%rcx),%esp
 1ec:	65                   	gs
 1ed:	2e                   	cs
 1ee:	68 00 02 00 00       	pushq  $0x200
 1f3:	74 79                	je     26e <_init-0x400442>
 1f5:	70 65                	jo     25c <_init-0x400454>
 1f7:	73 2e                	jae    227 <_init-0x400489>
 1f9:	68 00 08 00 00       	pushq  $0x800
 1fe:	61                   	(bad)  
 1ff:	74 6f                	je     270 <_init-0x400440>
 201:	6d                   	insl   (%dx),%es:(%rdi)
 202:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
 209:	2e                   	cs
 20a:	68 00 05 00 00       	pushq  $0x500
 20f:	77 63                	ja     274 <_init-0x40043c>
 211:	74 79                	je     28c <_init-0x400424>
 213:	70 65                	jo     27a <_init-0x400436>
 215:	2e                   	cs
 216:	68 00 02 00 00       	pushq  $0x200
 21b:	00 00                	add    %al,(%rax)
 21d:	09 02                	or     %eax,(%rdx)
 21f:	f8                   	clc    
 220:	08 40 00             	or     %al,0x0(%rax)
 223:	00 00                	add    %al,(%rax)
 225:	00 00                	add    %al,(%rax)
 227:	17                   	(bad)  
 228:	82                   	(bad)  
 229:	02 18                	add    (%rax),%bl
 22b:	00 01                	add    %al,(%rcx)
 22d:	01 00                	add    %eax,(%rax)
 22f:	09 02                	or     %eax,(%rdx)
 231:	18 09                	sbb    %cl,(%rcx)
 233:	40 00 00             	add    %al,(%rax)
 236:	00 00                	add    %al,(%rax)
 238:	00 18                	add    %bl,(%rax)
 23a:	ba 08 00 01 01       	mov    $0x1010008,%edx
 23f:	00 09                	add    %cl,(%rcx)
 241:	02 36                	add    (%rsi),%dh
 243:	09 40 00             	or     %eax,0x0(%rax)
 246:	00 00                	add    %al,(%rax)
 248:	00 00                	add    %al,(%rax)
 24a:	19 ba 08 00 01 01    	sbb    %edi,0x1010008(%rdx)
 250:	00 09                	add    %cl,(%rcx)
 252:	02 3d 08 40 00 00    	add    0x4008(%rip),%bh        # 4260 <_init-0x3fc450>
 258:	00 00                	add    %al,(%rax)
 25a:	00 03                	add    %al,(%rbx)
 25c:	0d 01 91 08 83       	or     $0x83089101,%eax
 261:	08 30                	or     %dh,(%rax)
 263:	83 bb 08 2f ba d6 00 	cmpl   $0x0,-0x2945d0f8(%rbx)
 26a:	02 04 01             	add    (%rcx,%rax,1),%al
 26d:	06                   	(bad)  
 26e:	66                   	data16
 26f:	04 02                	add    $0x2,%al
 271:	06                   	(bad)  
 272:	03 35 90 04 01 03    	add    0x3010490(%rip),%esi        # 3010708 <_end+0x2a0f530>
 278:	4b 08 c8             	rex.WXB or %cl,%r8b
 27b:	2e 4a 08 00          	rex.WX or %al,%cs:(%rax)
 27f:	01 01                	add    %eax,(%rcx)

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	5f                   	pop    %rdi
   1:	47                   	rex.RXB
   2:	4c                   	rex.WR
   3:	4f                   	rex.WRXB
   4:	42                   	rex.X
   5:	41                   	rex.B
   6:	4c 5f                	rex.WR pop %rdi
   8:	5f                   	pop    %rdi
   9:	73 75                	jae    80 <_init-0x400630>
   b:	62                   	(bad)  
   c:	5f                   	pop    %rdi
   d:	49 5f                	rex.WB pop %r15
   f:	6d                   	insl   (%dx),%es:(%rdi)
  10:	61                   	(bad)  
  11:	69 6e 00 5f 53 5f 65 	imul   $0x655f535f,0x0(%rsi),%ebp
  18:	6e                   	outsb  %ds:(%rsi),(%dx)
  19:	64 00 73 69          	add    %dh,%fs:0x69(%rbx)
  1d:	7a 65                	jp     84 <_init-0x40062c>
  1f:	5f                   	pop    %rdi
  20:	74 00                	je     22 <_init-0x40068e>
  22:	73 69                	jae    8d <_init-0x400623>
  24:	7a 65                	jp     8b <_init-0x400625>
  26:	74 79                	je     a1 <_init-0x40060f>
  28:	70 65                	jo     8f <_init-0x400621>
  2a:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
  2e:	68 6f 75 72 00       	pushq  $0x72756f
  33:	5f                   	pop    %rdi
  34:	5f                   	pop    %rdi
  35:	76 61                	jbe    98 <_init-0x400618>
  37:	6c                   	insb   (%dx),%es:(%rdi)
  38:	75 65                	jne    9f <_init-0x400611>
  3a:	00 5f 53             	add    %bl,0x53(%rdi)
  3d:	5f                   	pop    %rdi
  3e:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
  45:	6e                   	outsb  %ds:(%rsi),(%dx)
  46:	6d                   	insl   (%dx),%es:(%rdi)
  47:	6f                   	outsl  %ds:(%rsi),(%dx)
  48:	64                   	fs
  49:	65                   	gs
  4a:	5f                   	pop    %rdi
  4b:	6d                   	insl   (%dx),%es:(%rdi)
  4c:	69 6e 00 5f 5f 6e 75 	imul   $0x756e5f5f,0x0(%rsi),%ebp
  53:	6d                   	insl   (%dx),%es:(%rdi)
  54:	65                   	gs
  55:	72 69                	jb     c0 <_init-0x4005f0>
  57:	63 5f 74             	movslq 0x74(%rdi),%ebx
  5a:	72 61                	jb     bd <_init-0x4005f3>
  5c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
  63:	65 
  64:	67                   	addr32
  65:	65                   	gs
  66:	72 3c                	jb     a4 <_init-0x40060c>
  68:	69 6e 74 3e 00 5f 5a 	imul   $0x5a5f003e,0x74(%rsi),%ebp
  6f:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
  73:	67 6e                	outsb  %ds:(%esi),(%dx)
  75:	75 5f                	jne    d6 <_init-0x4005da>
  77:	63 78 78             	movslq 0x78(%rax),%edi
  7a:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
  7d:	5f                   	pop    %rdi
  7e:	6e                   	outsb  %ds:(%rsi),(%dx)
  7f:	75 6d                	jne    ee <_init-0x4005c2>
  81:	65                   	gs
  82:	72 69                	jb     ed <_init-0x4005c3>
  84:	63 5f 74             	movslq 0x74(%rdi),%ebx
  87:	72 61                	jb     ea <_init-0x4005c6>
  89:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
  90:	65 
  91:	67                   	addr32
  92:	65                   	gs
  93:	72 49                	jb     de <_init-0x4005d2>
  95:	69 45 35 5f 5f 6d 61 	imul   $0x616d5f5f,0x35(%rbp),%eax
  9c:	78 45                	js     e3 <_init-0x4005cd>
  9e:	00 5f 5a             	add    %bl,0x5a(%rdi)
  a1:	4e 34 42             	rex.WRX xor $0x42,%al
  a4:	61                   	(bad)  
  a5:	73 65                	jae    10c <_init-0x4005a4>
  a7:	34 73                	xor    $0x73,%al
  a9:	68 6f 77 45 76       	pushq  $0x7645776f
  ae:	00 5f 5f             	add    %bl,0x5f(%rdi)
  b1:	6d                   	insl   (%dx),%es:(%rdi)
  b2:	61                   	(bad)  
  b3:	78 00                	js     b5 <_init-0x4005fb>
  b5:	77 63                	ja     11a <_init-0x400596>
  b7:	73 63                	jae    11c <_init-0x400594>
  b9:	73 70                	jae    12b <_init-0x400585>
  bb:	6e                   	outsb  %ds:(%rsi),(%dx)
  bc:	00 6c 6f 63          	add    %ch,0x63(%rdi,%rbp,2)
  c0:	61                   	(bad)  
  c1:	6c                   	insb   (%dx),%es:(%rdi)
  c2:	65 63 6f 6e          	movslq %gs:0x6e(%rdi),%ebp
  c6:	76 00                	jbe    c8 <_init-0x4005e8>
  c8:	5f                   	pop    %rdi
  c9:	5f                   	pop    %rdi
  ca:	76 74                	jbe    140 <_init-0x400570>
  cc:	62                   	(bad)  
  cd:	6c                   	insb   (%dx),%es:(%rdi)
  ce:	5f                   	pop    %rdi
  cf:	70 74                	jo     145 <_init-0x40056b>
  d1:	72 5f                	jb     132 <_init-0x40057e>
  d3:	74 79                	je     14e <_init-0x400562>
  d5:	70 65                	jo     13c <_init-0x400574>
  d7:	00 5f 53             	add    %bl,0x53(%rdi)
  da:	5f                   	pop    %rdi
  db:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
  e2:	66                   	data16
  e3:	6c                   	insb   (%dx),%es:(%rdi)
  e4:	61                   	(bad)  
  e5:	67 73 5f             	addr32 jae 147 <_init-0x400569>
  e8:	6d                   	insl   (%dx),%es:(%rdi)
  e9:	69 6e 00 5f 53 5f 69 	imul   $0x695f535f,0x0(%rsi),%ebp
  f0:	6f                   	outsl  %ds:(%rsi),(%dx)
  f1:	73 5f                	jae    152 <_init-0x40055e>
  f3:	69 6f 73 74 61 74 65 	imul   $0x65746174,0x73(%rdi),%ebp
  fa:	5f                   	pop    %rdi
  fb:	6d                   	insl   (%dx),%es:(%rdi)
  fc:	61                   	(bad)  
  fd:	78 00                	js     ff <_init-0x4005b1>
  ff:	69 6e 74 5f 63 75 72 	imul   $0x7275635f,0x74(%rsi),%ebp
 106:	72 5f                	jb     167 <_init-0x400549>
 108:	73 79                	jae    183 <_init-0x40052d>
 10a:	6d                   	insl   (%dx),%es:(%rdi)
 10b:	62                   	(bad)  
 10c:	6f                   	outsl  %ds:(%rsi),(%dx)
 10d:	6c                   	insb   (%dx),%es:(%rdi)
 10e:	00 77 63             	add    %dh,0x63(%rdi)
 111:	73 63                	jae    176 <_init-0x40053a>
 113:	68 72 00 5f 53       	pushq  $0x535f0072
 118:	5f                   	pop    %rdi
 119:	62                   	(bad)  
 11a:	6f                   	outsl  %ds:(%rsi),(%dx)
 11b:	6f                   	outsl  %ds:(%rsi),(%dx)
 11c:	6c                   	insb   (%dx),%es:(%rdi)
 11d:	61                   	(bad)  
 11e:	6c                   	insb   (%dx),%es:(%rdi)
 11f:	70 68                	jo     189 <_init-0x400527>
 121:	61                   	(bad)  
 122:	00 5f 53             	add    %bl,0x53(%rdi)
 125:	5f                   	pop    %rdi
 126:	62 61 64 62 69       	(bad)  {%k2}
 12b:	74 00                	je     12d <_init-0x400583>
 12d:	6d                   	insl   (%dx),%es:(%rdi)
 12e:	62 72 74 6f 77       	(bad)  {%k7}
 133:	63 00                	movslq (%rax),%eax
 135:	77 63                	ja     19a <_init-0x400516>
 137:	73 78                	jae    1b1 <_init-0x4004ff>
 139:	66                   	data16
 13a:	72 6d                	jb     1a9 <_init-0x400507>
 13c:	00 69 6e             	add    %ch,0x6e(%rcx)
 13f:	74 5f                	je     1a0 <_init-0x400510>
 141:	66                   	data16
 142:	72 61                	jb     1a5 <_init-0x40050b>
 144:	63 5f 64             	movslq 0x64(%rdi),%ebx
 147:	69 67 69 74 73 00 5f 	imul   $0x5f007374,0x69(%rdi),%esp
 14e:	53                   	push   %rbx
 14f:	5f                   	pop    %rdi
 150:	62                   	(bad)  {%k7}
 151:	65 67 00 77 63       	add    %dh,%gs:0x63(%edi)
 156:	73 63                	jae    1bb <_init-0x4004f5>
 158:	6f                   	outsl  %ds:(%rsi),(%dx)
 159:	6c                   	insb   (%dx),%es:(%rdi)
 15a:	6c                   	insb   (%dx),%es:(%rdi)
 15b:	00 5f 5f             	add    %bl,0x5f(%rdi)
 15e:	77 63                	ja     1c3 <_init-0x4004ed>
 160:	68 00 5f 5a 4e       	pushq  $0x4e5a5f00
 165:	53                   	push   %rbx
 166:	74 31                	je     199 <_init-0x400517>
 168:	31 63 68             	xor    %esp,0x68(%rbx)
 16b:	61                   	(bad)  
 16c:	72 5f                	jb     1cd <_init-0x4004e3>
 16e:	74 72                	je     1e2 <_init-0x4004ce>
 170:	61                   	(bad)  
 171:	69 74 73 49 63 45 34 	imul   $0x6d344563,0x49(%rbx,%rsi,2),%esi
 178:	6d 
 179:	6f                   	outsl  %ds:(%rsi),(%dx)
 17a:	76 65                	jbe    1e1 <_init-0x4004cf>
 17c:	45 50                	rex.RB push %r8
 17e:	63 50 4b             	movslq 0x4b(%rax),%edx
 181:	63 6d 00             	movslq 0x0(%rbp),%ebp
 184:	5f                   	pop    %rdi
 185:	53                   	push   %rbx
 186:	5f                   	pop    %rdi
 187:	62 61                	(bad)  {%k7}
 189:	73 65                	jae    1f0 <_init-0x4004c0>
 18b:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%rbp),%sp
 191:	73 68                	jae    1fb <_init-0x4004b5>
 193:	6f                   	outsl  %ds:(%rsi),(%dx)
 194:	77 00                	ja     196 <_init-0x40051a>
 196:	5f                   	pop    %rdi
 197:	5a                   	pop    %rdx
 198:	4e 53                	rex.WRX push %rbx
 19a:	74 31                	je     1cd <_init-0x4004e3>
 19c:	31 63 68             	xor    %esp,0x68(%rbx)
 19f:	61                   	(bad)  
 1a0:	72 5f                	jb     201 <_init-0x4004af>
 1a2:	74 72                	je     216 <_init-0x40049a>
 1a4:	61                   	(bad)  
 1a5:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%rbx,%rsi,2),%esi
 1ac:	31 
 1ad:	74 6f                	je     21e <_init-0x400492>
 1af:	5f                   	pop    %rdi
 1b0:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
 1b7:	65                   	gs
 1b8:	45 52                	rex.RB push %r10
 1ba:	4b 63 00             	rex.WXB movslq (%r8),%rax
 1bd:	6d                   	insl   (%dx),%es:(%rdi)
 1be:	6f                   	outsl  %ds:(%rsi),(%dx)
 1bf:	6e                   	outsb  %ds:(%rsi),(%dx)
 1c0:	5f                   	pop    %rdi
 1c1:	64 65 63 69 6d       	fs movslq %fs:%gs:0x6d(%rcx),%ebp
 1c6:	61                   	(bad)  
 1c7:	6c                   	insb   (%dx),%es:(%rdi)
 1c8:	5f                   	pop    %rdi
 1c9:	70 6f                	jo     23a <_init-0x400476>
 1cb:	69 6e 74 00 5f 5f 6e 	imul   $0x6e5f5f00,0x74(%rsi),%ebp
 1d2:	75 6d                	jne    241 <_init-0x40046f>
 1d4:	65                   	gs
 1d5:	72 69                	jb     240 <_init-0x400470>
 1d7:	63 5f 74             	movslq 0x74(%rdi),%ebx
 1da:	72 61                	jb     23d <_init-0x400473>
 1dc:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 1e3:	65 
 1e4:	67                   	addr32
 1e5:	65                   	gs
 1e6:	72 3c                	jb     224 <_init-0x40048c>
 1e8:	63 68 61             	movslq 0x61(%rax),%ebp
 1eb:	72 3e                	jb     22b <_init-0x400485>
 1ed:	00 76 77             	add    %dh,0x77(%rsi)
 1f0:	70 72                	jo     264 <_init-0x40044c>
 1f2:	69 6e 74 66 00 5f 49 	imul   $0x495f0066,0x74(%rsi),%ebp
 1f9:	6f                   	outsl  %ds:(%rsi),(%dx)
 1fa:	73 5f                	jae    25b <_init-0x400455>
 1fc:	4f 70 65             	rex.WRXB jo 264 <_init-0x40044c>
 1ff:	6e                   	outsb  %ds:(%rsi),(%dx)
 200:	6d                   	insl   (%dx),%es:(%rdi)
 201:	6f                   	outsl  %ds:(%rsi),(%dx)
 202:	64 65 00 69 6e       	fs add %ch,%fs:%gs:0x6e(%rcx)
 207:	74 5f                	je     268 <_init-0x400448>
 209:	6e                   	outsb  %ds:(%rsi),(%dx)
 20a:	5f                   	pop    %rdi
 20b:	63 73 5f             	movslq 0x5f(%rbx),%esi
 20e:	70 72                	jo     282 <_init-0x40042e>
 210:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
 214:	65                   	gs
 215:	73 00                	jae    217 <_init-0x400499>
 217:	74 6f                	je     288 <_init-0x400428>
 219:	77 63                	ja     27e <_init-0x400432>
 21b:	74 72                	je     28f <_init-0x400421>
 21d:	61                   	(bad)  
 21e:	6e                   	outsb  %ds:(%rsi),(%dx)
 21f:	73 00                	jae    221 <_init-0x40048f>
 221:	63 6f 70             	movslq 0x70(%rdi),%ebp
 224:	79 00                	jns    226 <_init-0x40048a>
 226:	5f                   	pop    %rdi
 227:	5f                   	pop    %rdi
 228:	69 6f 69 6e 69 74 00 	imul   $0x74696e,0x69(%rdi),%ebp
 22f:	5f                   	pop    %rdi
 230:	53                   	push   %rbx
 231:	5f                   	pop    %rdi
 232:	73 79                	jae    2ad <_init-0x400403>
 234:	6e                   	outsb  %ds:(%rsi),(%dx)
 235:	63 65 64             	movslq 0x64(%rbp),%esp
 238:	5f                   	pop    %rdi
 239:	77 69                	ja     2a4 <_init-0x40040c>
 23b:	74 68                	je     2a5 <_init-0x40040b>
 23d:	5f                   	pop    %rdi
 23e:	73 74                	jae    2b4 <_init-0x4003fc>
 240:	64 69 6f 00 5f 56 61 	imul   $0x6c61565f,%fs:0x0(%rdi),%ebp
 247:	6c 
 248:	75 65                	jne    2af <_init-0x400401>
 24a:	00 5f 53             	add    %bl,0x53(%rdi)
 24d:	5f                   	pop    %rdi
 24e:	65 6f                	outsl  %gs:(%rsi),(%dx)
 250:	66                   	data16
 251:	62                   	(bad)  {%k7}
 252:	69 74 00 74 6d 5f 79 	imul   $0x64795f6d,0x74(%rax,%rax,1),%esi
 259:	64 
 25a:	61                   	(bad)  
 25b:	79 00                	jns    25d <_init-0x400453>
 25d:	5f                   	pop    %rdi
 25e:	49                   	rex.WB
 25f:	4f 5f                	rex.WRXB pop %r15
 261:	46                   	rex.RX
 262:	49                   	rex.WB
 263:	4c                   	rex.WR
 264:	45 00 62 61          	add    %r12b,0x61(%r10)
 268:	73 69                	jae    2d3 <_init-0x4003dd>
 26a:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
 26d:	73 74                	jae    2e3 <_init-0x4003cd>
 26f:	72 65                	jb     2d6 <_init-0x4003da>
 271:	61                   	(bad)  
 272:	6d                   	insl   (%dx),%es:(%rdi)
 273:	3c 63                	cmp    $0x63,%al
 275:	68 61 72 2c 20       	pushq  $0x202c7261
 27a:	73 74                	jae    2f0 <_init-0x4003c0>
 27c:	64 3a 3a             	cmp    %fs:(%rdx),%bh
 27f:	63 68 61             	movslq 0x61(%rax),%ebp
 282:	72 5f                	jb     2e3 <_init-0x4003cd>
 284:	74 72                	je     2f8 <_init-0x4003b8>
 286:	61                   	(bad)  
 287:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%rbx,%rsi,2),%esi
 28e:	72 
 28f:	3e 20 3e             	and    %bh,%ds:(%rsi)
 292:	00 77 63             	add    %dh,0x63(%rdi)
 295:	74 79                	je     310 <_init-0x4003a0>
 297:	70 65                	jo     2fe <_init-0x4003b2>
 299:	5f                   	pop    %rdi
 29a:	74 00                	je     29c <_init-0x400414>
 29c:	66                   	data16
 29d:	67                   	addr32
 29e:	65                   	gs
 29f:	74 77                	je     318 <_init-0x400398>
 2a1:	63 00                	movslq (%rax),%eax
 2a3:	67                   	addr32
 2a4:	65                   	gs
 2a5:	74 77                	je     31e <_init-0x400392>
 2a7:	63 68 61             	movslq 0x61(%rax),%ebp
 2aa:	72 00                	jb     2ac <_init-0x400404>
 2ac:	66                   	data16
 2ad:	67                   	addr32
 2ae:	65                   	gs
 2af:	74 77                	je     328 <_init-0x400388>
 2b1:	73 00                	jae    2b3 <_init-0x4003fd>
 2b3:	5f                   	pop    %rdi
 2b4:	53                   	push   %rbx
 2b5:	5f                   	pop    %rdi
 2b6:	72 69                	jb     321 <_init-0x40038f>
 2b8:	67 68 74 00 75 6e    	addr32 pushq $0x6e750074
 2be:	73 69                	jae    329 <_init-0x400387>
 2c0:	67 6e                	outsb  %ds:(%esi),(%dx)
 2c2:	65 64 20 63 68       	gs and %ah,%fs:%gs:0x68(%rbx)
 2c7:	61                   	(bad)  
 2c8:	72 00                	jb     2ca <_init-0x4003e6>
 2ca:	77 6d                	ja     339 <_init-0x400377>
 2cc:	65                   	gs
 2cd:	6d                   	insl   (%dx),%es:(%rdi)
 2ce:	63 68 72             	movslq 0x72(%rax),%ebp
 2d1:	00 5f 53             	add    %bl,0x53(%rdi)
 2d4:	5f                   	pop    %rdi
 2d5:	67 6f                	outsl  %ds:(%esi),(%dx)
 2d7:	6f                   	outsl  %ds:(%rsi),(%dx)
 2d8:	64                   	fs
 2d9:	62                   	(bad)  {%k7}
 2da:	69 74 00 5f 5a 4e 39 	imul   $0x5f394e5a,0x5f(%rax,%rax,1),%esi
 2e1:	5f 
 2e2:	5f                   	pop    %rdi
 2e3:	67 6e                	outsb  %ds:(%esi),(%dx)
 2e5:	75 5f                	jne    346 <_init-0x40036a>
 2e7:	63 78 78             	movslq 0x78(%rax),%edi
 2ea:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 2ed:	5f                   	pop    %rdi
 2ee:	6e                   	outsb  %ds:(%rsi),(%dx)
 2ef:	75 6d                	jne    35e <_init-0x400352>
 2f1:	65                   	gs
 2f2:	72 69                	jb     35d <_init-0x400353>
 2f4:	63 5f 74             	movslq 0x74(%rdi),%ebx
 2f7:	72 61                	jb     35a <_init-0x400356>
 2f9:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 300:	65 
 301:	67                   	addr32
 302:	65                   	gs
 303:	72 49                	jb     34e <_init-0x400362>
 305:	73 45                	jae    34c <_init-0x400364>
 307:	35 5f 5f 6d 61       	xor    $0x616d5f5f,%eax
 30c:	78 45                	js     353 <_init-0x40035d>
 30e:	00 5f 53             	add    %bl,0x53(%rdi)
 311:	5f                   	pop    %rdi
 312:	62                   	(bad)  {%k7}
 313:	69 6e 00 77 63 73 63 	imul   $0x63736377,0x0(%rsi),%ebp
 31a:	6d                   	insl   (%dx),%es:(%rdi)
 31b:	70 00                	jo     31d <_init-0x400393>
 31d:	6e                   	outsb  %ds:(%rsi),(%dx)
 31e:	6f                   	outsl  %ds:(%rsi),(%dx)
 31f:	74 5f                	je     380 <_init-0x400330>
 321:	65 6f                	outsl  %gs:(%rsi),(%dx)
 323:	66                   	data16
 324:	00 5f 5a             	add    %bl,0x5a(%rdi)
 327:	4e 34 42             	rex.WRX xor $0x42,%al
 32a:	61                   	(bad)  
 32b:	73 65                	jae    392 <_init-0x40031e>
 32d:	43 32 45 76          	rex.XB xor 0x76(%r13),%al
 331:	00 77 63             	add    %dh,0x63(%rdi)
 334:	73 70                	jae    3a6 <_init-0x40030a>
 336:	62 72                	(bad)  {%k7}
 338:	6b 00 5f             	imul   $0x5f,(%rax),%eax
 33b:	5a                   	pop    %rdx
 33c:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 340:	67 6e                	outsb  %ds:(%esi),(%dx)
 342:	75 5f                	jne    3a3 <_init-0x40030d>
 344:	63 78 78             	movslq 0x78(%rax),%edi
 347:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 34a:	5f                   	pop    %rdi
 34b:	6e                   	outsb  %ds:(%rsi),(%dx)
 34c:	75 6d                	jne    3bb <_init-0x4002f5>
 34e:	65                   	gs
 34f:	72 69                	jb     3ba <_init-0x4002f6>
 351:	63 5f 74             	movslq 0x74(%rdi),%ebx
 354:	72 61                	jb     3b7 <_init-0x4002f9>
 356:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 35d:	65 
 35e:	67                   	addr32
 35f:	65                   	gs
 360:	72 49                	jb     3ab <_init-0x400305>
 362:	6c                   	insb   (%dx),%es:(%rdi)
 363:	45 35 5f 5f 6d 61    	rex.RB xor $0x616d5f5f,%eax
 369:	78 45                	js     3b0 <_init-0x400300>
 36b:	00 5f 5f             	add    %bl,0x5f(%rdi)
 36e:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
 375:	65 64 00 5f 53       	gs add %bl,%fs:%gs:0x53(%rdi)
 37a:	5f                   	pop    %rdi
 37b:	6f                   	outsl  %ds:(%rsi),(%dx)
 37c:	75 74                	jne    3f2 <_init-0x4002be>
 37e:	00 5f 53             	add    %bl,0x53(%rdi)
 381:	5f                   	pop    %rdi
 382:	61                   	(bad)  
 383:	70 70                	jo     3f5 <_init-0x4002bb>
 385:	00 6f 70             	add    %ch,0x70(%rdi)
 388:	65 6e                	outsb  %gs:(%rsi),(%dx)
 38a:	6d                   	insl   (%dx),%es:(%rdi)
 38b:	6f                   	outsl  %ds:(%rsi),(%dx)
 38c:	64 65 00 5f 76       	fs add %bl,%fs:%gs:0x76(%rdi)
 391:	70 74                	jo     407 <_init-0x4002a9>
 393:	72 2e                	jb     3c3 <_init-0x4002ed>
 395:	42 61                	rex.X (bad) 
 397:	73 65                	jae    3fe <_init-0x4002b2>
 399:	00 77 63             	add    %dh,0x63(%rdi)
 39c:	73 6e                	jae    40c <_init-0x4002a4>
 39e:	63 6d 70             	movslq 0x70(%rbp),%ebp
 3a1:	00 69 6e             	add    %ch,0x6e(%rcx)
 3a4:	74 5f                	je     405 <_init-0x4002ab>
 3a6:	6e                   	outsb  %ds:(%rsi),(%dx)
 3a7:	5f                   	pop    %rdi
 3a8:	73 69                	jae    413 <_init-0x40029d>
 3aa:	67 6e                	outsb  %ds:(%esi),(%dx)
 3ac:	5f                   	pop    %rdi
 3ad:	70 6f                	jo     41e <_init-0x400292>
 3af:	73 6e                	jae    41f <_init-0x400291>
 3b1:	00 77 6d             	add    %dh,0x6d(%rdi)
 3b4:	65                   	gs
 3b5:	6d                   	insl   (%dx),%es:(%rdi)
 3b6:	6d                   	insl   (%dx),%es:(%rdi)
 3b7:	6f                   	outsl  %ds:(%rsi),(%dx)
 3b8:	76 65                	jbe    41f <_init-0x400291>
 3ba:	00 5f 5f             	add    %bl,0x5f(%rdi)
 3bd:	6d                   	insl   (%dx),%es:(%rdi)
 3be:	69 6e 00 62 74 6f 77 	imul   $0x776f7462,0x0(%rsi),%ebp
 3c5:	63 00                	movslq (%rax),%eax
 3c7:	6d                   	insl   (%dx),%es:(%rdi)
 3c8:	6f                   	outsl  %ds:(%rsi),(%dx)
 3c9:	6e                   	outsb  %ds:(%rsi),(%dx)
 3ca:	5f                   	pop    %rdi
 3cb:	74 68                	je     435 <_init-0x40027b>
 3cd:	6f                   	outsl  %ds:(%rsi),(%dx)
 3ce:	75 73                	jne    443 <_init-0x40026d>
 3d0:	61                   	(bad)  
 3d1:	6e                   	outsb  %ds:(%rsi),(%dx)
 3d2:	64                   	fs
 3d3:	73 5f                	jae    434 <_init-0x40027c>
 3d5:	73 65                	jae    43c <_init-0x400274>
 3d7:	70 00                	jo     3d9 <_init-0x4002d7>
 3d9:	75 6e                	jne    449 <_init-0x400267>
 3db:	67                   	addr32
 3dc:	65                   	gs
 3dd:	74 77                	je     456 <_init-0x40025a>
 3df:	63 00                	movslq (%rax),%eax
 3e1:	66                   	data16
 3e2:	70 5f                	jo     443 <_init-0x40026d>
 3e4:	6f                   	outsl  %ds:(%rsi),(%dx)
 3e5:	66                   	data16
 3e6:	66                   	data16
 3e7:	73 65                	jae    44e <_init-0x400262>
 3e9:	74 00                	je     3eb <_init-0x4002c5>
 3eb:	70 74                	jo     461 <_init-0x40024f>
 3ed:	72 64                	jb     453 <_init-0x40025d>
 3ef:	69 66 66 5f 74 00 5f 	imul   $0x5f00745f,0x66(%rsi),%esp
 3f6:	5a                   	pop    %rdx
 3f7:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 3fb:	67 6e                	outsb  %ds:(%esi),(%dx)
 3fd:	75 5f                	jne    45e <_init-0x400252>
 3ff:	63 78 78             	movslq 0x78(%rax),%edi
 402:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 405:	5f                   	pop    %rdi
 406:	6e                   	outsb  %ds:(%rsi),(%dx)
 407:	75 6d                	jne    476 <_init-0x40023a>
 409:	65                   	gs
 40a:	72 69                	jb     475 <_init-0x40023b>
 40c:	63 5f 74             	movslq 0x74(%rdi),%ebx
 40f:	72 61                	jb     472 <_init-0x40023e>
 411:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 418:	65 
 419:	67                   	addr32
 41a:	65                   	gs
 41b:	72 49                	jb     466 <_init-0x40024a>
 41d:	69 45 35 5f 5f 6d 69 	imul   $0x696d5f5f,0x35(%rbp),%eax
 424:	6e                   	outsb  %ds:(%rsi),(%dx)
 425:	45 00 77 63          	add    %r14b,0x63(%r15)
 429:	74 72                	je     49d <_init-0x400213>
 42b:	61                   	(bad)  
 42c:	6e                   	outsb  %ds:(%rsi),(%dx)
 42d:	73 5f                	jae    48e <_init-0x400222>
 42f:	74 00                	je     431 <_init-0x40027f>
 431:	6d                   	insl   (%dx),%es:(%rdi)
 432:	62 72 6c 65 6e       	(bad)  {%k5}
 437:	00 6e 65             	add    %ch,0x65(%rsi)
 43a:	67 61                	addr32 (bad) 
 43c:	74 69                	je     4a7 <_init-0x400209>
 43e:	76 65                	jbe    4a5 <_init-0x40020b>
 440:	5f                   	pop    %rdi
 441:	73 69                	jae    4ac <_init-0x400204>
 443:	67 6e                	outsb  %ds:(%esi),(%dx)
 445:	00 5f 53             	add    %bl,0x53(%rdi)
 448:	5f                   	pop    %rdi
 449:	68 65 78 00 69       	pushq  $0x69007865
 44e:	6e                   	outsb  %ds:(%rsi),(%dx)
 44f:	74 5f                	je     4b0 <_init-0x400200>
 451:	70 5f                	jo     4b2 <_init-0x4001fe>
 453:	63 73 5f             	movslq 0x5f(%rbx),%esi
 456:	70 72                	jo     4ca <_init-0x4001e6>
 458:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
 45c:	65                   	gs
 45d:	73 00                	jae    45f <_init-0x400251>
 45f:	5f                   	pop    %rdi
 460:	53                   	push   %rbx
 461:	5f                   	pop    %rdi
 462:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%rdi),%ebp
 469:	74 61                	je     4cc <_init-0x4001e4>
 46b:	74 65                	je     4d2 <_init-0x4001de>
 46d:	5f                   	pop    %rdi
 46e:	6d                   	insl   (%dx),%es:(%rdi)
 46f:	69 6e 00 77 63 73 74 	imul   $0x74736377,0x0(%rsi),%ebp
 476:	6f                   	outsl  %ds:(%rsi),(%dx)
 477:	75 6c                	jne    4e5 <_init-0x4001cb>
 479:	6c                   	insb   (%dx),%es:(%rdi)
 47a:	00 5f 53             	add    %bl,0x53(%rdi)
 47d:	5f                   	pop    %rdi
 47e:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%rsi),%ebp
 485:	6c                   	insb   (%dx),%es:(%rdi)
 486:	00 63 6f             	add    %ah,0x6f(%rbx)
 489:	6d                   	insl   (%dx),%es:(%rdi)
 48a:	70 61                	jo     4ed <_init-0x4001c3>
 48c:	72 65                	jb     4f3 <_init-0x4001bd>
 48e:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 492:	6d                   	insl   (%dx),%es:(%rdi)
 493:	64                   	fs
 494:	61                   	(bad)  
 495:	79 00                	jns    497 <_init-0x400219>
 497:	66 69 6e 64 00 77    	imul   $0x7700,0x64(%rsi),%bp
 49d:	63 73 63             	movslq 0x63(%rbx),%esi
 4a0:	70 79                	jo     51b <_init-0x400195>
 4a2:	00 5f 43             	add    %bl,0x43(%rdi)
 4a5:	68 61 72 54 00       	pushq  $0x547261
 4aa:	76 73                	jbe    51f <_init-0x400191>
 4ac:	77 70                	ja     51e <_init-0x400192>
 4ae:	72 69                	jb     519 <_init-0x400197>
 4b0:	6e                   	outsb  %ds:(%rsi),(%dx)
 4b1:	74 66                	je     519 <_init-0x400197>
 4b3:	00 77 6d             	add    %dh,0x6d(%rdi)
 4b6:	65                   	gs
 4b7:	6d                   	insl   (%dx),%es:(%rdi)
 4b8:	73 65                	jae    51f <_init-0x400191>
 4ba:	74 00                	je     4bc <_init-0x4001f4>
 4bc:	73 65                	jae    523 <_init-0x40018d>
 4be:	65 6b 64 69 72 00    	imul   $0x0,%gs:0x72(%rcx,%rbp,2),%esp
 4c4:	66                   	data16
 4c5:	77 69                	ja     530 <_init-0x400180>
 4c7:	64 65 00 56 69       	fs add %dl,%fs:%gs:0x69(%rsi)
 4cc:	72 74                	jb     542 <_init-0x40016e>
 4ce:	75 61                	jne    531 <_init-0x40017f>
 4d0:	6c                   	insb   (%dx),%es:(%rdi)
 4d1:	46 75 6e             	rex.RX jne 542 <_init-0x40016e>
 4d4:	63 2e                	movslq (%rsi),%ebp
 4d6:	63 70 70             	movslq 0x70(%rax),%esi
 4d9:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 4dd:	73 65                	jae    544 <_init-0x40016c>
 4df:	63 00                	movslq (%rax),%eax
 4e1:	74 6d                	je     550 <_init-0x400160>
 4e3:	5f                   	pop    %rdi
 4e4:	69 73 64 73 74 00 77 	imul   $0x77007473,0x64(%rbx),%esi
 4eb:	63 73 6e             	movslq 0x6e(%rbx),%esi
 4ee:	63 70 79             	movslq 0x79(%rax),%esi
 4f1:	00 70 75             	add    %dh,0x75(%rax)
 4f4:	74 77                	je     56d <_init-0x400143>
 4f6:	63 68 61             	movslq 0x61(%rax),%ebp
 4f9:	72 00                	jb     4fb <_init-0x4001b5>
 4fb:	77 6d                	ja     56a <_init-0x400146>
 4fd:	65                   	gs
 4fe:	6d                   	insl   (%dx),%es:(%rdi)
 4ff:	63 6d 70             	movslq 0x70(%rbp),%ebp
 502:	00 5f 53             	add    %bl,0x53(%rdi)
 505:	5f                   	pop    %rdi
 506:	61                   	(bad)  
 507:	74 65                	je     56e <_init-0x400142>
 509:	00 5f 5a             	add    %bl,0x5a(%rdi)
 50c:	4e 53                	rex.WRX push %rbx
 50e:	74 31                	je     541 <_init-0x40016f>
 510:	31 63 68             	xor    %esp,0x68(%rbx)
 513:	61                   	(bad)  
 514:	72 5f                	jb     575 <_init-0x40013b>
 516:	74 72                	je     58a <_init-0x400126>
 518:	61                   	(bad)  
 519:	69 74 73 49 63 45 34 	imul   $0x63344563,0x49(%rbx,%rsi,2),%esi
 520:	63 
 521:	6f                   	outsl  %ds:(%rsi),(%dx)
 522:	70 79                	jo     59d <_init-0x400113>
 524:	45 50                	rex.RB push %r8
 526:	63 50 4b             	movslq 0x4b(%rax),%edx
 529:	63 6d 00             	movslq 0x0(%rbp),%ebp
 52c:	5f                   	pop    %rdi
 52d:	5a                   	pop    %rdx
 52e:	4e 53                	rex.WRX push %rbx
 530:	74 31                	je     563 <_init-0x40014d>
 532:	31 63 68             	xor    %esp,0x68(%rbx)
 535:	61                   	(bad)  
 536:	72 5f                	jb     597 <_init-0x400119>
 538:	74 72                	je     5ac <_init-0x400104>
 53a:	61                   	(bad)  
 53b:	69 74 73 49 63 45 32 	imul   $0x6c324563,0x49(%rbx,%rsi,2),%esi
 542:	6c 
 543:	74 45                	je     58a <_init-0x400126>
 545:	52                   	push   %rdx
 546:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
 54a:	5f                   	pop    %rdi
 54b:	00 5f 53             	add    %bl,0x53(%rdi)
 54e:	5f                   	pop    %rdi
 54f:	66 69 78 65 64 00    	imul   $0x64,0x65(%rax),%di
 555:	69 6e 74 5f 6e 5f 73 	imul   $0x735f6e5f,0x74(%rsi),%ebp
 55c:	65                   	gs
 55d:	70 5f                	jo     5be <_init-0x4000f2>
 55f:	62                   	(bad)  {%k5}
 560:	79 5f                	jns    5c1 <_init-0x4000ef>
 562:	73 70                	jae    5d4 <_init-0x4000dc>
 564:	61                   	(bad)  
 565:	63 65 00             	movslq 0x0(%rbp),%esp
 568:	5f                   	pop    %rdi
 569:	5f                   	pop    %rdi
 56a:	70 72                	jo     5de <_init-0x4000d2>
 56c:	69 6f 72 69 74 79 00 	imul   $0x797469,0x72(%rdi),%ebp
 573:	5f                   	pop    %rdi
 574:	53                   	push   %rbx
 575:	5f                   	pop    %rdi
 576:	73 68                	jae    5e0 <_init-0x4000d0>
 578:	6f                   	outsl  %ds:(%rsi),(%dx)
 579:	77 62                	ja     5dd <_init-0x4000d3>
 57b:	61                   	(bad)  
 57c:	73 65                	jae    5e3 <_init-0x4000cd>
 57e:	00 5f 53             	add    %bl,0x53(%rdi)
 581:	5f                   	pop    %rdi
 582:	69 6e 00 5f 5f 67 6e 	imul   $0x6e675f5f,0x0(%rsi),%ebp
 589:	75 5f                	jne    5ea <_init-0x4000c6>
 58b:	64                   	fs
 58c:	65                   	gs
 58d:	62                   	(bad)  {%k5}
 58e:	75 67                	jne    5f7 <_init-0x4000b9>
 590:	00 76 66             	add    %dh,0x66(%rsi)
 593:	77 70                	ja     605 <_init-0x4000ab>
 595:	72 69                	jb     600 <_init-0x4000b0>
 597:	6e                   	outsb  %ds:(%rsi),(%dx)
 598:	74 66                	je     600 <_init-0x4000b0>
 59a:	00 74 68 69          	add    %dh,0x69(%rax,%rbp,2)
 59e:	73 00                	jae    5a0 <_init-0x400110>
 5a0:	76 73                	jbe    615 <_init-0x40009b>
 5a2:	77 73                	ja     617 <_init-0x400099>
 5a4:	63 61 6e             	movslq 0x6e(%rcx),%esp
 5a7:	66                   	data16
 5a8:	00 65 71             	add    %ah,0x71(%rbp)
 5ab:	5f                   	pop    %rdi
 5ac:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
 5b3:	65 00 5f 53          	add    %bl,%gs:0x53(%rdi)
 5b7:	5f                   	pop    %rdi
 5b8:	72 65                	jb     61f <_init-0x400091>
 5ba:	66 63 6f 75          	movslq 0x75(%rdi),%bp
 5be:	6e                   	outsb  %ds:(%rsi),(%dx)
 5bf:	74 00                	je     5c1 <_init-0x4000ef>
 5c1:	5f                   	pop    %rdi
 5c2:	5a                   	pop    %rdx
 5c3:	4e 53                	rex.WRX push %rbx
 5c5:	74 31                	je     5f8 <_init-0x4000b8>
 5c7:	31 63 68             	xor    %esp,0x68(%rbx)
 5ca:	61                   	(bad)  
 5cb:	72 5f                	jb     62c <_init-0x400084>
 5cd:	74 72                	je     641 <_init-0x40006f>
 5cf:	61                   	(bad)  
 5d0:	69 74 73 49 63 45 31 	imul   $0x32314563,0x49(%rbx,%rsi,2),%esi
 5d7:	32 
 5d8:	74 6f                	je     649 <_init-0x400067>
 5da:	5f                   	pop    %rdi
 5db:	63 68 61             	movslq 0x61(%rax),%ebp
 5de:	72 5f                	jb     63f <_init-0x400071>
 5e0:	74 79                	je     65b <_init-0x400055>
 5e2:	70 65                	jo     649 <_init-0x400067>
 5e4:	45 52                	rex.RB push %r10
 5e6:	4b 69 00 5f 53 5f 74 	rex.WXB imul $0x745f535f,(%r8),%rax
 5ed:	72 75                	jb     664 <_init-0x40004c>
 5ef:	6e                   	outsb  %ds:(%rsi),(%dx)
 5f0:	63 00                	movslq (%rax),%eax
 5f2:	5f                   	pop    %rdi
 5f3:	5f                   	pop    %rdi
 5f4:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%rsi),%ebp
 5fb:	69 7a 65 5f 70 00 5f 	imul   $0x5f00705f,0x65(%rdx),%edi
 602:	53                   	push   %rbx
 603:	5f                   	pop    %rdi
 604:	73 68                	jae    66e <_init-0x400042>
 606:	6f                   	outsl  %ds:(%rsi),(%dx)
 607:	77 70                	ja     679 <_init-0x400037>
 609:	6f                   	outsl  %ds:(%rsi),(%dx)
 60a:	73 00                	jae    60c <_init-0x4000a4>
 60c:	77 6d                	ja     67b <_init-0x400035>
 60e:	65                   	gs
 60f:	6d                   	insl   (%dx),%es:(%rdi)
 610:	63 70 79             	movslq 0x79(%rax),%esi
 613:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 617:	6d                   	insl   (%dx),%es:(%rdi)
 618:	6f                   	outsl  %ds:(%rsi),(%dx)
 619:	6e                   	outsb  %ds:(%rsi),(%dx)
 61a:	00 5f 53             	add    %bl,0x53(%rdi)
 61d:	5f                   	pop    %rdi
 61e:	64 65 63 00          	fs movslq %fs:%gs:(%rax),%eax
 622:	5f                   	pop    %rdi
 623:	49 6f                	rex.WB outsl %ds:(%rsi),(%dx)
 625:	73 5f                	jae    686 <_init-0x40002a>
 627:	46 6d                	rex.RX insl (%dx),%es:(%rdi)
 629:	74 66                	je     691 <_init-0x40001f>
 62b:	6c                   	insb   (%dx),%es:(%rdi)
 62c:	61                   	(bad)  
 62d:	67 73 00             	addr32 jae 630 <_init-0x400080>
 630:	5f                   	pop    %rdi
 631:	5a                   	pop    %rdx
 632:	4e 53                	rex.WRX push %rbx
 634:	74 31                	je     667 <_init-0x400049>
 636:	31 63 68             	xor    %esp,0x68(%rbx)
 639:	61                   	(bad)  
 63a:	72 5f                	jb     69b <_init-0x400015>
 63c:	74 72                	je     6b0 <_init-0x400000>
 63e:	61                   	(bad)  
 63f:	69 74 73 49 63 45 34 	imul   $0x66344563,0x49(%rbx,%rsi,2),%esi
 646:	66 
 647:	69 6e 64 45 50 4b 63 	imul   $0x634b5045,0x64(%rsi),%ebp
 64e:	6d                   	insl   (%dx),%es:(%rdi)
 64f:	52                   	push   %rdx
 650:	53                   	push   %rbx
 651:	31 5f 00             	xor    %ebx,0x0(%rdi)
 654:	5f                   	pop    %rdi
 655:	5a                   	pop    %rdx
 656:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 65a:	67 6e                	outsb  %ds:(%esi),(%dx)
 65c:	75 5f                	jne    6bd <_init-0x3ffff3>
 65e:	63 78 78             	movslq 0x78(%rax),%edi
 661:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 664:	5f                   	pop    %rdi
 665:	6e                   	outsb  %ds:(%rsi),(%dx)
 666:	75 6d                	jne    6d5 <_init-0x3fffdb>
 668:	65                   	gs
 669:	72 69                	jb     6d4 <_init-0x3fffdc>
 66b:	63 5f 74             	movslq 0x74(%rdi),%ebx
 66e:	72 61                	jb     6d1 <_init-0x3fffdf>
 670:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 677:	65 
 678:	67                   	addr32
 679:	65                   	gs
 67a:	72 49                	jb     6c5 <_init-0x3fffeb>
 67c:	73 45                	jae    6c3 <_init-0x3fffed>
 67e:	35 5f 5f 6d 69       	xor    $0x696d5f5f,%eax
 683:	6e                   	outsb  %ds:(%rsi),(%dx)
 684:	45 00 77 63          	add    %r14b,0x63(%r15)
 688:	74 6f                	je     6f9 <_init-0x3fffb7>
 68a:	62                   	(bad)  {%k5}
 68b:	00 5f 53             	add    %bl,0x53(%rdi)
 68e:	5f                   	pop    %rdi
 68f:	73 68                	jae    6f9 <_init-0x3fffb7>
 691:	6f                   	outsl  %ds:(%rsi),(%dx)
 692:	77 70                	ja     704 <_init-0x3fffac>
 694:	6f                   	outsl  %ds:(%rsi),(%dx)
 695:	69 6e 74 00 5f 53 5f 	imul   $0x5f535f00,0x74(%rsi),%ebp
 69c:	73 6b                	jae    709 <_init-0x3fffa7>
 69e:	69 70 77 73 00 67 70 	imul   $0x70670073,0x77(%rax),%esi
 6a5:	5f                   	pop    %rdi
 6a6:	6f                   	outsl  %ds:(%rsi),(%dx)
 6a7:	66                   	data16
 6a8:	66                   	data16
 6a9:	73 65                	jae    710 <_init-0x3fffa0>
 6ab:	74 00                	je     6ad <_init-0x400003>
 6ad:	5f                   	pop    %rdi
 6ae:	53                   	push   %rbx
 6af:	5f                   	pop    %rdi
 6b0:	61                   	(bad)  
 6b1:	64                   	fs
 6b2:	6a 75                	pushq  $0x75
 6b4:	73 74                	jae    72a <_init-0x3fff86>
 6b6:	66 69 65 6c 64 00    	imul   $0x64,0x6c(%rbp),%sp
 6bc:	5f                   	pop    %rdi
 6bd:	5a                   	pop    %rdx
 6be:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 6c2:	67 6e                	outsb  %ds:(%esi),(%dx)
 6c4:	75 5f                	jne    725 <_init-0x3fff8b>
 6c6:	63 78 78             	movslq 0x78(%rax),%edi
 6c9:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 6cc:	5f                   	pop    %rdi
 6cd:	6e                   	outsb  %ds:(%rsi),(%dx)
 6ce:	75 6d                	jne    73d <_init-0x3fff73>
 6d0:	65                   	gs
 6d1:	72 69                	jb     73c <_init-0x3fff74>
 6d3:	63 5f 74             	movslq 0x74(%rdi),%ebx
 6d6:	72 61                	jb     739 <_init-0x3fff77>
 6d8:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 6df:	65 
 6e0:	67                   	addr32
 6e1:	65                   	gs
 6e2:	72 49                	jb     72d <_init-0x3fff83>
 6e4:	6d                   	insl   (%dx),%es:(%rdi)
 6e5:	45 38 5f 5f          	cmp    %r11b,0x5f(%r15)
 6e9:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
 6f0:	00 
 6f1:	66                   	data16
 6f2:	6c                   	insb   (%dx),%es:(%rdi)
 6f3:	6f                   	outsl  %ds:(%rsi),(%dx)
 6f4:	61                   	(bad)  
 6f5:	74 00                	je     6f7 <_init-0x3fffb9>
 6f7:	5f                   	pop    %rdi
 6f8:	5a                   	pop    %rdx
 6f9:	53                   	push   %rbx
 6fa:	74 34                	je     730 <_init-0x3fff80>
 6fc:	63 6f 75             	movslq 0x75(%rdi),%ebp
 6ff:	74 00                	je     701 <_init-0x3fffaf>
 701:	74 6d                	je     770 <_init-0x3fff40>
 703:	5f                   	pop    %rdi
 704:	6d                   	insl   (%dx),%es:(%rdi)
 705:	69 6e 00 5f 53 5f 6c 	imul   $0x6c5f535f,0x0(%rsi),%ebp
 70c:	65                   	gs
 70d:	66                   	data16
 70e:	74 00                	je     710 <_init-0x3fffa0>
 710:	5f                   	pop    %rdi
 711:	5a                   	pop    %rdx
 712:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 716:	67 6e                	outsb  %ds:(%esi),(%dx)
 718:	75 5f                	jne    779 <_init-0x3fff37>
 71a:	63 78 78             	movslq 0x78(%rax),%edi
 71d:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 720:	5f                   	pop    %rdi
 721:	6e                   	outsb  %ds:(%rsi),(%dx)
 722:	75 6d                	jne    791 <_init-0x3fff1f>
 724:	65                   	gs
 725:	72 69                	jb     790 <_init-0x3fff20>
 727:	63 5f 74             	movslq 0x74(%rdi),%ebx
 72a:	72 61                	jb     78d <_init-0x3fff23>
 72c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 733:	65 
 734:	67                   	addr32
 735:	65                   	gs
 736:	72 49                	jb     781 <_init-0x3fff2f>
 738:	6c                   	insb   (%dx),%es:(%rdi)
 739:	45 35 5f 5f 6d 69    	rex.RB xor $0x696d5f5f,%eax
 73f:	6e                   	outsb  %ds:(%rsi),(%dx)
 740:	45 00 63 68          	add    %r12b,0x68(%r11)
 744:	61                   	(bad)  
 745:	72 5f                	jb     7a6 <_init-0x3fff0a>
 747:	74 72                	je     7bb <_init-0x3ffef5>
 749:	61                   	(bad)  
 74a:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%rbx,%rsi,2),%esi
 751:	72 
 752:	3e 00 70 6f          	add    %dh,%ds:0x6f(%rax)
 756:	73 69                	jae    7c1 <_init-0x3ffeef>
 758:	74 69                	je     7c3 <_init-0x3ffeed>
 75a:	76 65                	jbe    7c1 <_init-0x3ffeef>
 75c:	5f                   	pop    %rdi
 75d:	73 69                	jae    7c8 <_init-0x3ffee8>
 75f:	67 6e                	outsb  %ds:(%esi),(%dx)
 761:	00 64 69 73          	add    %ah,0x73(%rcx,%rbp,2)
 765:	70 00                	jo     767 <_init-0x3fff49>
 767:	5f                   	pop    %rdi
 768:	53                   	push   %rbx
 769:	5f                   	pop    %rdi
 76a:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
 771:	6e                   	outsb  %ds:(%rsi),(%dx)
 772:	6d                   	insl   (%dx),%es:(%rdi)
 773:	6f                   	outsl  %ds:(%rsi),(%dx)
 774:	64                   	fs
 775:	65                   	gs
 776:	5f                   	pop    %rdi
 777:	65 6e                	outsb  %gs:(%rsi),(%dx)
 779:	64 00 47 4e          	add    %al,%fs:0x4e(%rdi)
 77d:	55                   	push   %rbp
 77e:	20 43 2b             	and    %al,0x2b(%rbx)
 781:	2b 20                	sub    (%rax),%esp
 783:	34 2e                	xor    $0x2e,%al
 785:	38 2e                	cmp    %ch,(%rsi)
 787:	34 20                	xor    $0x20,%al
 789:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
 78e:	65                   	gs
 78f:	3d 67 65 6e 65       	cmp    $0x656e6567,%eax
 794:	72 69                	jb     7ff <_init-0x3ffeb1>
 796:	63 20                	movslq (%rax),%esp
 798:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
 79d:	68 3d 78 38 36       	pushq  $0x3638783d
 7a2:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
 7a7:	67 20 2d 66 73 74 61 	and    %ch,0x61747366(%eip)        # 61747b14 <_end+0x6114693c>
 7ae:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
 7b1:	70 72                	jo     825 <_init-0x3ffe8b>
 7b3:	6f                   	outsl  %ds:(%rsi),(%dx)
 7b4:	74 65                	je     81b <_init-0x3ffe95>
 7b6:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
 7ba:	00 77 63             	add    %dh,0x63(%rdi)
 7bd:	73 73                	jae    832 <_init-0x3ffe7e>
 7bf:	70 6e                	jo     82f <_init-0x3ffe81>
 7c1:	00 5f 5a             	add    %bl,0x5a(%rdi)
 7c4:	4e 53                	rex.WRX push %rbx
 7c6:	74 31                	je     7f9 <_init-0x3ffeb7>
 7c8:	31 63 68             	xor    %esp,0x68(%rbx)
 7cb:	61                   	(bad)  
 7cc:	72 5f                	jb     82d <_init-0x3ffe83>
 7ce:	74 72                	je     842 <_init-0x3ffe6e>
 7d0:	61                   	(bad)  
 7d1:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%rbx,%rsi,2),%esi
 7d8:	31 
 7d9:	65                   	gs
 7da:	71 5f                	jno    83b <_init-0x3ffe75>
 7dc:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
 7e3:	65                   	gs
 7e4:	45 52                	rex.RB push %r10
 7e6:	4b 69 53 32 5f 00 5f 	rex.WXB imul $0x535f005f,0x32(%r11),%rdx
 7ed:	53 
 7ee:	5f                   	pop    %rdi
 7ef:	75 70                	jne    861 <_init-0x3ffe4f>
 7f1:	70 65                	jo     858 <_init-0x3ffe58>
 7f3:	72 63                	jb     858 <_init-0x3ffe58>
 7f5:	61                   	(bad)  
 7f6:	73 65                	jae    85d <_init-0x3ffe53>
 7f8:	00 5f 41             	add    %bl,0x41(%rdi)
 7fb:	74 6f                	je     86c <_init-0x3ffe44>
 7fd:	6d                   	insl   (%dx),%es:(%rdi)
 7fe:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
 805:	00 6f 76             	add    %ch,0x76(%rdi)
 808:	65                   	gs
 809:	72 66                	jb     871 <_init-0x3ffe3f>
 80b:	6c                   	insb   (%dx),%es:(%rdi)
 80c:	6f                   	outsl  %ds:(%rsi),(%dx)
 80d:	77 5f                	ja     86e <_init-0x3ffe42>
 80f:	61                   	(bad)  
 810:	72 67                	jb     879 <_init-0x3ffe37>
 812:	5f                   	pop    %rdi
 813:	61                   	(bad)  
 814:	72 65                	jb     87b <_init-0x3ffe35>
 816:	61                   	(bad)  
 817:	00 5f 53             	add    %bl,0x53(%rdi)
 81a:	5f                   	pop    %rdi
 81b:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
 822:	66                   	data16
 823:	6c                   	insb   (%dx),%es:(%rdi)
 824:	61                   	(bad)  
 825:	67 73 5f             	addr32 jae 887 <_init-0x3ffe29>
 828:	65 6e                	outsb  %gs:(%rsi),(%dx)
 82a:	64 00 6f 73          	add    %ch,%fs:0x73(%rdi)
 82e:	74 72                	je     8a2 <_init-0x3ffe0e>
 830:	65                   	gs
 831:	61                   	(bad)  
 832:	6d                   	insl   (%dx),%es:(%rdi)
 833:	00 5f 5f             	add    %bl,0x5f(%rdi)
 836:	63 6f 75             	movslq 0x75(%rdi),%ebp
 839:	6e                   	outsb  %ds:(%rsi),(%dx)
 83a:	74 00                	je     83c <_init-0x3ffe74>
 83c:	5f                   	pop    %rdi
 83d:	5f                   	pop    %rdi
 83e:	67 6e                	outsb  %ds:(%esi),(%dx)
 840:	75 5f                	jne    8a1 <_init-0x3ffe0f>
 842:	63 78 78             	movslq 0x78(%rax),%edi
 845:	00 62 6f             	add    %ah,0x6f(%rdx)
 848:	6f                   	outsl  %ds:(%rsi),(%dx)
 849:	6c                   	insb   (%dx),%es:(%rdi)
 84a:	00 5f 5a             	add    %bl,0x5a(%rdi)
 84d:	4e 53                	rex.WRX push %rbx
 84f:	74 31                	je     882 <_init-0x3ffe2e>
 851:	31 63 68             	xor    %esp,0x68(%rbx)
 854:	61                   	(bad)  
 855:	72 5f                	jb     8b6 <_init-0x3ffdfa>
 857:	74 72                	je     8cb <_init-0x3ffde5>
 859:	61                   	(bad)  
 85a:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%rbx,%rsi,2),%esi
 861:	61 
 862:	73 73                	jae    8d7 <_init-0x3ffdd9>
 864:	69 67 6e 45 50 63 6d 	imul   $0x6d635045,0x6e(%rdi),%esp
 86b:	63 00                	movslq (%rax),%eax
 86d:	2f                   	(bad)  
 86e:	68 6f 6d 65 2f       	pushq  $0x2f656d6f
 873:	73 69                	jae    8de <_init-0x3ffdd2>
 875:	6d                   	insl   (%dx),%es:(%rdi)
 876:	6f                   	outsl  %ds:(%rsi),(%dx)
 877:	6e                   	outsb  %ds:(%rsi),(%dx)
 878:	2f                   	(bad)  
 879:	67 69 74 68 75 62 2f 	imul   $0x696d2f62,0x75(%eax,%ebp,2),%esi
 880:	6d 69 
 882:	6e                   	outsb  %ds:(%rsi),(%dx)
 883:	65                   	gs
 884:	2f                   	(bad)  
 885:	4c 69 6e 75 78 50 72 	imul   $0x6f725078,0x75(%rsi),%r13
 88c:	6f 
 88d:	67 72 61             	addr32 jb 8f1 <_init-0x3ffdbf>
 890:	6d                   	insl   (%dx),%es:(%rdi)
 891:	2f                   	(bad)  
 892:	43 2b 2b             	rex.XB sub (%r11),%ebp
 895:	2f                   	(bad)  
 896:	56                   	push   %rsi
 897:	69 72 74 75 61 6c 46 	imul   $0x466c6175,0x74(%rdx),%esi
 89e:	75 6e                	jne    90e <_init-0x3ffda2>
 8a0:	63 00                	movslq (%rax),%eax
 8a2:	6c                   	insb   (%dx),%es:(%rdi)
 8a3:	6f                   	outsl  %ds:(%rsi),(%dx)
 8a4:	6e                   	outsb  %ds:(%rsi),(%dx)
 8a5:	67 20 64 6f 75       	and    %ah,0x75(%edi,%ebp,2)
 8aa:	62                   	(bad)  {%k5}
 8ab:	6c                   	insb   (%dx),%es:(%rdi)
 8ac:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
 8b0:	4e 34 42             	rex.WRX xor $0x42,%al
 8b3:	61                   	(bad)  
 8b4:	73 65                	jae    91b <_init-0x3ffd95>
 8b6:	34 64                	xor    $0x64,%al
 8b8:	69 73 70 45 76 00 5f 	imul   $0x5f007645,0x70(%rbx),%esi
 8bf:	5f                   	pop    %rdi
 8c0:	6e                   	outsb  %ds:(%rsi),(%dx)
 8c1:	75 6d                	jne    930 <_init-0x3ffd80>
 8c3:	65                   	gs
 8c4:	72 69                	jb     92f <_init-0x3ffd81>
 8c6:	63 5f 74             	movslq 0x74(%rdi),%ebx
 8c9:	72 61                	jb     92c <_init-0x3ffd84>
 8cb:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 8d2:	65 
 8d3:	67                   	addr32
 8d4:	65                   	gs
 8d5:	72 3c                	jb     913 <_init-0x3ffd9d>
 8d7:	6c                   	insb   (%dx),%es:(%rdi)
 8d8:	6f                   	outsl  %ds:(%rsi),(%dx)
 8d9:	6e                   	outsb  %ds:(%rsi),(%dx)
 8da:	67 20 69 6e          	and    %ch,0x6e(%ecx)
 8de:	74 3e                	je     91e <_init-0x3ffd92>
 8e0:	00 5f 53             	add    %bl,0x53(%rdi)
 8e3:	5f                   	pop    %rdi
 8e4:	66                   	data16
 8e5:	6c                   	insb   (%dx),%es:(%rdi)
 8e6:	6f                   	outsl  %ds:(%rsi),(%dx)
 8e7:	61                   	(bad)  
 8e8:	74 66                	je     950 <_init-0x3ffd60>
 8ea:	69 65 6c 64 00 5f 53 	imul   $0x535f0064,0x6c(%rbp),%esp
 8f1:	5f                   	pop    %rdi
 8f2:	6f                   	outsl  %ds:(%rsi),(%dx)
 8f3:	63 74 00 5f          	movslq 0x5f(%rax,%rax,1),%esi
 8f7:	5f                   	pop    %rdi
 8f8:	77 63                	ja     95d <_init-0x3ffd53>
 8fa:	68 62 00 5f 5f       	pushq  $0x5f5f0062
 8ff:	73 74                	jae    975 <_init-0x3ffd3b>
 901:	61                   	(bad)  
 902:	74 69                	je     96d <_init-0x3ffd43>
 904:	63 5f 69             	movslq 0x69(%rdi),%ebx
 907:	6e                   	outsb  %ds:(%rsi),(%dx)
 908:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
 90f:	61 
 910:	74 69                	je     97b <_init-0x3ffd35>
 912:	6f                   	outsl  %ds:(%rsi),(%dx)
 913:	6e                   	outsb  %ds:(%rsi),(%dx)
 914:	5f                   	pop    %rdi
 915:	61                   	(bad)  
 916:	6e                   	outsb  %ds:(%rsi),(%dx)
 917:	64                   	fs
 918:	5f                   	pop    %rdi
 919:	64                   	fs
 91a:	65                   	gs
 91b:	73 74                	jae    991 <_init-0x3ffd1f>
 91d:	72 75                	jb     994 <_init-0x3ffd1c>
 91f:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
 923:	6e                   	outsb  %ds:(%rsi),(%dx)
 924:	5f                   	pop    %rdi
 925:	30 00                	xor    %al,(%rax)
 927:	5f                   	pop    %rdi
 928:	5a                   	pop    %rdx
 929:	4e 53                	rex.WRX push %rbx
 92b:	74 31                	je     95e <_init-0x3ffd52>
 92d:	31 63 68             	xor    %esp,0x68(%rbx)
 930:	61                   	(bad)  
 931:	72 5f                	jb     992 <_init-0x3ffd1e>
 933:	74 72                	je     9a7 <_init-0x3ffd09>
 935:	61                   	(bad)  
 936:	69 74 73 49 63 45 37 	imul   $0x63374563,0x49(%rbx,%rsi,2),%esi
 93d:	63 
 93e:	6f                   	outsl  %ds:(%rsi),(%dx)
 93f:	6d                   	insl   (%dx),%es:(%rdi)
 940:	70 61                	jo     9a3 <_init-0x3ffd0d>
 942:	72 65                	jb     9a9 <_init-0x3ffd07>
 944:	45 50                	rex.RB push %r8
 946:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
 94a:	5f                   	pop    %rdi
 94b:	6d                   	insl   (%dx),%es:(%rdi)
 94c:	00 6c 6f 6e          	add    %ch,0x6e(%rdi,%rbp,2)
 950:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
 955:	67 20 75 6e          	and    %dh,0x6e(%ebp)
 959:	73 69                	jae    9c4 <_init-0x3ffcec>
 95b:	67 6e                	outsb  %ds:(%esi),(%dx)
 95d:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 962:	74 00                	je     964 <_init-0x3ffd4c>
 964:	72 65                	jb     9cb <_init-0x3ffce5>
 966:	67 5f                	addr32 pop %rdi
 968:	73 61                	jae    9cb <_init-0x3ffce5>
 96a:	76 65                	jbe    9d1 <_init-0x3ffcdf>
 96c:	5f                   	pop    %rdi
 96d:	61                   	(bad)  
 96e:	72 65                	jb     9d5 <_init-0x3ffcdb>
 970:	61                   	(bad)  
 971:	00 77 63             	add    %dh,0x63(%rdi)
 974:	73 74                	jae    9ea <_init-0x3ffcc6>
 976:	6f                   	outsl  %ds:(%rsi),(%dx)
 977:	6c                   	insb   (%dx),%es:(%rdi)
 978:	64 00 69 6e          	add    %ch,%fs:0x6e(%rcx)
 97c:	74 5f                	je     9dd <_init-0x3ffcd3>
 97e:	70 5f                	jo     9df <_init-0x3ffcd1>
 980:	73 65                	jae    9e7 <_init-0x3ffcc9>
 982:	70 5f                	jo     9e3 <_init-0x3ffccd>
 984:	62                   	(bad)  {%k5}
 985:	79 5f                	jns    9e6 <_init-0x3ffcca>
 987:	73 70                	jae    9f9 <_init-0x3ffcb7>
 989:	61                   	(bad)  
 98a:	63 65 00             	movslq 0x0(%rbp),%esp
 98d:	5f                   	pop    %rdi
 98e:	53                   	push   %rbx
 98f:	5f                   	pop    %rdi
 990:	69 6f 73 5f 73 65 65 	imul   $0x6565735f,0x73(%rdi),%ebp
 997:	6b 64 69 72 5f       	imul   $0x5f,0x72(%rcx,%rbp,2),%esp
 99c:	65 6e                	outsb  %gs:(%rsi),(%dx)
 99e:	64 00 6c 65 6e       	add    %ch,%fs:0x6e(%rbp,%riz,2)
 9a3:	67 74 68             	addr32 je a0e <_init-0x3ffca2>
 9a6:	00 77 63             	add    %dh,0x63(%rdi)
 9a9:	73 74                	jae    a1f <_init-0x3ffc91>
 9ab:	6f                   	outsl  %ds:(%rsi),(%dx)
 9ac:	6c                   	insb   (%dx),%es:(%rdi)
 9ad:	6c                   	insb   (%dx),%es:(%rdi)
 9ae:	00 77 63             	add    %dh,0x63(%rdi)
 9b1:	73 73                	jae    a26 <_init-0x3ffc8a>
 9b3:	74 72                	je     a27 <_init-0x3ffc89>
 9b5:	00 5f 49             	add    %bl,0x49(%rdi)
 9b8:	6f                   	outsl  %ds:(%rsi),(%dx)
 9b9:	73 5f                	jae    a1a <_init-0x3ffc96>
 9bb:	49 6f                	rex.WB outsl %ds:(%rsi),(%dx)
 9bd:	73 74                	jae    a33 <_init-0x3ffc7d>
 9bf:	61                   	(bad)  
 9c0:	74 65                	je     a27 <_init-0x3ffc89>
 9c2:	00 5f 5a             	add    %bl,0x5a(%rdi)
 9c5:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
 9c9:	67 6e                	outsb  %ds:(%esi),(%dx)
 9cb:	75 5f                	jne    a2c <_init-0x3ffc84>
 9cd:	63 78 78             	movslq 0x78(%rax),%edi
 9d0:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
 9d3:	5f                   	pop    %rdi
 9d4:	6e                   	outsb  %ds:(%rsi),(%dx)
 9d5:	75 6d                	jne    a44 <_init-0x3ffc6c>
 9d7:	65                   	gs
 9d8:	72 69                	jb     a43 <_init-0x3ffc6d>
 9da:	63 5f 74             	movslq 0x74(%rdi),%ebx
 9dd:	72 61                	jb     a40 <_init-0x3ffc70>
 9df:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 9e6:	65 
 9e7:	67                   	addr32
 9e8:	65                   	gs
 9e9:	72 49                	jb     a34 <_init-0x3ffc7c>
 9eb:	63 45 35             	movslq 0x35(%rbp),%eax
 9ee:	5f                   	pop    %rdi
 9ef:	5f                   	pop    %rdi
 9f0:	6d                   	insl   (%dx),%es:(%rdi)
 9f1:	61                   	(bad)  
 9f2:	78 45                	js     a39 <_init-0x3ffc77>
 9f4:	00 77 63             	add    %dh,0x63(%rdi)
 9f7:	73 72                	jae    a6b <_init-0x3ffc45>
 9f9:	74 6f                	je     a6a <_init-0x3ffc46>
 9fb:	6d                   	insl   (%dx),%es:(%rdi)
 9fc:	62 73                	(bad)  {%k5}
 9fe:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 a02:	77 64                	ja     a68 <_init-0x3ffc48>
 a04:	61                   	(bad)  
 a05:	79 00                	jns    a07 <_init-0x3ffca9>
 a07:	5f                   	pop    %rdi
 a08:	53                   	push   %rbx
 a09:	5f                   	pop    %rdi
 a0a:	75 6e                	jne    a7a <_init-0x3ffc36>
 a0c:	69 74 62 75 66 00 5f 	imul   $0x5a5f0066,0x75(%rdx,%riz,2),%esi
 a13:	5a 
 a14:	4e 53                	rex.WRX push %rbx
 a16:	74 31                	je     a49 <_init-0x3ffc67>
 a18:	31 63 68             	xor    %esp,0x68(%rbx)
 a1b:	61                   	(bad)  
 a1c:	72 5f                	jb     a7d <_init-0x3ffc33>
 a1e:	74 72                	je     a92 <_init-0x3ffc1e>
 a20:	61                   	(bad)  
 a21:	69 74 73 49 63 45 32 	imul   $0x65324563,0x49(%rbx,%rsi,2),%esi
 a28:	65 
 a29:	71 45                	jno    a70 <_init-0x3ffc40>
 a2b:	52                   	push   %rdx
 a2c:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
 a30:	5f                   	pop    %rdi
 a31:	00 5f 5f             	add    %bl,0x5f(%rdi)
 a34:	64 69 67 69 74 73 00 	imul   $0x77007374,%fs:0x69(%rdi),%esp
 a3b:	77 
 a3c:	63 73 74             	movslq 0x74(%rbx),%esi
 a3f:	6f                   	outsl  %ds:(%rsi),(%dx)
 a40:	64 00 77 63          	add    %dh,%fs:0x63(%rdi)
 a44:	73 74                	jae    aba <_init-0x3ffbf6>
 a46:	6f                   	outsl  %ds:(%rsi),(%dx)
 a47:	66                   	data16
 a48:	00 77 63             	add    %dh,0x63(%rdi)
 a4b:	73 74                	jae    ac1 <_init-0x3ffbef>
 a4d:	6f                   	outsl  %ds:(%rsi),(%dx)
 a4e:	6b 00 77             	imul   $0x77,(%rax),%eax
 a51:	63 73 74             	movslq 0x74(%rbx),%esi
 a54:	6f                   	outsl  %ds:(%rsi),(%dx)
 a55:	6c                   	insb   (%dx),%es:(%rdi)
 a56:	00 5f 5f             	add    %bl,0x5f(%rdi)
 a59:	46                   	rex.RX
 a5a:	49                   	rex.WB
 a5b:	4c                   	rex.WR
 a5c:	45 00 73 65          	add    %r14b,0x65(%r11)
 a60:	74 6c                	je     ace <_init-0x3ffbe2>
 a62:	6f                   	outsl  %ds:(%rsi),(%dx)
 a63:	63 61 6c             	movslq 0x6c(%rcx),%esp
 a66:	65 00 77 63          	add    %dh,%gs:0x63(%rdi)
 a6a:	73 72                	jae    ade <_init-0x3ffbd2>
 a6c:	63 68 72             	movslq 0x72(%rax),%ebp
 a6f:	00 77 69             	add    %dh,0x69(%rdi)
 a72:	6e                   	outsb  %ds:(%rsi),(%dx)
 a73:	74 5f                	je     ad4 <_init-0x3ffbdc>
 a75:	74 00                	je     a77 <_init-0x3ffc39>
 a77:	5f                   	pop    %rdi
 a78:	53                   	push   %rbx
 a79:	5f                   	pop    %rdi
 a7a:	69 6f 73 5f 6f 70 65 	imul   $0x65706f5f,0x73(%rdi),%ebp
 a81:	6e                   	outsb  %ds:(%rsi),(%dx)
 a82:	6d                   	insl   (%dx),%es:(%rdi)
 a83:	6f                   	outsl  %ds:(%rsi),(%dx)
 a84:	64                   	fs
 a85:	65                   	gs
 a86:	5f                   	pop    %rdi
 a87:	6d                   	insl   (%dx),%es:(%rdi)
 a88:	61                   	(bad)  
 a89:	78 00                	js     a8b <_init-0x3ffc25>
 a8b:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 a92:	65 00 77 63          	add    %dh,%gs:0x63(%rdi)
 a96:	73 6c                	jae    b04 <_init-0x3ffbac>
 a98:	65 6e                	outsb  %gs:(%rsi),(%dx)
 a9a:	00 69 6f             	add    %ch,0x6f(%rcx)
 a9d:	73 74                	jae    b13 <_init-0x3ffb9d>
 a9f:	61                   	(bad)  
 aa0:	74 65                	je     b07 <_init-0x3ffba9>
 aa2:	00 5f 53             	add    %bl,0x53(%rdi)
 aa5:	5f                   	pop    %rdi
 aa6:	69 6f 73 5f 66 6d 74 	imul   $0x746d665f,0x73(%rdi),%ebp
 aad:	66                   	data16
 aae:	6c                   	insb   (%dx),%es:(%rdi)
 aaf:	61                   	(bad)  
 ab0:	67 73 5f             	addr32 jae b12 <_init-0x3ffb9e>
 ab3:	6d                   	insl   (%dx),%es:(%rdi)
 ab4:	61                   	(bad)  
 ab5:	78 00                	js     ab7 <_init-0x3ffbf9>
 ab7:	74 6f                	je     b28 <_init-0x3ffb88>
 ab9:	5f                   	pop    %rdi
 aba:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
 ac1:	65 00 74 6f 5f       	add    %dh,%gs:0x5f(%rdi,%rbp,2)
 ac6:	63 68 61             	movslq 0x61(%rax),%ebp
 ac9:	72 5f                	jb     b2a <_init-0x3ffb86>
 acb:	74 79                	je     b46 <_init-0x3ffb6a>
 acd:	70 65                	jo     b34 <_init-0x3ffb7c>
 acf:	00 5f 5f             	add    %bl,0x5f(%rdi)
 ad2:	64                   	fs
 ad3:	65                   	gs
 ad4:	62                   	(bad)  {%k5}
 ad5:	75 67                	jne    b3e <_init-0x3ffb72>
 ad7:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 adb:	67 6d                	insl   (%dx),%es:(%edi)
 add:	74 6f                	je     b4e <_init-0x3ffb62>
 adf:	66                   	data16
 ae0:	66                   	data16
 ae1:	00 63 75             	add    %ah,0x75(%rbx)
 ae4:	72 72                	jb     b58 <_init-0x3ffb58>
 ae6:	65 6e                	outsb  %gs:(%rsi),(%dx)
 ae8:	63 79 5f             	movslq 0x5f(%rcx),%edi
 aeb:	73 79                	jae    b66 <_init-0x3ffb4a>
 aed:	6d                   	insl   (%dx),%es:(%rdi)
 aee:	62                   	(bad)  {%k5}
 aef:	6f                   	outsl  %ds:(%rsi),(%dx)
 af0:	6c                   	insb   (%dx),%es:(%rdi)
 af1:	00 73 68             	add    %dh,0x68(%rbx)
 af4:	6f                   	outsl  %ds:(%rsi),(%dx)
 af5:	72 74                	jb     b6b <_init-0x3ffb45>
 af7:	20 69 6e             	and    %ch,0x6e(%rcx)
 afa:	74 00                	je     afc <_init-0x3ffbb4>
 afc:	5f                   	pop    %rdi
 afd:	5a                   	pop    %rdx
 afe:	4e 53                	rex.WRX push %rbx
 b00:	74 31                	je     b33 <_init-0x3ffb7d>
 b02:	31 63 68             	xor    %esp,0x68(%rbx)
 b05:	61                   	(bad)  
 b06:	72 5f                	jb     b67 <_init-0x3ffb49>
 b08:	74 72                	je     b7c <_init-0x3ffb34>
 b0a:	61                   	(bad)  
 b0b:	69 74 73 49 63 45 36 	imul   $0x6c364563,0x49(%rbx,%rsi,2),%esi
 b12:	6c 
 b13:	65 6e                	outsb  %gs:(%rsi),(%dx)
 b15:	67 74 68             	addr32 je b80 <_init-0x3ffb30>
 b18:	45 50                	rex.RB push %r8
 b1a:	4b 63 00             	rex.WXB movslq (%r8),%rax
 b1d:	77 63                	ja     b82 <_init-0x3ffb2e>
 b1f:	73 66                	jae    b87 <_init-0x3ffb29>
 b21:	74 69                	je     b8c <_init-0x3ffb24>
 b23:	6d                   	insl   (%dx),%es:(%rdi)
 b24:	65 00 6d 6f          	add    %ch,%gs:0x6f(%rbp)
 b28:	6e                   	outsb  %ds:(%rsi),(%dx)
 b29:	5f                   	pop    %rdi
 b2a:	67 72 6f             	addr32 jb b9c <_init-0x3ffb14>
 b2d:	75 70                	jne    b9f <_init-0x3ffb11>
 b2f:	69 6e 67 00 5f 53 5f 	imul   $0x5f535f00,0x67(%rsi),%ebp
 b36:	63 75 72             	movslq 0x72(%rbp),%esi
 b39:	00 5f 5a             	add    %bl,0x5a(%rdi)
 b3c:	4e 53                	rex.WRX push %rbx
 b3e:	74 31                	je     b71 <_init-0x3ffb3f>
 b40:	31 63 68             	xor    %esp,0x68(%rbx)
 b43:	61                   	(bad)  
 b44:	72 5f                	jb     ba5 <_init-0x3ffb0b>
 b46:	74 72                	je     bba <_init-0x3ffaf6>
 b48:	61                   	(bad)  
 b49:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%rbx,%rsi,2),%esi
 b50:	61 
 b51:	73 73                	jae    bc6 <_init-0x3ffaea>
 b53:	69 67 6e 45 52 63 52 	imul   $0x52635245,0x6e(%rdi),%esp
 b5a:	4b 63 00             	rex.WXB movslq (%r8),%rax
 b5d:	77 63                	ja     bc2 <_init-0x3ffaee>
 b5f:	73 63                	jae    bc4 <_init-0x3ffaec>
 b61:	61                   	(bad)  
 b62:	74 00                	je     b64 <_init-0x3ffb4c>
 b64:	31 31                	xor    %esi,(%rcx)
 b66:	5f                   	pop    %rdi
 b67:	5f                   	pop    %rdi
 b68:	6d                   	insl   (%dx),%es:(%rdi)
 b69:	62 73 74 61 74       	(bad)  {%k1}
 b6e:	65                   	gs
 b6f:	5f                   	pop    %rdi
 b70:	74 00                	je     b72 <_init-0x3ffb3e>
 b72:	69 6e 74 5f 70 5f 73 	imul   $0x735f705f,0x74(%rsi),%ebp
 b79:	69 67 6e 5f 70 6f 73 	imul   $0x736f705f,0x6e(%rdi),%esp
 b80:	6e                   	outsb  %ds:(%rsi),(%dx)
 b81:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 b85:	7a 6f                	jp     bf6 <_init-0x3ffaba>
 b87:	6e                   	outsb  %ds:(%rsi),(%dx)
 b88:	65 00 76 77          	add    %dh,%gs:0x77(%rsi)
 b8c:	73 63                	jae    bf1 <_init-0x3ffabf>
 b8e:	61                   	(bad)  
 b8f:	6e                   	outsb  %ds:(%rsi),(%dx)
 b90:	66                   	data16
 b91:	00 5f 53             	add    %bl,0x53(%rdi)
 b94:	5f                   	pop    %rdi
 b95:	69 6f 73 5f 69 6f 73 	imul   $0x736f695f,0x73(%rdi),%ebp
 b9c:	74 61                	je     bff <_init-0x3ffab1>
 b9e:	74 65                	je     c05 <_init-0x3ffaab>
 ba0:	5f                   	pop    %rdi
 ba1:	65 6e                	outsb  %gs:(%rsi),(%dx)
 ba3:	64 00 77 63          	add    %dh,%fs:0x63(%rdi)
 ba7:	72 74                	jb     c1d <_init-0x3ffa93>
 ba9:	6f                   	outsl  %ds:(%rsi),(%dx)
 baa:	6d                   	insl   (%dx),%es:(%rdi)
 bab:	62                   	(bad)  {%k1}
 bac:	00 6c 63 6f          	add    %ch,0x6f(%rbx,%riz,2)
 bb0:	6e                   	outsb  %ds:(%rsi),(%dx)
 bb1:	76 00                	jbe    bb3 <_init-0x3ffafd>
 bb3:	5f                   	pop    %rdi
 bb4:	5a                   	pop    %rdx
 bb5:	4e 53                	rex.WRX push %rbx
 bb7:	74 31                	je     bea <_init-0x3ffac6>
 bb9:	31 63 68             	xor    %esp,0x68(%rbx)
 bbc:	61                   	(bad)  
 bbd:	72 5f                	jb     c1e <_init-0x3ffa92>
 bbf:	74 72                	je     c33 <_init-0x3ffa7d>
 bc1:	61                   	(bad)  
 bc2:	69 74 73 49 63 45 33 	imul   $0x65334563,0x49(%rbx,%rsi,2),%esi
 bc9:	65 
 bca:	6f                   	outsl  %ds:(%rsi),(%dx)
 bcb:	66                   	data16
 bcc:	45 76 00             	rex.RB jbe bcf <_init-0x3ffae1>
 bcf:	77 63                	ja     c34 <_init-0x3ffa7c>
 bd1:	73 6e                	jae    c41 <_init-0x3ffa6f>
 bd3:	63 61 74             	movslq 0x74(%rcx),%esp
 bd6:	00 5f 5f             	add    %bl,0x5f(%rdi)
 bd9:	6e                   	outsb  %ds:(%rsi),(%dx)
 bda:	75 6d                	jne    c49 <_init-0x3ffa67>
 bdc:	65                   	gs
 bdd:	72 69                	jb     c48 <_init-0x3ffa68>
 bdf:	63 5f 74             	movslq 0x74(%rdi),%ebx
 be2:	72 61                	jb     c45 <_init-0x3ffa6b>
 be4:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 beb:	65 
 bec:	67                   	addr32
 bed:	65                   	gs
 bee:	72 3c                	jb     c2c <_init-0x3ffa84>
 bf0:	73 68                	jae    c5a <_init-0x3ffa56>
 bf2:	6f                   	outsl  %ds:(%rsi),(%dx)
 bf3:	72 74                	jb     c69 <_init-0x3ffa47>
 bf5:	20 69 6e             	and    %ch,0x6e(%rcx)
 bf8:	74 3e                	je     c38 <_init-0x3ffa78>
 bfa:	00 5f 5f             	add    %bl,0x5f(%rdi)
 bfd:	64                   	fs
 bfe:	73 6f                	jae    c6f <_init-0x3ffa41>
 c00:	5f                   	pop    %rdi
 c01:	68 61 6e 64 6c       	pushq  $0x6c646e61
 c06:	65 00 6c 6f 6e       	add    %ch,%gs:0x6e(%rdi,%rbp,2)
 c0b:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
 c10:	67 20 69 6e          	and    %ch,0x6e(%ecx)
 c14:	74 00                	je     c16 <_init-0x3ffa9a>
 c16:	66                   	data16
 c17:	70 75                	jo     c8e <_init-0x3ffa22>
 c19:	74 77                	je     c92 <_init-0x3ffa1e>
 c1b:	63 00                	movslq (%rax),%eax
 c1d:	66                   	data16
 c1e:	70 75                	jo     c95 <_init-0x3ffa1b>
 c20:	74 77                	je     c99 <_init-0x3ffa17>
 c22:	73 00                	jae    c24 <_init-0x3ffa8c>
 c24:	7e 49                	jle    c6f <_init-0x3ffa41>
 c26:	6e                   	outsb  %ds:(%rsi),(%dx)
 c27:	69 74 00 6d 62 73 72 	imul   $0x74727362,0x6d(%rax,%rax,1),%esi
 c2e:	74 
 c2f:	6f                   	outsl  %ds:(%rsi),(%dx)
 c30:	77 63                	ja     c95 <_init-0x3ffa1b>
 c32:	73 00                	jae    c34 <_init-0x3ffa7c>
 c34:	5f                   	pop    %rdi
 c35:	53                   	push   %rbx
 c36:	5f                   	pop    %rdi
 c37:	66                   	data16
 c38:	61                   	(bad)  
 c39:	69 6c 62 69 74 00 5f 	imul   $0x5f5f0074,0x69(%rdx,%riz,2),%ebp
 c40:	5f 
 c41:	6e                   	outsb  %ds:(%rsi),(%dx)
 c42:	75 6d                	jne    cb1 <_init-0x3ff9ff>
 c44:	65                   	gs
 c45:	72 69                	jb     cb0 <_init-0x3ffa00>
 c47:	63 5f 74             	movslq 0x74(%rdi),%ebx
 c4a:	72 61                	jb     cad <_init-0x3ffa03>
 c4c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
 c53:	65 
 c54:	67                   	addr32
 c55:	65                   	gs
 c56:	72 3c                	jb     c94 <_init-0x3ffa1c>
 c58:	6c                   	insb   (%dx),%es:(%rdi)
 c59:	6f                   	outsl  %ds:(%rsi),(%dx)
 c5a:	6e                   	outsb  %ds:(%rsi),(%dx)
 c5b:	67 20 75 6e          	and    %dh,0x6e(%ebp)
 c5f:	73 69                	jae    cca <_init-0x3ff9e6>
 c61:	67 6e                	outsb  %ds:(%esi),(%dx)
 c63:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 c68:	74 3e                	je     ca8 <_init-0x3ffa08>
 c6a:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
 c6e:	79 65                	jns    cd5 <_init-0x3ff9db>
 c70:	61                   	(bad)  
 c71:	72 00                	jb     c73 <_init-0x3ffa3d>
 c73:	73 68                	jae    cdd <_init-0x3ff9d3>
 c75:	6f                   	outsl  %ds:(%rsi),(%dx)
 c76:	72 74                	jb     cec <_init-0x3ff9c4>
 c78:	20 75 6e             	and    %dh,0x6e(%rbp)
 c7b:	73 69                	jae    ce6 <_init-0x3ff9ca>
 c7d:	67 6e                	outsb  %ds:(%esi),(%dx)
 c7f:	65 64 20 69 6e       	gs and %ch,%fs:%gs:0x6e(%rcx)
 c84:	74 00                	je     c86 <_init-0x3ffa2a>
 c86:	5f                   	pop    %rdi
 c87:	54                   	push   %rsp
 c88:	72 61                	jb     ceb <_init-0x3ff9c5>
 c8a:	69 74 73 00 76 66 77 	imul   $0x73776676,0x0(%rbx,%rsi,2),%esi
 c91:	73 
 c92:	63 61 6e             	movslq 0x6e(%rcx),%esp
 c95:	66                   	data16
 c96:	00 5f 49             	add    %bl,0x49(%rdi)
 c99:	6f                   	outsl  %ds:(%rsi),(%dx)
 c9a:	73 5f                	jae    cfb <_init-0x3ff9b5>
 c9c:	53                   	push   %rbx
 c9d:	65 65 6b 64 69 72 00 	gs imul $0x0,%gs:0x72(%rcx,%rbp,2),%esp
 ca4:	66 6d                	insw   (%dx),%es:(%rdi)
 ca6:	74 66                	je     d0e <_init-0x3ff9a2>
 ca8:	6c                   	insb   (%dx),%es:(%rdi)
 ca9:	61                   	(bad)  
 caa:	67 73 00             	addr32 jae cad <_init-0x3ffa03>
 cad:	5f                   	pop    %rdi
 cae:	5f                   	pop    %rdi
 caf:	69 6e 74 33 32 5f 74 	imul   $0x745f3233,0x74(%rsi),%ebp
 cb6:	00 6d 62             	add    %ch,0x62(%rbp)
 cb9:	73 69                	jae    d24 <_init-0x3ff98c>
 cbb:	6e                   	outsb  %ds:(%rsi),(%dx)
 cbc:	69 74 00 69 73 77 63 	imul   $0x74637773,0x69(%rax,%rax,1),%esi
 cc3:	74 
 cc4:	79 70                	jns    d36 <_init-0x3ff97a>
 cc6:	65 00 61 73          	add    %ah,%gs:0x73(%rcx)
 cca:	73 69                	jae    d35 <_init-0x3ff97b>
 ccc:	67 6e                	outsb  %ds:(%esi),(%dx)
 cce:	00 5f 5a             	add    %bl,0x5a(%rdi)
 cd1:	4e 53                	rex.WRX push %rbx
 cd3:	74 31                	je     d06 <_init-0x3ff9aa>
 cd5:	31 63 68             	xor    %esp,0x68(%rbx)
 cd8:	61                   	(bad)  
 cd9:	72 5f                	jb     d3a <_init-0x3ff976>
 cdb:	74 72                	je     d4f <_init-0x3ff961>
 cdd:	61                   	(bad)  
 cde:	69 74 73 49 63 45 37 	imul   $0x6e374563,0x49(%rbx,%rsi,2),%esi
 ce5:	6e 
 ce6:	6f                   	outsl  %ds:(%rsi),(%dx)
 ce7:	74 5f                	je     d48 <_init-0x3ff968>
 ce9:	65 6f                	outsl  %gs:(%rsi),(%dx)
 ceb:	66 45 52             	rex.RB push %r10w
 cee:	4b 69 00 5f 53 5f 73 	rex.WXB imul $0x735f535f,(%r8),%rax
 cf5:	63 69 65             	movslq 0x65(%rcx),%ebp
 cf8:	6e                   	outsb  %ds:(%rsi),(%dx)
 cf9:	74 69                	je     d64 <_init-0x3ff94c>
 cfb:	66 69 63 00 77 63    	imul   $0x6377,0x0(%rbx),%sp
 d01:	68 61 72 5f 74       	pushq  $0x745f7261
 d06:	00 74 79 70          	add    %dh,0x70(%rcx,%rdi,2)
 d0a:	65                   	gs
 d0b:	64                   	fs
 d0c:	65                   	gs
 d0d:	66                   	data16
 d0e:	20 5f 5f             	and    %bl,0x5f(%rdi)
 d11:	76 61                	jbe    d74 <_init-0x3ff93c>
 d13:	5f                   	pop    %rdi
 d14:	6c                   	insb   (%dx),%es:(%rdi)
 d15:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
 d1c:	20 5f 5f             	and    %bl,0x5f(%rdi)
 d1f:	76 61                	jbe    d82 <_init-0x3ff92e>
 d21:	5f                   	pop    %rdi
 d22:	6c                   	insb   (%dx),%es:(%rdi)
 d23:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
 d2a:	00 77 63             	add    %dh,0x63(%rdi)
 d2d:	73 74                	jae    da3 <_init-0x3ff90d>
 d2f:	6f                   	outsl  %ds:(%rsi),(%dx)
 d30:	75 6c                	jne    d9e <_init-0x3ff912>
	...

Disassembly of section .debug_ranges:

0000000000000000 <.debug_ranges>:
   0:	3d 08 40 00 00       	cmp    $0x4008,%eax
   5:	00 00                	add    %al,(%rax)
   7:	00 f7                	add    %dh,%bh
   9:	08 40 00             	or     %al,0x0(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	f8                   	clc    
  11:	08 40 00             	or     %al,0x0(%rax)
  14:	00 00                	add    %al,(%rax)
  16:	00 00                	add    %al,(%rax)
  18:	18 09                	sbb    %cl,(%rcx)
  1a:	40 00 00             	add    %al,(%rax)
  1d:	00 00                	add    %al,(%rax)
  1f:	00 18                	add    %bl,(%rax)
  21:	09 40 00             	or     %eax,0x0(%rax)
  24:	00 00                	add    %al,(%rax)
  26:	00 00                	add    %al,(%rax)
  28:	35 09 40 00 00       	xor    $0x4009,%eax
  2d:	00 00                	add    %al,(%rax)
  2f:	00 36                	add    %dh,(%rsi)
  31:	09 40 00             	or     %eax,0x0(%rax)
  34:	00 00                	add    %al,(%rax)
  36:	00 00                	add    %al,(%rax)
  38:	53                   	push   %rbx
  39:	09 40 00             	or     %eax,0x0(%rax)
	...
