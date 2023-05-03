.data
	sr: .asciiz "SR\n"
	ii: .asciiz "II\n"
	mi: .asciiz "MI\n"
	mm: .asciiz "MM\n"
	ms: .asciiz "MS\n"
	ss: .asciiz "SS\n"
.text
main:
	li   $v0, 5
	syscall
	add  $t0, $zero, $v0
	slti $t1, $t0,   1
	bne  $t1, $zero, SR
	slti $t1, $t0,   30
	bne  $t1, $zero, II
	slti $t1, $t0,   50
	bne  $t1, $zero, MI
	slti $t1, $t0,   70
	bne  $t1, $zero, MM
	slti $t1, $t0,   90
	bne  $t1, $zero, MS
	li   $v0, 4
	la   $a0, ss
	syscall
	j exit
SR: li   $v0, 4
	la   $a0, sr
	syscall
	j exit
II: li   $v0, 4
	la   $a0, ii
	syscall
	j exit
MI: li   $v0, 4
	la   $a0, mi
	syscall
	j exit
MM: li   $v0, 4
	la   $a0, mm
	syscall
	j exit
MS: li   $v0, 4
	la   $a0, ms
	syscall
	j exit
exit:
	li   $v0, 10
	syscall
