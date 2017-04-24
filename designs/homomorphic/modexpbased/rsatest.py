import itertools
from math import log

from crypto.utilities import big_prime, modular_inverse, gcd

from rsakeygen import generate_keypair
from discretelogtest import discrete_logarithm

def rsa_f(number, exponent, modulus):
    return pow(number, exponent - 1, modulus)
    
# f(a, b, c)
# choose b and c such that for all a:
#  f(a, b, c) * f(a * f(a, b, c), d, c) mod c == 1
# or
#  
# for some d
    
def encrypt(m, e, n, f=rsa_f):
    r = f(m, e, n)    
    return (m * r) % n
    
def decrypt(c, d, n, f=rsa_f):
    r = f(c, d, n)
    return (c * r) % n
    
# m * m * m * ... * m_e mod n == nq + r mod n == r
# have r, e, n  
        
def recover_d(e, n, m=2, f=rsa_f):
    r1 = f(m, e, n)
    r2 = modular_inverse(r1, n)
    d = discrete_logarithm(r1, r2, n)
    return d
    
def test_encrypt_decrypt():
    e, d, n = generate_keypair(8)
    for m in range(1, 256):
        c = encrypt(m, e, n)
        p = decrypt(c, d, n)
        r = rsa_f(m, e, n)
        r_ = rsa_f(c, d, n)        
        assert (r * r_) % n == 1, (m, (r * r_) % n)
        assert p == m, (p, m)
    
def test_recover_d():
    e, d, n = generate_keypair(4)
    print d
    _d = recover_d(e, n)
    
    assert _d == d, (_d, d)
          
if __name__ == "__main__":
    test_encrypt_decrypt()
    #test_recover_d()
    