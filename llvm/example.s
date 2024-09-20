	.text
	.file	"example.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -24
	movl	$0, -20(%rbp)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	-12(%rbp), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	movq	%rsp, -32(%rbp)
	leaq	15(,%rax,4), %rcx
	andq	$-16, %rcx
	movq	%rsp, %rbx
	subq	%rcx, %rbx
	movq	%rbx, %rsp
	movq	%rax, -40(%rbp)
	movl	-12(%rbp), %esi
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -16(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	-16(%rbp), %rax
	shlq	$2, %rax
	movq	%rbx, %rsi
	addq	%rax, %rsi
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-12(%rbp), %esi
	movq	%rbx, %rdi
	callq	printArray
	movl	-12(%rbp), %esi
	movq	%rbx, %rdi
	callq	average
	movss	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.5, %rdi
	movb	$1, %al
	callq	printf@PLT
	movl	$0, -20(%rbp)
	movq	-32(%rbp), %rsp
	movl	-20(%rbp), %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	printArray                      # -- Begin function printArray
	.p2align	4, 0x90
	.type	printArray,@function
printArray:                             # @printArray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movabsq	$.L.str.6, %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	printArray, .Lfunc_end1-printArray
	.cfi_endproc
                                        # -- End function
	.globl	average                         # -- Begin function average
	.p2align	4, 0x90
	.type	average,@function
average:                                # @average
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -12(%rbp)
	xorps	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	addss	-8(%rbp), %xmm0
	movss	%xmm0, -8(%rbp)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movss	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-12(%rbp), %xmm1
	divss	%xmm1, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	average, .Lfunc_end2-average
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\350\257\267\350\276\223\345\205\245\346\225\260\347\273\204\347\232\204\345\244\247\345\260\217: "
	.size	.L.str, 27

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\350\257\267\350\276\223\345\205\245 %d \344\270\252\346\265\256\347\202\271\346\225\260:\n"
	.size	.L.str.2, 28

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%f"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\346\225\260\347\273\204\344\270\255\347\232\204\345\205\203\347\264\240\346\230\257: "
	.size	.L.str.4, 24

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"\n\346\225\260\347\273\204\347\232\204\345\271\263\345\235\207\345\200\274\346\230\257: %.2f\n"
	.size	.L.str.5, 30

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"%.2f "
	.size	.L.str.6, 6

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
