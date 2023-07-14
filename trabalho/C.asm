.data
	zero: .double 0.0
	one: .double 1.0
	two: .double 2.0
	ten: .double 10.0
	hundred: .double 101.0
	newline: .asciiz"\n"
	msg: .asciiz "Entradas invalidas.\n"
	nmsg1: .asciiz "Nao foi possivel calcular sqrt("
	nmsg2: .asciiz ").\n"
	end1: .asciiz "A raiz quadrada de "
	end2: .asciiz " eh "
	end3: .asciiz ", calculada em "
	end4: .asciiz " iteracoes.\n"
.text 
main:
	li      $v0,  5
	syscall
	add     $t0,  $zero, $v0
	li      $v0,  5
	syscall
	add     $t1,  $zero, $v0
	addi    $t2,  $zero, 1
	slti    $t7,  $t0,   1
	bne     $t7,  $zero, UN
	beq     $t0,  $t2,   UN
	addi    $t2,  $zero, 17
	slti    $t7,  $t1,   1
	bne     $t7,  $zero, UN
	slt     $t7,  $t1,   $t2
	beq     $t7,  $zero, UN
AG:	ldc1    $f2,  ten
	ldc1    $f4,  zero
	ldc1    $f6,  one
	ldc1    $f8,  one
	ldc1    $f10, one
	ldc1    $f12, zero
	ldc1    $f14, two
	ldc1    $f16, hundred
	ldc1    $f18, zero
	addi    $t3,  $zero, 1
L1:	addi    $t3,  $t3,   1
	mul     $t4,  $t3,   $t3  
	slt     $t5,  $t4,   $t0    
	bne     $t5,  $zero, L1
PC:	div.d   $f8,  $f8,   $f2
	addi    $t6,  $t6,   1
	slt     $t8,  $t6,   $t1
	bne     $t8,  $zero, PC
EX:	mtc1    $t0,  $f0
	cvt.d.w $f0,  $f0
	mtc1    $t3,  $f4
	cvt.d.w $f4,  $f4
	sub.d   $f2,  $f4,   $f6
	div.d   $f4,  $f0,   $f2
L2:	add.d   $f2,  $f2,   $f4
	div.d   $f2,  $f2,   $f14
	div.d   $f4,  $f0,   $f2
	add.d   $f10, $f10,  $f6
	c.lt.d  $f16, $f10
	bc1t    LT
	sub.d   $f12, $f2,   $f4
	abs.d   $f12, $f12
	c.lt.d  $f8,  $f12
	bc1t    L2
	la      $a0,  end1
	li      $v0,  4
	syscall
	add     $a0,  $zero, $t0
	li      $v0,  1
	syscall
	la      $a0,  end2
	li      $v0,  4
	syscall
	add.d   $f12, $f2,   $f18
	li      $v0,  3
	syscall
	la      $a0,  end3
	li      $v0,  4
	syscall
	add.d   $f12, $f10,  $f18
	li      $v0,  3
	syscall
	la      $a0,  end4
	li      $v0,  4
	syscall
	j       exit
LT:	la      $a0,  nmsg1
	li      $v0,  4
	syscall
	add     $a0,  $zero, $t0
	li      $v0,  1
	syscall
	la      $a0,  nmsg2
	li      $v0,  4
	syscall
	j       exit
UN:	la      $a0,  msg
	li      $v0,  4
	syscall
exit:
	li      $v0,  10
	syscall
