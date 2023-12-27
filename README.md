# smc
 Sequence Matrix Calculator
A console calculator for analysing and evaluating sequences
# Usage example:
input:
    smc> l
    f 1 = 0
    f 2 = 1
    f n = 1 * f (n - 1) + 2 * f (n - 2) + 3 * 2 ^ n + 4 * n + 5
output:
    for n >= 2:
          | 1 2 3 4 5 | (n - 2)   | 1 |
          | 1 0 0 0 0 |           | 0 |
    f n = | 0 0 2 0 0 |         * | 3 | [0][0]
          | 0 0 0 1 1 |           | 8 |
          | 0 0 0 0 1 |           | 1 |
input:
    smc> f 8
output:
    21
