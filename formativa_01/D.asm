.data
	newline: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	move $s0, $v0
	li $v0, 5
	syscall
	move $s1, $v0
	li $v0, 5
	syscall
	move $s2, $v0
	add $t0, $s1, $s2
	sub $s3, $s0, $t0
	slt $t1, $s1, $s2
	bne $t1, $zero, else
	slt $t3, $s3, $s1
	bne $t3, $zero, printone	
	li $v0, 1
	move $a0, $s3
	syscall
	j exit

else:
	slt $t2, $s3, $s2
	bne $t2, $zero, printtwo
	li $v0, 1
	move $a0, $s3
	syscall
	j exit

printone:
	li $v0, 1
	move $a0, $s1
	syscall
	j exit

printtwo:
	li $v0, 1
	move $a0, $s2
	syscall
	j exit

exit:
	li $v0, 4
	la $a0, newline
	syscall
	li $v0, 10
	syscall
