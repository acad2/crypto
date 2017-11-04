# as + e            192  96       128      32
# s + (ai(e) << n)       96   64  128
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PADDING = 4

def msb(n, bits):
    return (n >> bits) << bits
    
def lsb(n, mask):
    return n & mask
    
def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    q_size = security_level * 6
    
    d_size = security_level
    k_size = security_level 
    e_msb = (security_level * 8) - (padding * 8)
    
    s_size = security_level * 3
    s_lsb = (2 ** (security_level * 8)) - 1
    ciphertext_msb = (q_size - (security_level * 4) - padding) * 8    
    return q_size, d_size, k_size, e_msb, s_size, ciphertext_msb, s_lsb
    
Q_SIZE, D_SIZE, K_SIZE, E_MSB, S_SIZE, CIPHERTEXT_MSB, S_LSB = generate_parameter_sizes(SECURITY_LEVEL)
Q = 2 ** (Q_SIZE * 8)

def generate_private_key(d_size=D_SIZE, k_size=K_SIZE, q=Q):
    shift = d_size * 8
    d = random_integer(d_size) << shift
    while True:
        k = random_integer(k_size)
        try:
            e = modular_inverse(d, q + k)
        except ValueError:            
            continue
        else:
            break       
    return d, k
    
def generate_public_key(private_key, e_msb=E_MSB, q=Q):
    d, k = private_key    
    e = msb(modular_inverse(d, q + k), e_msb)
    return e
    
def generate_keypair(d_size=D_SIZE, k_size=K_SIZE, e_msb=E_MSB, q=Q):
    private_key = generate_private_key(d_size, k_size, q)
    public_key = generate_public_key(private_key, e_msb, q)
    return public_key, private_key
        
def public_key_operation(e, s, bits=CIPHERTEXT_MSB, q=Q):
    return msb(e * s % q, bits)
    
def private_key_operation(private_key, c, mask=S_LSB, q=Q):
    d, k = private_key
    return lsb(d * c % (q + k), mask)
    
def encapsulate_key(public_key, s_size=S_SIZE, bits=CIPHERTEXT_MSB, s_lsb=S_LSB, q=Q):
    s = random_integer(s_size)
    secret = lsb(s, s_lsb)
    return public_key_operation(public_key, s, bits, q), secret
    
def recover_key(ciphertext, private_key, bits=S_LSB, q=Q):
    return private_key_operation(private_key, ciphertext, bits, q)
    
def encrypt(m, public_key, s_size=S_SIZE, bits=CIPHERTEXT_MSB, q=Q):
    armor_size = int(s_size * .6666) + 1
    m_size = armor_size / 2
    assert armor_size + m_size == s_size
    s = (random_integer(armor_size) << (m_size * 8)) | m
    return public_key_operation(public_key, s, bits, q)
    
def decrypt(c, private_key, s_lsb=S_LSB, q=Q):
    return private_key_operation(private_key, c, s_lsb, q)
                
def unit_test():
    from unittesting import test_key_exchange, test_asymmetric_encrypt_decrypt
    test_key_exchange("separated_kex", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    test_asymmetric_encrypt_decrypt("separated_pke", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    