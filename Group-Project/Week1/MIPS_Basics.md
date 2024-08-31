# MIPS Basics

## Basics:
- It's one of the most popular processor architectures in the world.
- It's a _load-store_ architecture.

### 1. Registers:

![Register](/Project/Week1/Photos/register.png)

- 32 units of Registers (32-bit each).
- Each register is word addressable.
- Inside the CPU so access is very fast.
- Each Register stores a 32-bit value of a variable.
- Registers are represented like $0, $1, $2, $3... $31.
- Need 5 bit bus to address all the registers.

![Register](/Project/Week1/Photos/register2.png)

- Basic Registers:
1. $0 is the zero register always wired to 0.
2. $8 - $15 ($t0 - $t7) are temporary registers. (Values will be forgoten after the operation.)
3. $16 - $23 ($s0 - $s7) are saved registers. (Values will be saved after the operation.)
4. $24 - $25 ($t8 - $t9) are more temporary registers. (Values will be forgoten after the operation.)

- Procedure/ Functions:
1. $2 and $3 ($v0, $v1) are used to store results form procedures.
2. $4 - $7 ($a0 - $a3) are used to pass parameters/arguments to procedures.



### 2. Memory:
- 4GB of memory.
- Each Memory location is 8-bit.
- Each memory location is byte addressable.
- Mempory is external and thus slower than registers to access.
- Use memory to load and store only and perform the operations on registers.

![Memory](/Project/Week1/Photos/memory.png)

- Each Memory location is 8-bit, but the registers are 32-bit.
- So, 4 memory locations store a single data from a register. 
- Hence the memory locations are incremetal in batch of 4 as seen in the above image.

### 3. MIPS Instructions:
- There are 3 types of instructions:
  - R-type:
  - I type:
  - J type:
