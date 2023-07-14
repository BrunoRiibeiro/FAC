elemDistintos:
	add  $v0, $zero, $zero
	add  $t0, $zero, $a0
	addi $t1, $a0,   4
	add  $t2, $zero, $zero
L0:	lw   $t3, 0($t0)
	lw   $t4, 0($t1)
	beq  $t3, $t4    NS
	addi $v0, $v0,   1
NS:	addi $t2, $t2,   1
	addi $t0, $t0,   4
	addi $t1, $t1,   4	
	blt  $t2, $a1,   L0
	jr   $ra
