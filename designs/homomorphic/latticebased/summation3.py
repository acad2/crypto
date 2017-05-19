from crypto.utilities import big_prime, random_integer, is_prime, modular_inverse, quicksum

def quicksum(p):
    """ usage: quicksum(p) => int
    
        Sums range(p) significantly faster then sum(range(p)). """    
    e = p & 1
    q = p >> 1
    if not e:
        e = q
        q -= 1           
    else:
        raise ValueError() # can't accept e == 0 here
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
    
def randomize_modulus(modulus, public_key, r_size=32):
    return encrypt(modulus, public_key)
    
def encrypt(m, public_key, r_size=32):
    N, e = public_key
    return pow(m, e, N * random_integer(r_size))
    
def decrypt(c, private_key):
    p, d = private_key
    return pow(c, d, p)
    
def test_encrypt_decrypt():
    from math import log
    
    public_key, private_key = generate_keypair()
    public_key = (public_key[0] * random_integer(32), public_key[1])
    
    for message in range(2, 256): 
        print message
        message = random_integer(31)
        
        #public_key = (randomize_modulus(public_key[0], public_key), public_key[1])
        ciphertext = encrypt(message, public_key)
        plaintext = decrypt(ciphertext, private_key)
        assert message == plaintext, (message, plaintext)              
        
    size = lambda integer: int(log(integer, 2)) + 1                  
    from pride.functions.timingcomparison import timing_comparison
    public_key, private_key = generate_keypair(p_size=256 / 8, q_size=256 / 8)
    print "Generating RSA modulus for comparison..."
    _p =  big_prime(512 / 8)
    print "Generating second factor..."
    _q =  big_prime(512 / 8)
    d = modular_inverse(65537, (_p - 1) * (_q - 1))    
    rsa_pub_key = (_p * _q, 65537)
    rsa_priv_key = (rsa_pub_key[0], d)
    print "Beginning timing comparison"
    print "Encryption time: (RSA top; summation3 bottom)"
    print("Modulus sizes: RSA: {}; summation3: {}".format(size(rsa_pub_key[0]), size(public_key[0])))
    timing_comparison((encrypt, (3, rsa_pub_key, ), {}),
                      (encrypt, (3, public_key, ), {}), iterations=100)
                      
    print "Decryption time: (RSA top; summation3 bottom)"
    print("Private key size: RSA: d: {}; summation3: p: {}; d: {}".format(size(rsa_priv_key[1]), size(private_key[0]), size(private_key[1])))
    timing_comparison((decrypt, (ciphertext, rsa_priv_key), {}),
                      (decrypt, (ciphertext, private_key), {}), iterations=100)
    
          
    print("Ciphertext size: {}".format(size(ciphertext)))
    print("(sizes are in bits)") 
    
    print "summation3 encrypt/decrypt unit test complete"   
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    