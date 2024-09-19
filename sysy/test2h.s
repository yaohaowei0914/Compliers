    .file   "test2.c"
    .option nopic
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
    .attribute unaligned_access, 0
    .attribute stack_align, 16

    .section    .rodata
    .align  3
.LC0:
    .word   64
    .word   34
    .word   25
    .word   12
    .word   22
    .word   11
    .word   90
.LC1:
    .string "%d "
.LC2:
    .string "原数组: "
.LC3:
    .string "排序后的数组: "

    .text
    .align  1
    .globl  main
    .type   main, @function
main:
    # Function prologue
    addi    sp, sp, -48
    sd      ra, 40(sp)
    sd      s0, 32(sp)
    addi    s0, sp, 48

    # Load array into stack
    lui     a5, %hi(.LC0)
    addi    a5, a5, %lo(.LC0)
    ld      a2, 0(a5)
    ld      a3, 8(a5)
    ld      a4, 16(a5)
    sd      a2, -48(s0)
    sd      a3, -40(s0)
    sd      a4, -32(s0)
    lw      a5, 24(a5)
    sw      a5, -24(s0)

    # Set n = 7
    li      a5, 7
    sw      a5, -20(s0)

    # Print "原数组: "
    lui     a5, %hi(.LC2)
    addi    a0, a5, %lo(.LC2)
    call    puts

    # Call printArray(arr, n)
    lw      a4, -20(s0)       # a4 = n
    addi    a5, s0, -48       # a5 = &arr
    mv      a1, a4            # a1 = n
    mv      a0, a5            # a0 = arr
    call    printArray

    # Call bubbleSort(arr, n)
    lw      a4, -20(s0)       # a4 = n
    addi    a5, s0, -48       # a5 = &arr
    mv      a1, a4            # a1 = n
    mv      a0, a5            # a0 = arr
    call    bubbleSort

    # Print "排序后的数组: "
    lui     a5, %hi(.LC3)
    addi    a0, a5, %lo(.LC3)
    call    puts

    # Call printArray(arr, n)
    lw      a4, -20(s0)       # a4 = n
    addi    a5, s0, -48       # a5 = &arr
    mv      a1, a4            # a1 = n
    mv      a0, a5            # a0 = arr
    call    printArray

    # Return 0
    li      a5, 0
    mv      a0, a5

    # Function epilogue
    ld      ra, 40(sp)
    ld      s0, 32(sp)
    addi    sp, sp, 48
    jr      ra
    .size   main, .-main

    .align  1
    .globl  bubbleSort
    .type   bubbleSort, @function
bubbleSort:
    # Function prologue
    addi    sp, sp, -48
    sd      ra, 40(sp)
    sd      s0, 32(sp)
    addi    s0, sp, 48
    sd      a0, -40(s0)       # arr
    sw      a1, -44(s0)       # n
    sw      zero, -20(s0)     # i = 0
    j       .L_outer_cond

.L_outer_loop:
    sw      zero, -24(s0)     # j = 0
    j       .L_inner_cond

