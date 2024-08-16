# Report - Question 1:
---

## Problem Statement:
Implement a program(s) to list the first 50 fibonacci numbers preferably in C/C++ in the following manner: (Total: 50 points)

a. Using recursion (10 points) 

b. Using loop (10 points) 

c. Using recursion and memoization (10 points) 

d. Using loop and memoization (10 points)

Find the speedup of all the programs on your machine by keeping program (1) as the baseline. (10 points).
Tips: Measure the time taken by the program on the CPU using timespec.

## Assumptions:
- The ```timespec``` module is used to time the function that calculates the fibonacci numbers and print them and not the other instructions in main. However as this notion is maintained in all the four functions, the time comparision is more or less not significannly affected.
- The time taken by the program is calculated only for the fibonacci function and not for the other functions.
- The benchmarking is done just for the computation time and memory based analysis is not done.


## Part A:
Refer to [Recursion.cpp](https://github.com/aditya-me13/ES215-IITGN/blob/main/Assignment1/Question1/Recursion.cpp) for the code. The time taken to execute the program for 5 different times are as follows:
1. 112.178 seconds
2. 111.796 seconds
3. 111.393 seconds
4. 110.053 seconds
5. 110.035 seconds

**Mean Value :** 111.2904 seconds

**Median Value :** 111.393 seconds

**Standard Deviation :** 0.610796 seconds

## Part B:
Refer to [Loop.cpp](https://github.com/aditya-me13/ES215-IITGN/blob/main/Assignment1/Question1/Loop.cpp) for the code. The time taken to execute the program for 5 different times are as follows:
1. 0.000160 seconds
2. 0.000178 seconds
3. 0.000187 seconds
4. 0.000201 seconds
5. 0.000138 seconds

**Mean Value :** 0.000178 seconds

**Median Value :** 0.000178 seconds

**Standard Deviation :** 0.000025 seconds

## Part C:
Refer to [Rec_Memo.cpp](https://github.com/aditya-me13/ES215-IITGN/blob/main/Assignment1/Question1/Rec_Memo.cpp) for the code. The time taken to execute the program for 5 different times are as follows:
1. 0.000255 seconds
2. 0.000242 seconds
3. 0.000194 seconds
4. 0.000159 seconds
5. 0.000192 seconds

**Mean Value :** 0.000210 seconds

**Median Value :** 0.000194 seconds

**Standard Deviation :** 0.000035 seconds

## Part D:
Refer to [Loop_Memo.cpp](https://github.com/aditya-me13/ES215-IITGN/blob/main/Assignment1/Question1/Loop_Memo.cpp) for the code. The time taken to execute the program for 5 different times are as follows:
1. 0.000236 seconds
2. 0.000291 seconds
3. 0.000168 seconds
4. 0.000159 seconds
5. 0.000175 seconds

**Mean Value :** 0..000206 seconds

**Median Value :** 0.000168 seconds

**Standard Deviation :** 0.000043 seconds

## Time and Speedup Analysis:
Speedup for a given approach to the function with respect to a given approach is defined as the ratio of the time taken by the given approach to the time taken by the reference approach.

$`speedup(approach) = \frac{time_{reference}}{time_{approach}}`$

Here the reference appraoch is the Recursion approach. Hence the fomula for the speedup of any approach is:

$`speedup(approach) = \frac{time_{recursion}}{time_{approach}}`$

### Mean Values:
| Algorithm | Mean Value | Speedup |
| --- | --- | --- |
| Recursion | 111.2904 seconds | 1.0000 |
| Loop | 0.000178 seconds | 625000.0000 |
| Recursion + Memoization | 0.000210 seconds | 530000.0000 |
| Loop + Memoization | 0.000206 seconds | 535000.0000 |

### Median Values:
| Algorithm | Median Value | Speedup |
| --- | --- | --- |
| Recursion | 111.393 seconds | 1.0000 |
| Loop | 0.000178 seconds | 625000.0000 |
| Recursion + Memoization | 0.000194 seconds | 574000.0000 |
| Loop + Memoization | 0.000168 seconds | 662500.0000 |

