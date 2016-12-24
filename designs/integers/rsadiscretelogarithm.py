from crypto.utilities import modular_inverse
from discretelogarithm import discrete_logarithm2

def key_generation(p, q, e=7):
    n = p * q
    totient = (p - 1) * (q - 1)
    assert totient % e # why does e=2 cause this to fail?
    d = modular_inverse(e, totient)
    return e, n, d
    
def rsa_encrypt(m, e, n):
    return pow(m, e, n)
    
def rsa_decrypt(c, d, n):
    return pow(c, d, n)
    
def test_rsa_key_generation_encrypt_decrypt():
    p, q = 61, 53
    e, n, d = key_generation(p, q)
    for m in range(2, n):
        c = rsa_encrypt(m, e, n)
        _m = rsa_decrypt(c, d, n)
        assert _m == m    
    
def discrete_logarithm_decrypt(c, e, n, factors):
    for g in range(2, n):                
        try:
            if discrete_logarithm2(c, g, n, factors) == e:
                return g
        except ValueError:
            continue
        #except StopIteration:
        #    continue
    raise ValueError()
    
def test_discrete_logarithm_decrypt():
    p, q = 61, 53
    e, n, d = key_generation(p, q)
    factors = list(range(2, n))
    for m in range(3, n):
        if n % m:
            c = rsa_encrypt(m, e, n)        
            print "Encrypted: ", m
            assert discrete_logarithm_decrypt(c, e, n, factors) == m
    
if __name__ == "__main__":
    test_rsa_key_generation_encrypt_decrypt()
    test_discrete_logarithm_decrypt()
    