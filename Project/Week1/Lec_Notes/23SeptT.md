# Tutorial Notes Date: 23rd September 2024
---

## Five Stages of Instruction Cycle:

1. Instruction Fetch
2. Instruction Decode
3. Execute
4. Memory Access/Write
5. Register Update

## Question:

Assume 2ns for instruction/data memory, 1ns for decode/register read, 2ns for ALU and 1ns for register write.
| Instruction | IF | ID | EX | MEM | WB | Total |
| --- | --- | --- | --- | --- | --- | --- |
| **R-Type** | 2 | 1 | 2 | 0 | 1 | 6ns |
| **LW(I)** | 2 | 1 | 2 | 2 | 1 | 8ns |
| **SW(I)** | 2 | 1 | 2 | 2 | 0 | 7ns |
| **BRANCH** | 2 | 1 | 2 | 0 | 0 | 5ns |
| **JUMP** | 2 | 1 | 2 | 0 | 0 | 5ns |

So that clock period to be used for single cycle processor is max(8,7,6,5) = **8ns**.

## Short vs Long Jumps in MIPS:

- The op code for jump instruction has the devision as 6 bits and the rest of the 26 bits are used for the address.
- The 26 bits are then shifted left by 2 bits with 0s in the 2 rightmost bits.

### Short Jump:
- We use the 4 bits from the PC as the 4 bits of the address to make it 32 bits.

### Long Jump:


| Stack |
| --- | 
| |
| |
| |
| Heap |
| |
| Data |
| | 
| Code | 
