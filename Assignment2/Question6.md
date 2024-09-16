## Problem Statement:
Write an assembly language program to find a given character in a string. (20 Points)

## Solution:

This program demonstrates how to search for a given character in a string. If the character is found, the program will store `1` in the output and store the index of the found character in memory. If the character is not found, it will store `2` in the output.

### Steps:
1. Load the string and the character to search for from memory.
2. Use a loop to compare each character in the string with the given character.
3. If the character is found, store `1` in the output and store the index of the character.
4. If the character is not found, store `2` in the output.

### Instructions:

```mips
# Initialize registers
    la      $t0, char           # Load the address of the character to search into $t0
    lb      $a0, 0($t0)         # Load the character to search into $a0
    la      $t1, string         # Load the address of the string into $t1
    li      $t2, 0              # Initialize index counter $t2 to 0

# Loop through the string
search_loop:
    lb      $t3, 0($t1)         # Load the current character from the string into $t3
    beq     $t3, $zero, not_found  # If null terminator is reached, jump to not_found
    beq     $a0, $t3, found        # If the characters match, jump to found
    addi    $t1, $t1, 1            # Move to the next character in the string
    addi    $t2, $t2, 1            # Increment the index counter
    j       search_loop            # Repeat the loop

# If the character is not found, store 2 in the output
not_found:
    la      $t4, output           # Load the address of the output location into $t4
    li      $t5, 2                # Load 2 into $t5 (for "not found")
    sw      $t5, 0($t4)           # Store 2 in the output
    j       end_program           # Jump to the end of the program

# If the character is found, store 1 in the output and save the index
found:
    la      $t4, output           # Load the address of the output location into $t4
    li      $t5, 1                # Load 1 into $t5 (for "found")
    sw      $t5, 0($t4)           # Store 1 in the output
    addi    $t4, $t4, 4           # Move to the next memory location
    sw      $t2, 0($t4)           # Store the index of the found character

# End of the program
end_program:
    nop                           # No operation (end of the program)

# Data section
    .data
char:    .byte 'a'                # The character to search for (replace 'a' with desired character)
string:  .asciiz "hello world"     # The string to search in (replace with the actual string)
output:  .space 8                 # Space to store the result and the index of the found character
