# dp = modular_inverse(e, p)
# dq = modular_inverse(e, q)
# qi = modular_inverse(q, p)

# m1 = pow(c, dp, p)
# m2 = pow(c, dq, q)
# h = qinv(m1 - m2)
# m = m2 + hq
from crypto.utilities import big_prime, modular_inverse, random_integer

def generate_key(size):
    p = big_prime(size)
    q = big_prime(size)
    return p, q
        
def decrypt(c, p, e=65537):
    dp = modular_inverse(e, p - 1)
    return pow(c, dp, p)
    
    #dq = modular_inverse(e, q - 1)
    #m1 = pow(c, dp, p)
    #m2 = random_integer(16)
    #h = (modular_inverse(q, p) * (m1 - m2)) % p
    #return (m2 + (h * q)) % p
    
# the purpose of q is to encrypt p so that others cannot obtain d
# mk is a secure cipher if m and k are large primes and no "fast" classical algorithm for factoring exists
# p * q returns a homomorphic encryption of p
# pow(p, e, k) returns a homomorphic encryption of p

def encrypt(m, p, q, e=65537):
    return pow(m, e, p * q)
    #c1 = pow(m, e, p)
    #c2 = random_integer(16)
    #h = (modular_inverse(q, p) * (c1 - c2)) # qi * c1
    #return (c2 + (h * q)) % p               # qi * c1 * q
    
def test_encrypt_decrypt():
    p, q = 251, random_integer(32)#big_prime(16)#generate_key(16)
    m = 10#1337
    c = encrypt(m, p, q)
    print c
    assert pow(c, modular_inverse(65537, p), p) != m
    _m = decrypt(c, p)
    print _m
    assert _m == m, (_m, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    