# Lecture Notes Date: 3rd September 2024
---

## High Level Overview:

### Example 1:

High Level Code:
```a = b + c ```

- Operation: Addition
- Source Operands: b, c
- Destination Operand: a

MIPS assembly code:
``` add a,b,c ```
- _add_ is a mnemonic for the operation to be  performed.
- _b,c_ are source operands on which the operation is performed.
- _a_ is the destination operand to which the result is written.

> Mnemonic can also be add b,c,a; we just need to define the instructions accordingly.

### Design Principle: Simplicity favors regularity.
- Consistent instruction format.
- Same number of operands (two source and one destination) as it is easier to encode in hardware.

### Example 2 (More complex code):
High Level Code:
``` a = b + c - d ```

MIPS assembly code:

```
add t,b,c 
sub a,t,d
```
- _t_ is a temporary register.

### Example 3 (More complex code):
High Level Code:
``` a = b + c + d + e ```

MIPS assembly code:
#### Option 1:
```
add t0,b,c
add t1,d,e
add a,t0,t1
```
#### Option 2:
```
add t0,b,c
add t0,t0,d
add a,t0,e
```

- Option 2 uses the same register twice, while option 1 uses two different registers.
- Option 1 is better for speedup as it can be paralllelized. (i.e. add t0,b,c and add t1,t0,d can be done in parallel.)
- Option 2 is better for space as it uses less registers.

### Design Principle: Make the common case fast.
- MIPS includes only simple, commonly used instructions.
- Hardware to decode and execute the instructions is simple, smaller, and faster.
- More complex instructions are implemented using multiple simple instructions.

### Example 4 (More complex code):
High Level Code:
``` a = b + c - (d + e) ```

MIPS assembly code:
#### Option 1:
```
add t,b,c
add s,d,e
sub a,t,s
```
#### Option 2:
```
add t,d,e
sub s,b,c
sub a,s,t
```

#### Option 3:
```
add t,b,c
sub s,d,e
sub a,t,s
```
- Which one is better would depend on the micro architecture of the processor (how many cycles it takes to execute a given instruction).

### Retrival of Operands:
- MIPS retrives operands from memory, constants(also called intermediates) and registers.
- Main Memory is slow 
- Registers are faster.

## Registers:
- 32 registers each of 32 bits.
- $0 is the zero register always wired to 0.
- the saved registers ($s0 - $s7) are used to hold variables.
- the temporary registers ($t0 - $t9) are used to hold intermediate vlaue during a large computation.
- $at = assembler register.
- $k0 - $k1 are used for kernel use.
- $v0 - $v1 are result registers.
- $a0 - $a3 are used to pass parameters/arguments to procedures.
- $sp is the stack pointer.
- $gp is the global pointer.
- $fp is the frame pointer.
- $ra is the return address.

![Registers](/Project/Week1/Photos/register2.png)

> We can also have a processor without registers. However, it would be significantly slower.
