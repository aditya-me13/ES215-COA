## Problem Statement:
Write an assembly language program to find the LCM of two numbers stored at consecutive locations in memory. (15 Points)

## Solution:

This program demonstrates how to find the Least Common Multiple (LCM) of two numbers stored at consecutive memory locations. The program will use the relationship between the Greatest Common Divisor (GCD) and LCM:

LCM(a, b) = |a × b| / GCD(a, b)

We will implement the Euclidean algorithm to compute the GCD, and then use this to calculate the LCM.

### Steps:
1. Load the two numbers from memory.
2. Use the Euclidean algorithm to compute the GCD of the two numbers.
3. Calculate the LCM using the formula:LCM(a, b) = |a × b| / GCD(a, b)
4. Store the LCM in a register.

### Assumptions:
1. `num1` stores the address where the first number is stored.
2. `num2` stores the address where the second number is stored.

### Instructions:

```mips
# Initialize registers
    la      $t0, num1        # Load the address of the first number into $t0
    la      $t1, num2        # Load the address of the second number into $t1
    lw      $a0, 0($t0)      # Load the first number into $a0
    lw      $a1, 0($t1)      # Load the second number into $a1

# Store original numbers for LCM calculation
    move    $t2, $a0         # Store number1 in $t2
    move    $t3, $a1         # Store number2 in $t3

# Euclidean algorithm to find GCD
gcd_loop:
    beq     $a1, $zero, gcd_done   # If $a1 is 0, GCD is in $a0
    div     $a0, $a1               # Divide $a0 by $a1
    mfhi    $a0                    # Move the remainder to $a0
    move    $a1, $a0               # Set $a1 to the remainder for the next iteration
    j       gcd_loop               # Repeat until remainder is 0

gcd_done:
    move    $t4, $a0               # Store GCD in $t4

# LCM calculation: LCM(a, b) = (a * b) / GCD
    mul     $t5, $t2, $t3          # Multiply the original numbers
    div     $t5, $t4               # Divide the product by the GCD
    mflo    $t6                    # Move the result (LCM) to $t6
```

We can further store the result from the register `$t6` to any desired memory location we want.