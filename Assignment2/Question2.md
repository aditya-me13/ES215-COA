## Problem Statement:
Write an assembly language program to find the average of 15 numbers stored at consecutive locations in memory. (15 Points)

## Solution:

This program demonstrates how to find the average of 15 numbers that are stored consecutively in memory. The program fetches each number, sums them, and then divides the sum by 15 to calculate the average.

### Steps:
1. Initialize a loop to iterate over the 15 consecutive memory locations.
2. Fetch each number from memory and accumulate the sum.
3. Divide the total sum by 15 to compute the average.
4. Store the result in a register.

### Instructions:

```mips
# Initialize registers
    li      $t0, 0          # $t0 will hold the sum, initialize to 0
    li      $t1, 15         # $t1 is the loop counter, set to 15
    la      $t2, numbers    # $t2 holds the base address of the numbers in memory
    li      $t3, 0          # $t3 will hold each fetched number
    li      $t4, 0          # $t4 will store the average

# Loop to sum the 15 numbers
sum_loop:
    lw      $t3, 0($t2)     # Load the current number from memory into $t3
    add     $t0, $t0, $t3   # Add the current number to the sum
    addi    $t2, $t2, 4     # Move to the next memory location (increment by 4 bytes)
    subi    $t1, $t1, 1     # Decrease the loop counter
    bnez    $t1, sum_loop   # If $t1 is not zero, repeat the loop

# Divide the total sum by 15 to get the average
    li      $t1, 15         # Reload the divisor (15) into $t1
    div     $t0, $t1        # Divide the sum by 15
    mflo    $t4             # Move the quotient (average) into $t4
```
