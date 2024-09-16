## Problem Statement:
Write an assembly language program to calculate the multiplication of two numbers without using the `MUL` command. (20 Points)

## Solution:

This program demonstrates how to calculate the product of two numbers without using the `MUL` (multiplication) instruction. The approach used here is based on iterative addition: multiplying a number is equivalent to adding it repeatedly.

### Steps:
1. Load the two numbers from memory.
2. Initialize a loop where the first number is added to the result register as many times as indicated by the second number.
3. Use a loop and decrement the second number until it reaches zero.
4. Store the result in a register.

### Instructions:

```mips
# Initialize registers
    la      $t0, num1        # Load the address of the first number into $t0
    la      $t1, num2        # Load the address of the second number into $t1
    lw      $a0, 0($t0)      # Load the first number into $a0 (multiplier)
    lw      $a1, 0($t1)      # Load the second number into $a1 (multiplicand)

    li      $t2, 0           # Initialize $t2 to store the result (set to 0)
    move    $t3, $a1         # Copy $a1 (multiplicand) to $t3 (loop counter)

# Loop for multiplication by repeated addition
mult_loop:
    beq     $t3, $zero, mult_done   # If $t3 is 0, we are done
    add     $t2, $t2, $a0           # Add $a0 (multiplier) to $t2 (result)
    subi    $t3, $t3, 1             # Decrease the loop counter by 1
    j       mult_loop               # Repeat the loop

mult_done:
    move    $t4, $t2                # Move the result to $t4
```
