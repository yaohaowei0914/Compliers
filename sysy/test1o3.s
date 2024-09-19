	.file	"test1.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	max
	.type	max, @function
max:
	mv	a5,a0
	bge	a0,a1,.L2
	mv	a5,a1
.L2:
	sext.w	a0,a5
	ret
	.size	max, .-max
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d %d"
	.align	3
.LC1:
	.string	"max is: %d\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	s0,16(sp)
	sd	s1,8(sp)
	lui	s0,%hi(b)
	lui	s1,%hi(a)
	lui	a0,%hi(.LC0)
	addi	a1,s1,%lo(a)
	addi	a2,s0,%lo(b)
	addi	a0,a0,%lo(.LC0)
	sd	ra,24(sp)
	call	__isoc99_scanf
	lw	a4,%lo(b)(s0)
	lw	a5,%lo(a)(s1)
	sext.w	a1,a4
	blt	a5,a4,.L5
	sext.w	a1,a5
.L5:
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	printf
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.globl	b
	.globl	a
	.section	.sbss,"aw",@nobits
	.align	2
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.type	a, @object
	.size	a, 4
a:
	.zero	4
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
