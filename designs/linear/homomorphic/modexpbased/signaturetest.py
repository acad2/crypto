# c ^ d mod n == m
# discrete_logarithm(m, generator=c, modulus=n) == d



from crypto.utilities import big_prime, modular_inverse

SIZE = 8

def generate_private_key(size, e=65537):
    p = big_prime(size)
    q = big_prime(size)    
    d = modular_inverse(e, (p - 1) * (q - 1))
   # while d >= p:
   #     q = big_prime(size)        
   #     d = modular_inverse(e, (p - 1) * (q - 1))    
    return p, q, d, e

def generate_keypair(size=SIZE):
    p, q, d, e = generate_private_key(size)    
    n = p * q
    return (p, e), (n, d, q)
    
def sign(data, private_key):
    d, n, q = private_key
    return pow(data, d, n)
    
def verify(data, signature, public_key):
    e, p = public_key    
    if pow(signature, e, p) == data:
        return True
    else:
        return False
        
def test_sign_verify():
    data = "message!"
    public, private = generate_keypair()
    signature = sign(hash(data), private)
    assert verify(hash(data), signature, public)
    
if __name__ == "__main__":
    test_sign_verify()
    
    