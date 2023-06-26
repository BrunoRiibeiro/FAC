.data
 	zero: .double 0.0
	nine: .double 9.0
	five: .double 5.0
	thirtytwo: .double 32.0
	kelvin: .double 273.15
	temp1: .space 5
	temp2: .space 5
	newline: .asciiz "\n"
.text
main:
	ldc1  $f12, zero
	li    $v0,  8
	la    $a0,  temp1
	la    $a1,  5
	syscall
	li    $v0,  8
	la    $a0,  temp2
	la    $a1,  5
	syscall
	li    $v0,  7
	syscall
	add.d $f12, $f12, $f0
	lb    $t0,  temp1($zero)
	lb    $t1,  temp2($zero)
	addi  $t8,  $zero, 67
	addi  $t7,  $zero, 70
	addi  $t6,  $zero, 75
	ldc1  $f2,  nine
	ldc1  $f4,  five
	ldc1  $f6,  thirtytwo
	ldc1  $f8,  kelvin
	ldc1  $f10, zero
	beq   $t0,  $t8,  C
	beq   $t0,  $t7,  F
	beq   $t0,  $t6,  K
C:	beq   $t1,  $t7,  CF
	beq   $t1,  $t6,  CK
F:	beq   $t1,  $t8,  FC
	beq   $t1,  $t6,  FK
K:	beq   $t1,  $t8,  KC
	beq   $t1,  $t7,  KF
CF:	mul.d $f12, $f12, $f2
	div.d $f12, $f12, $f4
	add.d $f12, $f12, $f6
	j     exit
CK:	add.d $f12, $f12, $f8
	j     exit
FC:	sub.d $f12, $f12, $f6
	mul.d $f12, $f12, $f4
	div.d $f12, $f12, $f2
	j     exit
FK:	sub.d $f12, $f12, $f6
	mul.d $f12, $f12, $f4
	div.d $f12, $f12, $f2
	add.d $f12, $f12, $f8
	j     exit
KC:	sub.d $f12, $f12, $f8
	j     exit
KF:	sub.d $f12, $f12, $f8
	mul.d $f12, $f12, $f2
	div.d $f12, $f12, $f4
	add.d $f12, $f12, $f6
exit:
	li    $v0,  3
	syscall
	la    $a0,  newline
	li    $v0,  4
	syscall
	li    $v0,  10
	syscall
