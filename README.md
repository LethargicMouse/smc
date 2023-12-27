# smc
 Sequence Matrix Calculator <br>
A console calculator for analysing and evaluating sequences
# Usage example:
input: <br>
    smc> l <br>
    f 1 = 0 <br>
    f 2 = 1 <br>
    f n = 1 * f (n - 1) + 2 * f (n - 2) + 3 * 2 ^ n + 4 * n + 5 <br>
output: <br>
    for n >= 2: <br>
          | 1 2 3 4 5 | (n - 2)   | 1 | <br>
          | 1 0 0 0 0 |           | 0 | <br>
    f n = | 0 0 2 0 0 |         * | 3 | [0][0] <br>
          | 0 0 0 1 1 |           | 8 | <br>
          | 0 0 0 0 1 |           | 1 | <br>
input: <br>
    smc> f 8 <br>
output: <br>
    21 <br>
