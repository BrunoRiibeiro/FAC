.data
	newline: .asciiz "\n"
.text
main:
	li  $v0, 5
	syscall
	add $s0, $zero, $v0
	li  $v0, 5
	syscall
	add $s1, $zero, $v0
	li  $v0, 5
	syscall
	add $s2, $zero, $v0
	add $t0, $s1,   $s2
	sub $s3, $s0,   $t0
	slt $t0, $s1,   $s2
	bne $t0, $zero, L1
	slt $t0, $s3,   $s1
	bne $t0, $zero, P1
	li  $v0, 1
	add $a0, $zero, $s3
	syscall
	j exit
L1: slt $t0, $s3,   $s2
	bne $t0, $zero, P2
	li  $v0, 1
	add $a0, $zero, $s3
	syscall
	j exit
P1: li  $v0, 1
	add $a0, $zero, $s1
	syscall
	j exit
P2: li  $v0, 1
	add $a0, $zero, $s2
	syscall
	j exit
exit:
	li  $v0, 4
	la  $a0, newline
	syscall
	li  $v0, 10
	syscall
