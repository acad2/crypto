from crypto.utilities import big_prime, random_integer, is_prime, modular_inverse, quicksum

def quicksum(p):
    """ usage: quicksum(p) => int
    
        Sums range(p) significantly faster then sum(range(p)). """    
    e = p & 1
    q = p >> 1
    if not p & 1:
        e = q
        q -= 1           
    else:
        raise ValueError()
        e = 0   
        q -= 0
    return (p * q) + e
    
def generate_private_key(p_size=32, e=65537):
    p = big_prime(p_size)
    d = modular_inverse(e, p - 1)
    return (p, d)
    
def generate_public_key(p, q_size=32, e=65537):
    while True:
        q = random_integer(q_size)
        n = p * q
        try:
            modulus = quicksum(n) #+ p # ensures that the e in pq + e is less similar to q
        except ValueError:            
            continue
        else:
            break         
    return (modulus, e)
        
def generate_keypair(p_size=32, q_size=32, e=65537):
    p, d = generate_private_key(p_size, e)
    N, e = generate_public_key(p, q_size, e)
    return (N, e), (p, d)
    
def encrypt(m, public_key):
    N, e = public_key
    return pow(m, e, N)
    
def decrypt(c, N, private_key):
    p, d = private_key
    return pow(c, d, N) % p
    
def test_encrypt_decrypt():    
    public_key, private_key = generate_keypair()
    for message in range(2, 256):                
        ciphertext = encrypt(message, public_key)
        plaintext = decrypt(ciphertext, public_key[0], private_key)
        assert message == plaintext, (message, plaintext)
    size = lambda integer: int(log(integer, 2)) + 1
    print "summation3 encrypt/decrypt unit test complete"
    print("Modulus size: {}".format(size(public_key[0]))
    print("Private key size: p: {}; d: {}".format(size(private_key[0]), size(private_key[1])))
    print("Ciphertext size: {}".format(size(ciphertext)))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    