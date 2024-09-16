# Question 1:
---

## Problem Statement:
Write a program in assembly language to subtract two 16 bit numbers without using the subtraction instruction. Note: the numbers have to be fetched from the memory. (10 Points)

## Solution:

This program demonstrates how to subtract two 16-bit numbers stored in memory without using the `sub` (subtraction) instruction. The numbers are fetched from the memory, where the stack pointer (`$sp`) points to the first number, and the second number is located just below the first number.

### Steps:
1. Fetch the two numbers from memory into registers.
2. Negate the second number by computing its 2's complement (invert the bits and add 1).
3. Add the first number and the negated second number to perform the subtraction.

### Instructions:

```mips
# Load the first half-word (16-bit) from the top of the stack into register $s0
# and the second half-word (at an offset of 4 bytes from the top of the stack) into register $s1
lh      $s0, 0($sp)
lh      $s1, 4($sp)

# Invert all bits of the second number (2's complement step 1) using NOR with zero
nor     $s1, $s1, $zero

# Add 1 to the inverted number to complete the 2's complement
addi    $s1, $s1, 1

# Add the first number and the negated second number, storing the result in register $t0
add     $t0, $s0, $s1
