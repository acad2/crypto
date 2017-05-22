# 5 + 5 + 5 + 5 + 5 + 5 + 5
# 15 + 20

# 1 + 2 + 3 + 4
from math import sqrt

from crypto.utilities import quicksum, factor_integer

n = 45 # 5 * 9 == 5 * 3 * 3
size = n
success = False
for x in range(1, size):
    for y in range(1, size):
        if quicksum(x) + quicksum(y) == n:
            success = True
            break
    if success:
        break
else:
    raise ValueError("No such combination of 2 items found")
assert y > x
            
            
# p2q2 + p3q3 + p5q5 + p7q7
# % p2q2 == p3q3 + p5q5 + p7q7


            
factorization = {}            
for element in range(2, y):
    factors = factor_integer(element)
    for factor, exponent in factors.items():
        try:
            factorization[factor] += exponent
        except KeyError:
            factorization[factor] = exponent
            
print factorization, sum(item ** factorization[item] for item in factorization)