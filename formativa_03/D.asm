.data
 	newline: .asciiz "\n"
	zero: .double 0.0
.text
main:
	li    $v0,  5
	syscall
	move  $t0,  $v0
	lwc1  $f2,  zero
	lwc1  $f4,  zero
	lwc1  $f6,  zero
	move  $t1,  $zero
L0:	beq   $t1,  $t0, exit
	li    $v0,  7
	syscall
	add.d $f8,  $f0, $f6
	add.d $f4,  $f4, $f8
	li    $v0,  7
	syscall
	add.d $f10, $f0, $f6
	mul.d $f14, $f8, $f10
	add.d $f2,  $f2, $f14
	addi  $t1,  $t1, 1
	j     L0
exit:
	div.d $f12, $f2, $f4
	li    $v0,  3
	syscall
	la    $a0,  newline
	li    $v0,  4
	syscall
	li    $v0,  10
	syscall