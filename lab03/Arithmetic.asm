# Arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
# 2*(a - b) + 3 * c

.text
main:
  # Take in a
  li $v0, 5
  syscall
  move $t0, $v0

  # Take in b
  li $v0, 5
  syscall
  move $t1, $v0

  # Take in c
  li $v0, 5
  syscall
  move $t2, $v0

  # 2*(a - b)
  sub $t0, $t0, $t1
  add $t0, $t0, $t0

  # 3 * c
  li $t3, 3
  mult $t3, $t2
  mflo $t3

  # 2*(a - b) + 3 * c
  add $t0, $t0, $t3

  # print result
  li $v0, 1
  move $a0, $t0
  syscall

exit:
	# Exit
	li $v0, 10
	syscall
