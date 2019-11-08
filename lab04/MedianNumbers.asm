# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data
	prompt: .asciiz "Enter the next number:\n"
	result: .asciiz "Median: "

.text

main:
  #print prompt
  li $v0, 4
  la $a0, prompt
  syscall

  # Take in first value
	li $v0, 5
	syscall
	move $t0, $v0

  #print prompt
  li $v0, 4
  la $a0, prompt
  syscall

  # Take in second value
	li $v0, 5
	syscall
	move $t1, $v0

  #print prompt
  li $v0, 4
  la $a0, prompt
  syscall

  # Take in third value
	li $v0, 5
	syscall
	move $t2, $v0

  # test for first being middle
first_comp:
  blt $t0, $t1, second_comp
  #swap
  move $t4, $t1
  move $t1, $t0
  move $t0, $t4

second_comp:
  blt $t1, $t2, third_comp
  #swap
  move $t4, $t2
  move $t2, $t1
  move $t1, $t4

third_comp:
  blt $t0, $t1, print_result
  #swap
  move $t4, $t1
  move $t1, $t0
  move $t0, $t4

print_result:
  li $v0, 4
  la $a0, result
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

exit:
	# Exit
	li $v0, 10
	syscall
