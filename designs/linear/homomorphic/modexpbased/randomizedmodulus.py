from math import log

from crypto.utilities import big_prime, modular_inverse

P_SIZE = 32
Q_SIZE = 32

def generate_private_key(p_size=P_SIZE, e=65537):
    p = big_prime(p_size)
    d = modular_inverse(e, p - 1)
    return e, d, p
    
def generate_public_key(e, p, q_size):     
    encrypted_q = encrypt(big_prime(2), (e, p))
    encrypted_p = encrypt(p, (e, p))
    encrypted_n = encrypted_q * encrypted_p
    assert encrypted_n % p == 0
    return encrypted_n

def generate_keypair(p_size=P_SIZE, q_size=Q_SIZE):
    e, d, p = generate_private_key(p_size)
    n = generate_public_key(e, p, q_size)
    return (e, n), (d, p)        
        
def encrypt(m, public_key, q_size=16):
    e, n = public_key
    #n *= big_prime(q_size)
    return pow(m, e, n)
    
def decrypt(c, private_key, q_size=16):
    d, p = private_key
    p *= big_prime(q_size)
    return pow(c, d, p)   
    
# m ^ d mod n == m * r mod n
#     
#def sign(data, private_key):
        
        
def test_encrypt_decrypt():
    public, private = generate_keypair()
    #p_bits = int(log(p, 2))
    #for m in range(p_bits):
    #    c = encrypt(m, e, p)
    #    _m = decrypt(c, d, p)
    #    assert _m == m
        
    m = 10
    c = encrypt(m, public)
    
    m2 = 20
    c2 = encrypt(m2, public)
    
    c3 = c * c2
    p3 = decrypt(c3, private)
    assert p3 == (m * m2), (p3, m, m2, m * m2)
    
    #c4 = c + c2
    #p4 = decrypt(c4, d, p)
    #assert p4 == (m + m2), (p4, m, m2, m + m2)
    
    #c5 = pow(c, c2, p)
    #p5 = decrypt(c5, d, p)
    #assert c5 == (m ** m2), (p5, m, m2, m ** m2)
    
    #c6 = encrypt(m, e, p) * m2
    #p6 = decrypt(c6, d, p)
    #assert p6 == (m * m2), (p6, m, m2, m * m2)
    
    #_exponent = 30000
    #e, n = public
    #c7 = encrypt(m, public)
    #c7 = pow(c7, _exponent, n)
    #p7 = decrypt(c7, private)
    #assert p7 == (m ** _exponent) % n, (p7, m, (m ** _exponent) % n)
                  
    public_key, private_key = generate_keypair()
    plaintext_message = 100
    ciphertext = encrypt(plaintext_message, public_key)
    _plaintext_message = decrypt(ciphertext, private_key)
    assert _plaintext_message == plaintext_message
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    