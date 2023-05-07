bitparidade:
	addi $t0, $zero, 7
	addi $t1, $zero, 0
	addi $t2, $zero, 2
	addi $v0, $zero, 0
	addi $sp, $sp,   -12
	add  $v1, $zero, $a0	
	add  $t5, $zero, $a0
	sw   $ra, 0($sp)
	sw   $v0, 4($sp)
	sw   $v1, 8($sp)
L:  addi $t0, $t0,   -1
	blt  $t0, $zero, PR
	andi $t3, $t5,   1
	srl  $t5, $t5,   1
	beq  $t3, $zero, J
	addi $t1, $t1,   1
J:	j    L
PR: div  $t1, $t2
	mfhi $t4
	lw   $v1, 8($sp)
	lw   $v0, 4($sp)
	beq  $t4, $zero, RT
	addi $v1, $v1,   128
	addi $v0, $v0,   1
RT: lw   $ra, 0($sp)
	addi $sp, $sp,   12
	jr   $ra
