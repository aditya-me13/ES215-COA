## Problem Statement:
Write an assembly language program to find a given number in a list of 10 sorted numbers. If found, store `1` in the output, else store `2`. The given number is loaded from location `X` in memory, and the output has to be stored at the next location. If the number is found, store the number of iterations and the index of the element at the next consecutive locations. (20 Points)

## Solution:

This program implements a search for a given number in a sorted list of 10 numbers. If the number is found, it stores `1` in the output and saves the number of iterations and the index of the found number. If not found, it stores `2` in the output.

### Steps:
1. Load the given number and the list of 10 sorted numbers from memory.
2. Use a loop to compare each number in the list with the given number.
3. If the number is found, store `1` in the output, the number of iterations, and the index of the found number.
4. If the number is not found, store `2` in the output.
5. We are assuming that the `numbers` stores the value of the firs number of the list.

### Instructions:

```mips
# Initialize registers
    la      $t0, X               # Load the address of the given number into $t0
    lw      $a0, 0($t0)          # Load the given number into $a0
    la      $t1, numbers         # Load the address of the sorted list into $t1
    li      $t2, 10              # Number of elements in the list (loop counter)
    li      $t3, 0               # Initialize iteration counter to 0
    li      $t4, 0               # Initialize index to 0

# Loop to search the number in the list
search_loop:
    lw      $t5, 0($t1)          # Load the current number from the list
    beq     $a0, $t5, found      # If the given number matches, jump to 'found'
    addi    $t1, $t1, 4          # Move to the next number in the list (increment address by 4 bytes)
    addi    $t3, $t3, 1          # Increment the iteration counter
    addi    $t4, $t4, 1          # Increment the index
    subi    $t2, $t2, 1          # Decrement the loop counter
    bnez    $t2, search_loop     # If the loop counter is not zero, repeat the loop

# If the number is not found, store 2 in the output
not_found:
    la      $t6, output          # Load the address of the output location
    li      $t7, 2               # Load 2 into $t7 (for "not found")
    sw      $t7, 0($t6)          # Store 2 in the output
    j       end_program          # Jump to end of the program

# If the number is found, store 1 in the output and save iteration count and index
found:
    la      $t6, output          # Load the address of the output location
    li      $t7, 1               # Load 1 into $t7 (for "found")
    sw      $t7, 0($t6)          # Store 1 in the output
    addi    $t6, $t6, 4          # Move to the next memory location
    sw      $t3, 0($t6)          # Store the number of iterations
    addi    $t6, $t6, 4          # Move to the next memory location
    sw      $t4, 0($t6)          # Store the index

# End of the program
end_program:
    nop                          # No operation (end of the program)
```

