from crypto.utilities import random_integer, modular_inverse, modular_subtraction

K_SIZE = 32
Q_SIZE = 16
DEFAULT_MODULUS = (2 ** (K_SIZE * 8)) + 1

def generate_key(size=K_SIZE):
    return random_integer(size), random_integer(size / 2), random_integer(size / 2)
    
def encrypt(m, secret_key, modulus=DEFAULT_MODULUS, q_size=Q_SIZE):
    k1, k2, k3 = secret_key    
    _e = ((m * k2) + k3) % modulus  
    return _e
    #assert modular_subtraction(_e, k3, modulus) == (m * k2) % modulus
    #q = random_integer(q_size)
    #return (k1 * q) + _e
    
def decrypt(c, secret_key, modulus=DEFAULT_MODULUS):
    k1, k2, k3 = secret_key
    _e = c #% k1    
    return (modular_subtraction(_e, k3, modulus) * modular_inverse(k2, modulus)) % modulus
    
def test_encrypt_decrypt():
    key = generate_key()
    for m in range(256):
        c = encrypt(m, key)
        _m = decrypt(c, key)
        assert _m == m, (_m, m)
        
    m1 = 1
    m2 = 2
    c1 = encrypt(m1, key)
    c2 = encrypt(m2, key)
    c3 = c1 * c2
    # k1q1 + e1 + k1q2 + e2 == k1q1 + k1q2 + e3
    # m1k2 + k3 + m2k2 + k3 = m1k2 + m2k2 + k3^2
    
    # (k1q1 + e1) * (k1q2 + e2) == k1q1k1q2 + k1q1e2 + k1q2e1 + e1e2
    
    # (m1k2 + k3) * (m2k2 + k3) == m1k2m2k2 + m1k2k3 + m2k2k3 + k3^2
    # m1k2m2k2 + m1k2k3 + m2k2k3
    # m1k2m2 + m1k3 + m2k3
    
    k1, k2, k3 = key
    m3 = decrypt(c3, (k1, k2, k3 ** 2))
    assert m3 == m1 * m2, (m3, m1, m2)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    