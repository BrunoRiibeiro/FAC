multfac:
	addi $t2, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $a1,   0
	addi $t5, $zero, 0
	addi $t6, $zero, 32
L0:	andi $t4, $t0,   1
	andi $t3, $t1,   1
	xor  $t7, $t3,   $t2 
	beq  $t7, $zero, L1
	beq  $t2, $zero, SU    
	add  $t0, $t0,   $a0
	j    L1
SU:	sub  $t0, $t0,   $a0
L1:	andi $t4, $t0,   1
	andi $t3, $t1,   1
	sra  $t0, $t0,   1
	srl  $t1, $t1,   1
	add  $t2, $t3,   $zero
	sll  $t4, $t4,   31
	add  $t1, $t1,   $t4
	addi $t5, $t5,   1
	slt  $t8, $t5,   $t6
	bne  $t8, $zero, L0
	mthi $t0
	mtlo $t1
	jr   $ra
