
main2.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	50                   	push   %rax
   3:	31 db                	xor    %ebx,%ebx
   5:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
   a:	bf 00 00 00 00       	mov    $0x0,%edi
   f:	31 c0                	xor    %eax,%eax
  11:	e8 00 00 00 00       	call   16 <main+0x16>
  16:	bf 00 00 00 00       	mov    $0x0,%edi
  1b:	31 f6                	xor    %esi,%esi
  1d:	31 c0                	xor    %eax,%eax
  1f:	e8 00 00 00 00       	call   24 <main+0x24>
  24:	bd 01 00 00 00       	mov    $0x1,%ebp
  29:	bf 00 00 00 00       	mov    $0x0,%edi
  2e:	be 01 00 00 00       	mov    $0x1,%esi
  33:	31 c0                	xor    %eax,%eax
  35:	e8 00 00 00 00       	call   3a <main+0x3a>
  3a:	8b 54 24 04          	mov    0x4(%rsp),%edx
  3e:	be 04 00 00 00       	mov    $0x4,%esi
  43:	83 fa 02             	cmp    $0x2,%edx
  46:	7c 57                	jl     9f <main+0x9f>
  48:	8d 4a ff             	lea    -0x1(%rdx),%ecx
  4b:	83 c2 fe             	add    $0xfffffffe,%edx
  4e:	89 c8                	mov    %ecx,%eax
  50:	83 e0 07             	and    $0x7,%eax
  53:	83 fa 07             	cmp    $0x7,%edx
  56:	72 2d                	jb     85 <main+0x85>
  58:	83 e1 f8             	and    $0xfffffff8,%ecx
  5b:	bd 01 00 00 00       	mov    $0x1,%ebp
  60:	31 db                	xor    %ebx,%ebx
  62:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  69:	00 00 00 00 
  6d:	0f 1f 00             	nopl   (%rax)
  70:	01 eb                	add    %ebp,%ebx
  72:	01 dd                	add    %ebx,%ebp
  74:	01 eb                	add    %ebp,%ebx
  76:	01 dd                	add    %ebx,%ebp
  78:	01 eb                	add    %ebp,%ebx
  7a:	01 dd                	add    %ebx,%ebp
  7c:	01 eb                	add    %ebp,%ebx
  7e:	01 dd                	add    %ebx,%ebp
  80:	83 c1 f8             	add    $0xfffffff8,%ecx
  83:	75 eb                	jne    70 <main+0x70>
  85:	89 ee                	mov    %ebp,%esi
  87:	85 c0                	test   %eax,%eax
  89:	74 11                	je     9c <main+0x9c>
  8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  90:	89 de                	mov    %ebx,%esi
  92:	01 ee                	add    %ebp,%esi
  94:	89 eb                	mov    %ebp,%ebx
  96:	89 f5                	mov    %esi,%ebp
  98:	ff c8                	dec    %eax
  9a:	75 f4                	jne    90 <main+0x90>
  9c:	83 c6 03             	add    $0x3,%esi
  9f:	bf 00 00 00 00       	mov    $0x0,%edi
  a4:	31 c0                	xor    %eax,%eax
  a6:	e8 00 00 00 00       	call   ab <main+0xab>
  ab:	31 c0                	xor    %eax,%eax
  ad:	48 83 c4 08          	add    $0x8,%rsp
  b1:	5b                   	pop    %rbx
  b2:	5d                   	pop    %rbp
  b3:	c3                   	ret
