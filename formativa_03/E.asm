.data
	newline: .asciiz "\n"
	zero: .double 0.0
	hundred: .double 100.0
.text
 main:
	ldc1  $f2,  zero
	ldc1  $f4,  hundred
	ldc1  $f6,  zero
	li    $v0,  7
	syscall
	add.d $f8,  $f0, $f6
	add.d $f2,  $f2, $f8
	li    $v0,  7
	syscall
	add.d $f10, $f0,  $f6
	mul.d $f10, $f10, $f8
	div.d $f14, $f10, $f4
	add.d $f2,  $f2,  $f14
	li    $v0,  7
	syscall
	add.d $f10, $f0,  $f6
	mul.d $f10, $f10, $f8
	div.d $f10, $f10, $f4
	add.d $f2,  $f2,  $f10
exit:
	add.d $f12, $f2,  $f6
	li    $v0,  3
	syscall
	la    $a0,  newline
	li    $v0, 
	syscall
	li    $v0,  10
	syscall