.L_inner_loop:
    # Load arr[j]
    lw      a5, -24(s0)       # a5 = j
    slli    a5, a5, 2         # a5 = j * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[j]
    lw      a3, 0(a5)         # a3 = arr[j]

    # Load arr[j+1]
    lw      a5, -24(s0)       # a5 = j
    addi    a5, a5, 1         # a5 = j + 1
    slli    a5, a5, 2         # a5 = (j + 1) * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[j+1]
    lw      a5, 0(a5)         # a5 = arr[j+1]

    # Compare arr[j] and arr[j+1]
    mv      a4, a3            # a4 = arr[j]
    ble     a4, a5, .L_no_swap

    # Swap arr[j] and arr[j+1]
    # temp = arr[j]
    lw      a5, -24(s0)       # a5 = j
    slli    a5, a5, 2         # a5 = j * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[j]
    lw      a5, 0(a5)         # a5 = arr[j]
    sw      a5, -28(s0)       # temp = arr[j]

    # arr[j] = arr[j+1]
    lw      a5, -24(s0)       # a5 = j
    addi    a5, a5, 1         # a5 = j + 1
    slli    a5, a5, 2         # a5 = (j + 1) * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[j+1]
    lw      a4, 0(a5)         # a4 = arr[j+1]
    lw      a5, -24(s0)       # a5 = j
    slli    a5, a5, 2         # a5 = j * 4
    ld      a3, -40(s0)       # a3 = arr
    add     a5, a3, a5        # a5 = &arr[j]
    sw      a4, 0(a5)         # arr[j] = arr[j+1]

    # arr[j+1] = temp
    lw      a5, -24(s0)       # a5 = j
    addi    a5, a5, 1         # a5 = j + 1
    slli    a5, a5, 2         # a5 = (j + 1) * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[j+1]
    lw      a4, -28(s0)       # a4 = temp
    sw      a4, 0(a5)         # arr[j+1] = temp

.L_no_swap:
    # Increment j
    lw      a5, -24(s0)
    addiw   a5, a5, 1
    sw      a5, -24(s0)

.L_inner_cond:
    # if (j < n - i - 1)
    lw      a5, -44(s0)       # a5 = n
    lw      a4, -20(s0)       # a4 = i
    subw    a5, a5, a4        # a5 = n - i
    sext.w  a5, a5
    addiw   a5, a5, -1        # a5 = n - i - 1
    sext.w  a4, a5
    lw      a5, -24(s0)       # a5 = j
    sext.w  a5, a5
    blt     a5, a4, .L_inner_loop

    # Increment i
    lw      a5, -20(s0)
    addiw   a5, a5, 1
    sw      a5, -20(s0)

.L_outer_cond:
    # if (i < n - 1)
    lw      a5, -44(s0)       # a5 = n
    addiw   a5, a5, -1
    sext.w  a4, a5
    lw      a5, -20(s0)       # a5 = i
    sext.w  a5, a5
    blt     a5, a4, .L_outer_loop

    # Function epilogue
    ld      ra, 40(sp)
    ld      s0, 32(sp)
    addi    sp, sp, 48
    jr      ra
    .size   bubbleSort, .-bubbleSort

    .align  1
    .globl  printArray
    .type   printArray, @function
printArray:
    # Function prologue
    addi    sp, sp, -48
    sd      ra, 40(sp)
    sd      s0, 32(sp)
    addi    s0, sp, 48
    sd      a0, -40(s0)       # arr
    sw      a1, -44(s0)       # size
    sw      zero, -20(s0)     # i = 0
    j       .L_print_cond

.L_print_loop:
    # Load arr[i]
    lw      a5, -20(s0)       # a5 = i
    slli    a5, a5, 2         # a5 = i * 4
    ld      a4, -40(s0)       # a4 = arr
    add     a5, a4, a5        # a5 = &arr[i]
    lw      a5, 0(a5)         # a5 = arr[i]
    mv      a1, a5            # a1 = arr[i]
    lui     a5, %hi(.LC1)
    addi    a0, a5, %lo(.LC1) # a0 = "%d "
    call    printf

    # Increment i
    lw      a5, -20(s0)
    addiw   a5, a5, 1
    sw      a5, -20(s0)

.L_print_cond:
    # if (i < size)
    lw      a5, -20(s0)       # a5 = i
    lw      a4, -44(s0)       # a4 = size
    sext.w  a5, a5
    sext.w  a4, a4
    blt     a5, a4, .L_print_loop

    # Print newline
    li      a0, 10            # ASCII code for '\n'
    call    putchar

    # Function epilogue
    ld      ra, 40(sp)
    ld      s0, 32(sp)
    addi    sp, sp, 48
    jr      ra
    .size   printArray, .-printArray
