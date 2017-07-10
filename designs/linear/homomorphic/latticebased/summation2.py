# create modulus N:
#   - pick and remember a random, private prime p
#   - pick a random integer q
#   - compute N = sum(range(p * q))
# encrypting a message m with N:
#   - pick a random integer r
#   - compute ciphertext = (sum(range(N * r)) + m)

from crypto.utilities import big_prime, random_integer, is_prime, quicksum

def generate_private_key(size=32):
    return big_prime(size)
    
def generate_public_key(p, q_size=32):
    q = big_prime(q_size)
    N = quicksum(p * q)
    #assert not( N % p != 0 or quicksum(N) % p != 0)
    while  N % p != 0 or quicksum(N) % p != 0:
        q = random_integer(q_size)
        N = quicksum(p * q)        
    assert is_prime(q)
    assert N % p == 0, (N % p)
    assert quicksum(N) % p == 0
    return N
    
def generate_keypair(p_size=32, q_size=32):
    private_key = generate_private_key(p_size)
    public_key = generate_public_key(private_key, q_size)
    return public_key, private_key
    
def encrypt(m, N, r_size=32, p=None):    
    assert p is not None    
    ciphertext = (quicksum(N * big_prime(r_size)) + quicksum(N * big_prime(r_size))) + m
    assert ciphertext % N != m
    assert ciphertext % p == m, ciphertext % p
    return ciphertext
    
def decrypt(c, p):
    return c % p
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    message = 11
    ciphertext = encrypt(message, public_key, p=private_key)
    plaintext = decrypt(ciphertext, private_key)
    #assert plaintext % message == 0, plaintext
    assert plaintext == message, (plaintext, message)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    