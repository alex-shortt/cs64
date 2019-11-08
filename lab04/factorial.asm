# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial is:" << fn << "\n";
#
.data
	prompt: .asciiz "Enter the number:\n"
	result: .asciiz "Factorial is: "
	newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	#print prompt
	li $v0, 4
	la $a0, prompt
	syscall

	# Take in value
	li $v0, 5
	syscall
	move $t0, $v0

	#init result
	li $t1, 1

	#init cursor
	li $t2, 2

loop:
	bgt $t2, $t0, print_result
	mult $t1, $t2
	mflo $t1
	addi	$t2, $t2, 1
	j loop

print_result:
	#print result message
	li $v0, 4
	la $a0, result
	syscall

	# print number
	li $v0, 1
	move $a0, $t1
	syscall

	# print new line
	li $v0, 4
	la $a0, newline
	syscall

exit:
	# Exit
	li $v0, 10
	syscall
