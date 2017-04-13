""" You can use an unmodified RSA keypair to do a lattice based key exchange.
    Does not modify keys; Still vulnerable to factorization.
    But it is much faster. """
from crypto.utilities import big_prime, modular_inverse, random_integer

def random_rsa_key(size):
    p, q = big_prime(size), big_prime(size)
    n = p * q
    totient = (p - 1) * (q - 1)
    d = modular_inverse(3, totient)
    return n, d, p
    
def generate_rsa_keypair(size=2048 / 8):
    while True: # big_prime doesn't always return a big prime 
        try:
            n, d, p = random_rsa_key(size)
        except ValueError: # so the modular inverse does not always exist
            continue
        else:
            break
    return n, d, p
    
def rsa_encrypt(m, n, e=3):
    return pow(m, e, n)
    
def rsa_decrypt(c, d, n):
    return pow(c, d, n)
    
def rsa_lattice_exchange(random_secret, n, r_size=32):
    p1 = n * random_integer(r_size)
    p2 = n * random_integer(r_size)
    return p1 + p2 + random_secret
    
def rsa_lattice_recover(encrypted_secret, p):
    return encrypted_secret % p
                
def test_rsa_encrypt_decrypt():
    n, d, p = generate_rsa_keypair()
    m = 1
    c = rsa_encrypt(m, n)
    _m = rsa_decrypt(c, d, n)
    assert _m == m, (_m, m)
    
    from timeit import default_timer as timer
    message = 1
    before = timer()
    for number in range(1024):                
        ciphertext = rsa_encrypt(message, n)
        key = rsa_decrypt(ciphertext, d, n)
    after = timer()
    ciphertext_size = len(format(ciphertext, 'b'))
    print("Time taken to exchange {} keys using RSA: {}".format(number + 1, after - before))
    
def test_rsa_lattice_exchange_recover():
    n, d, p = generate_rsa_keypair()
    r = random_integer(32)
    c = rsa_lattice_exchange(r, n)
    #print c
    s = rsa_lattice_recover(c, p)
    _s = c % n
    assert _s != s
    assert s == r, (s, r)

    from timeit import default_timer as timer    
    message = 1
    before = timer()
    for number in range(1024):                
        ciphertext = rsa_lattice_exchange(message, n)
        key = rsa_lattice_recover(ciphertext, p)
    after = timer()
    ciphertext_size = len(format(ciphertext, 'b'))
    print("Time taken to exchange {} keys using RSA-Lattice: {}".format(number + 1, after - before))
    
if __name__ == "__main__":
    test_rsa_encrypt_decrypt()
    test_rsa_lattice_exchange_recover()
    