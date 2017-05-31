from math import sqrt, log
from random import choice as random_choice

from crypto.utilities import gcd, modular_inverse

def two_points(list_of_points):
    return random_choice(list_of_points), random_choice(list_of_points)
    
def recover_pk(points, test_count):
    gcds = set()
    for count in range(test_count):
        a, b = two_points(points)
        gcds.add(gcd(a, b))
    
    gcds = list(gcds) # sets do not support indexing and won't work with two_points
    return gcds
    _gcds = set()
    for count in range(test_count):
        a, b = two_points(gcds)
        _gcds.add(gcd(a, b))
    if 1 in _gcds:
        _gcds.remove(1)
    print len(_gcds)
    print _gcds
    return min(_gcds) # the gcd of pk
    
def crack_ciphertext(ciphertext, pk, n):
    return ((ciphertext * modular_inverse(pk, n)) % n) % pk
    
def attack(points, n, count=65536):
    differences = set()
    sqrt_n = sqrt(n) + 1
    for count in range(len(points)):
        a, b = two_points(points)        
        difference = abs(a - b)
        if difference <= sqrt_n and difference != 0:
      #      print("Found small enough difference: {}".format(log(difference, 2)))
            differences.add(difference)
       # elif difference:
       #     print("Difference too large: {}".format(log(difference, 2)))
            
    return differences
    
def test_attack():
    n = 513
    sqrt_n = int(sqrt(n)) + 1
    candidate_lengths = []
    for p in range(1, n):
        for k in range(1, sqrt_n):
            points = [(p * k * q) % n for q in range(n)]
            candidates = attack(points, n, 1024)
            candidate_lengths.append(len(candidates))
            
            #if k in _key:
            #    print "Success: ", p, k, len(_key)
    #print sorted(candidate_lengths)
    print("Best result removed {}% of key search space.".format(float(min(candidate_lengths)) / sqrt_n))