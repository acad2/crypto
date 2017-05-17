from math import log

from crypto.utilities import big_prime, modular_inverse

def generate_private_key(size, e=65537):
    p = big_prime(size)    
    return p, modular_inverse(e, p - 1)
    
def generate_public_key(p, prime_count, prime_size):
    for prime_number in range(prime_count):
        p *= big_prime(prime_size)
    return p
    
def generate_keypair(size, prime_count, e=65537):
    p, d = generate_private_key(size, e)
    n = generate_public_key(p, prime_count, size)
    return (e, n), (d, p)
    
def encrypt(m, public_key):
    e, n = public_key
    assert log(m, 2) <= log(n, 2) / 2, (log(m, 2), log(n, 2) / 2)
    return pow(m, e, n)
    
def decrypt(c, private_key):
    d, p = private_key       
    return pow(c, d, p) 
    
def test_encrypt_decrypt_time():    
    import timeit
    from crypto.utilities import random_integer    
    #assert _m == m, (_m, m)
    e = 65537
    count = 10000
    for prime_count in [1, 2, 4, 8, 16]:
        public_key, private_key = generate_keypair(16, prime_count)            
        m = random_integer(14)    
        c = encrypt(m, public_key)
        print "Encryption time ({} primes | {} bits): {}".format(prime_count, int(log(public_key[1], 2)), timeit.timeit("pow({}, {}, {})".format(m, e, public_key[1]), number=count))
        print "Decryption time (1 primes | {} bits): {}".format(int(log(private_key[1], 2)), timeit.timeit("pow({}, {}, {})".format(m, e, private_key[1]), number=count))
        
    
if __name__ == "__main__":
    test_encrypt_decrypt_time()
    