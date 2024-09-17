	.text
	.file	"main.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	xorl	%ebx, %ebx
	leaq	4(%rsp), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	$.L.str.1, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %ebp
	movl	$.L.str.1, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	4(%rsp), %edx
	movl	$4, %esi
	cmpl	$2, %edx
	jl	.LBB0_7
# %bb.1:
	leal	-1(%rdx), %ecx
	addl	$-2, %edx
	movl	%ecx, %eax
	andl	$7, %eax
	cmpl	$7, %edx
	jb	.LBB0_4
# %bb.2:
	andl	$-8, %ecx
	movl	$1, %ebp
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	addl	%ebp, %ebx
	addl	%ebx, %ebp
	addl	%ebp, %ebx
	addl	%ebx, %ebp
	addl	%ebp, %ebx
	addl	%ebx, %ebp
	addl	%ebp, %ebx
	addl	%ebx, %ebp
	addl	$-8, %ecx
	jne	.LBB0_3
.LBB0_4:
	movl	%ebp, %esi
	testl	%eax, %eax
	je	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	addl	%ebp, %esi
	movl	%ebp, %ebx
	movl	%esi, %ebp
	decl	%eax
	jne	.LBB0_5
.LBB0_6:
	addl	$3, %esi
.LBB0_7:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
