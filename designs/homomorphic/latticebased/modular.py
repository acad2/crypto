""" Keygen:
        random integers p, k, n such that modular_inverse(p, n) exists
    Encrypt:
        c := p * (kq + m) mod n
    Decrypt:
        p := c * pi mod n mod k """

from crypto.utilities import big_prime, random_integer, modular_inverse, size_in_bits

P_SIZE = 66
K_SIZE = 66
N_SIZE = 133
Q_SIZE = 32

def generate_key(p_size=P_SIZE, k_size=K_SIZE, n_size=N_SIZE):
    """ usage: generate_key(p_size=66, k_size=66, 
                            n_size=133) => private_key
                            
        Returns 3 random integers, suitable for use as a key """
    p = random_integer(p_size)
    k = random_integer(k_size)
    while True: # instead of choosing p or n as a prime, just make sure modular inverse of p exists mod n
        n = random_integer(n_size)
        try:
            pi = modular_inverse(p, n)
        except ValueError:
            continue
        else:
            break
    #assert size_in_bits(p) + size_in_bits(k) < size_in_bits(n)
    return p, pi, k, n
    
def encrypt(m, key, q_size=Q_SIZE):
    """ usage: encrypt(m, key, q_size=32) => ciphertext
    
        Encrypts an integer m using key.
        Returns a ciphertext integer.
        Ciphertexts are of the form: (p * ((k * q) + m)) % n
        Ciphertexts support addition """
    p, pi, k, n = key
    q = random_integer(q_size)     
    _c = (p * ((k * q) + m))
    #assert _c > n, (_c, _c % n, n, size_in_bits(_c), size_in_bits(n))    
    return (p * ((k * q) + m)) % n
        
def decrypt(ciphertext, key):
    """ usage: decrypt(ciphertext, key) => plaintext
    
        Decrypts ciphertext using key.
        Returns plaintext integer. """
    p, pi, k, n = key
    return ((ciphertext * pi) % n) % k
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular", generate_key, encrypt, decrypt)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    