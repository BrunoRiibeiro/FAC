.data
	newline: .asciiz "\n"
	input: .space 34
	decimal: .space 256 
		     .align 2 
	str85: .space 256 
		   .align 2 
	invalid: .asciiz "Entrada invalida.\n"
	ASCII85: .byte '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '.', '-', ':', '+', '=', '^', '!', '/', '*', '?', '&', '<', '>', '(', ')', '[', ']', '{', '}', '@', '%', '$', '#'
.text
main:
	li   $v0, 8
	la   $a0, input
	la   $a1, 34
	syscall
	jal  LT
	jal  SD
	jal  PR
	li   $v0, 4
	la   $a0, newline
	syscall
exit:
	li   $v0, 10
	syscall
PI:	li   $v0, 4
	la   $a0, invalid
	syscall
	j    exit
PR:	addi $t6, $t6, -4
	la   $t1, ($t7)
	mul  $t1, $t1, 4
	addi $t2, $t7, -1
	add  $t3, $t1, $t2
LP:	bltz $t3, ED
	lw   $t4, str85($t6)
	lb   $a0, ASCII85($t4)
	li   $v0, 11
	syscall
	addi $t3, $t3, -1
	addi $t6, $t6, -4
	j    LP
LT:	lb   $t0, newline
	li   $t1, 0
	li   $t2, 0
	li   $t5, 0
L1:	lb   $t3, input($t2)
	bne  $t3, $t0, L2
	rem  $t2, $t1, 4
	beqz $t2, ED
	j    PI
L2:	sll  $t4, $t4, 8
	or   $t4, $t4, $t3
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	rem  $t6, $t2, 4
	bnez $t6, L1
	sw   $t4, decimal($t5)
	addi $t5, $t5, 4
	addi $t7, $t7, 1
	j    L1
SD:	la   $t0, ($t7)
	addi $t0, $t0, -1
	mul  $t1, $t0, 4
L3:	bltz $t0, ED
	lw   $t2, decimal($t1)
	la   $t3, ($t2)
	li   $t4, 0
L4:	beq  $t4, 5,   CD
	rem  $t5, $t3, 85		
	div  $t3, $t3, 85
	sw   $t5, str85($t6)
	addi $t4, $t4, 1
	addi $t6, $t6, 4
	j    L4
CD: addi $t0, $t0, -1
	addi $t1, $t1, -4
	j    L3
ED: jr   $ra
