.data
	overflow: .asciiz "overflow"
	newline: .asciiz "\n"
.text
main:
	li   $v0, 5
	syscall
	add  $s0, $zero, $v0
	li   $v0, 5
	syscall
	add  $s1, $zero, $v0
	li   $v0, 5
	syscall
	add  $s2, $zero, $v0
	beq  $s0, $zero, UN
	addu $t0, $s1,   $s2
	xor  $t3, $s1,   $s2  
	slt  $t3, $t3,   $zero
	bne  $t3, $zero, NO
	xor  $t3, $t0,   $s2
	slt  $t3, $t3,   $zero
	bne  $t3, $zero, OV
	j    NO
UN:	nor  $t3, $s1,   $zero
	sltu $t3, $t3,   $s2
	bne  $t3, $zero, OV
NO:	add  $t0, $s1,   $s2   
	li   $v0, 1
	move $a0, $t0
	syscall
	j    exit
OV:	li   $v0, 4
	la   $a0, overflow
	syscall
exit:
	li   $v0, 4
	la   $a0, newline
	syscall
	li   $v0, 10
	syscall
