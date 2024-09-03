# Lecture Notes Date: 3rd September 2024
---

### Example1:

High Level Code:
``` a = b + c ```
- Operation: Addition
- Source Operands: b, c
- Destination Operand: a

MIPS assembly code:
``` add a,b,c ```
- _add_ is a mnemonic for the operation to be  performed.
- _b,c_ are source operands on which the operation is performed.
- _a_ is the destination operand to which the result is written.

> Mnemonic can also be add b,c,a; we just need to define the instructions accordingly.

### Design Principle 1: Simplicity favors regularity.
- Consistent instruction format.
- Same number of operands (two source and one destination) as it is easier to encode in hardware.

### More complex code:
High Level Code:
``` a = b + c - d ```

MIPS assembly code:

```
add t,b,c # t = b + c
sub a,t,d # a = t - d 
```