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