.data
	newline: .asciiz "\n"
	invalid: .asciiz "Entrada invalida."
	isprime: .asciiz "sim"
	notprime: .asciiz "nao"
.text
main:		
	li      $v0,5
	syscall
	add     $s1, $zero, $v0 
	ble     $s1, $zero, IN
	beq     $s1, 1,     NP
	beq     $s1, 2,     PR
	li      $t4, 2
	div     $t3, $s1,   $t4
	mfhi    $t1
	beq     $t1, 0,     NP
	mtc1    $s1, $f2
	cvt.s.w $f2, $f2	
	sqrt.s  $f0, $f2
	cvt.w.s $f0, $f0
	mfc1    $a1, $f0
	li      $t2, 3
L0:	bgt     $t2, $a1,   PR
	div     $s3, $s1,   $t2
	mfhi    $t1
	beqz    $t1, NP
	addi    $t2, $t2,   2
	jal     L0
PR:	li      $v0, 4
	la,     $a0, isprime
	syscall
	j       exit
NP:	li      $v0, 4
	la,     $a0, notprime
	syscall
	j       exit
IN:	li      $v0, 4
	la,     $a0, invalid
	syscall
exit:
	li      $v0, 4
	la      $a0, newline
	syscall
	li      $v0, 10
	syscall