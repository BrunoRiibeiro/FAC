.data
	newline: .asciiz "\n"
	space: .asciiz " "
.text
main:
	li   $v0, 5
	syscall
	add  $s0, $zero, $v0
	add  $t1, $zero, $zero
L1:	beq  $t1, $s0,   P2
	addi $t1, $t1,   1
	add  $t2, $zero, $zero
C1:	beq  $t2, $t1,   N1
	add  $a1, $zero, $t1
	jal  Z
	li   $v0, 1
	add  $a0, $zero, $t1
	syscall
	addi $t2, $t2,   1
	li   $v0, 4
	la   $a0, space
	syscall
	j    C1
N1: li   $v0, 4
	la   $a0, newline
	syscall
	j    L1

P2:	add  $t1, $zero, $zero
L2: bgt  $t1, $s0,   exit
	addi $t1, $t1,   1
	addi $t2, $zero, 1
C2: beq  $t2, $t1,   N2
	add  $a1, $zero, $t2
	jal  Z
	li   $v0, 1
	add  $a0, $zero, $t2
	syscall
	li   $v0, 4
	la   $a0, space
	syscall
	addi $t2, $t2,   1
	j    C2
N2: li   $v0, 4
	la   $a0, newline
	syscall
	j    L2

Z:  slti $t0, $a1,   10
	beq  $t0, $zero, RT
	li   $v0, 1
	add  $a0, $zero, $zero
	syscall
RT: jr   $ra

exit:
	li   $v0, 10
	syscall
