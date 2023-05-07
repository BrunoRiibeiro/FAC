.data
	char: .space 3
	string: .space 10000
	newline: .asciiz "\n"
.text
main:
	li   $v0, 8
	la   $a0, char	
	la   $a1, 3
	syscall
	li   $v0, 5
	syscall
	add  $t0, $zero, $v0
	li   $v0, 8
	la   $a0, string
	addi $a1, $t0,   1
	syscall
	li   $t1, 0
	lb   $t2, char($t1)
	beq  $t2, 'M',   CAPS 
	beq  $t2, 'm',   LOW
	bne  $t2, 'c',   exit
CAPT:	
	lb   $t4, string($t1)
	beq  $t4, $zero, exit
	blt  $t4, 'a',   L0
	bgt  $t4, 'z',   L0
	sub  $t4, $t4,   32
	sb   $t4, string($t1)
L0: addi $t1, $t1,   1
	lb   $t4, string($t1)
	beq  $t4, $zero, exit
	beq  $t4, ' ',   L1
	blt  $t4, 'A',   L0
	bgt  $t4, 'Z',   L0
	addi $t4, $t4,   32
	sb   $t4, string($t1)
	j    L0
L1: addi $t1, $t1,   1
	j    CAPT
CAPS:
	lb   $t4, string($t1)
	beq  $t4, $zero, exit
	blt  $t4, 'a',   L2
	bgt  $t4, 'z',   L2
	sub  $t4, $t4,   32
	sb   $t4, string($t1)
L2:	addi $t1, $t1,   1
	j    CAPS
LOW:
	lb   $t4, string($t1)
	beq  $t4, $zero, exit
	blt  $t4, 'A',   L3
	bgt  $t4, 'Z',   L3
	addi $t4, $t4,   32
	sb   $t4, string($t1)
L3: addi $t1, $t1,   1
	j    LOW
exit:
	li   $v0, 4
	la   $a0, string
	syscall
	li   $v0, 4
	la   $a0, newline
	syscall
	li $v0, 10
	syscall
