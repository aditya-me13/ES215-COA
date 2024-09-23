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




