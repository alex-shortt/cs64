# hello.asm
# A "Hello World" program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables

.data
	prompt: .asciiz "Choose an integer number between 0 and 1000:\n"
	hello: .asciiz "Hello World!\n"
	mess_one: .asciiz "User chose "
	mess_two: .asciiz ". Truly a wise choice.\n"

#Text Area (i.e. instructions)
.text
main:
	# Print prompt
	li $v0, 4
	la $a0, prompt
	syscall

	# Take in a
	li $v0, 5
	syscall
	move $t0, $v0

	# Print hello
	li $v0, 4
	la $a0, hello
	syscall

	# Print mess_one
	li $v0, 4
	la $a0, mess_one
	syscall

	# Print mess_two
	li $v0, 1
	move $a0, $t0
	syscall

	# Print mess_two
	li $v0, 4
	la $a0, mess_two
	syscall

exit:
	# Exit
	li $v0, 10
	syscall
