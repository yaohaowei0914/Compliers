	.file	"test3.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	a
	.section	.sbss,"aw",@nobits
	.align	2
	.type	a, @object
	.size	a, 4
a:
	.zero	4
	.globl	b
	.align	2
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.globl	c
	.align	2
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	d
	.align	3
	.type	d, @object
	.size	d, 8
d:
	.zero	8
	.text
	.align	1
	.globl	max
	.type	max, @function
max:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L2
	lw	a5,-20(s0)
	j	.L3
.L2:
	lw	a5,-24(s0)
.L3:
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	max, .-max
	.align	1
	.globl	max_
	.type	max_, @function
max_:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	fsd	fa0,-24(s0)
	fsd	fa1,-32(s0)
	fld	fa4,-24(s0)
	fld	fa5,-32(s0)
	fge.d	a5,fa4,fa5
	beq	a5,zero,.L9
	fld	fa5,-24(s0)
	j	.L7
.L9:
	fld	fa5,-32(s0)
.L7:
	fmv.d	fa0,fa5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	max_, .-max_
	.section	.rodata
	.align	3
.LC0:
	.string	"%d %d %f %lf"
	.align	3
.LC1:
	.string	"max (int) is: %d\n"
	.align	3
.LC2:
	.string	"max (float/double) is: %.2f\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	lui	a5,%hi(d)
	addi	a4,a5,%lo(d)
	lui	a5,%hi(c)
	addi	a3,a5,%lo(c)
	lui	a5,%hi(b)
	addi	a2,a5,%lo(b)
	lui	a5,%hi(a)
	addi	a1,a5,%lo(a)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	__isoc99_scanf
	lui	a5,%hi(a)
	lw	a4,%lo(a)(a5)
	lui	a5,%hi(b)
	lw	a5,%lo(b)(a5)
	mv	a1,a5
	mv	a0,a4
	call	max
	mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lui	a5,%hi(c)
	flw	fa5,%lo(c)(a5)
	fcvt.d.s	fa5,fa5
	lui	a5,%hi(d)
	fld	fa4,%lo(d)(a5)
	fmv.d	fa1,fa4
	fmv.d	fa0,fa5
	call	max_
	fmv.x.d	a5,fa0
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
