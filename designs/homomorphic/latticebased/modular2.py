""" Keygen:
        n is public and pre-agreed (does not need to be unique)
        random integers p, k such that p >= n - p and k >= max_size(possible_plaintexts)
    Encrypt:
        c := p * (kq + m) mod n
    Decrypt:
        p := c * pi mod n mod k """

from crypto.utilities import big_prime, random_integer, modular_inverse

P_SIZE = 32
K_SIZE = 33
N_SIZE = 100
Q_SIZE = 32

# N = big_prime(N_SIZE)
N = 5020634727083374867033428467921864279987846875827783570524548075331408526653673292934012044279137287122086838606810449224360138237621829626400015970097740555578731440429830737191470731438461919109460716900139034514939537967910223820430209883

def generate_key(p_size=P_SIZE, k_size=K_SIZE, n=N):
    """ usage: generate_key(p_size=66 k_size=66, 
                            n_size=133) => private_key
                            
        Returns 3 integers, suitable for use as a key """              
    assert p_size <= N_SIZE, (p_size, N_SIZE)
    k = random_integer(k_size)      
    while True:        
        p = (n - random_integer(p_size))
        try:
            p_i = modular_inverse(p, n)
        except ValueError:
            pass
        else:
            break
    assert p > (n - p)
    return p, p_i, k
    
def encrypt(m, key, q_size=Q_SIZE, n=N):
    """ usage: encrypt(m, key, q_size=32) => ciphertext
    
        Encrypts an integer m using key.
        Returns a ciphertext integer.
        Ciphertexts are of the form: (p * ((k * q) + m)) % n
        Ciphertexts support addition """
    #p, p_i, k = key
    return (key[0] * ((key[2] * random_integer(q_size)) + m)) % n
    
def decrypt(ciphertext, key, n=N):
    """ usage: decrypt(ciphertext, key) => plaintext
    
        Decrypts ciphertext using key.
        Returns plaintext integer. """
    #p, p_i, k = key    
    return ((ciphertext * key[1]) % n) % key[2]        
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular", generate_key, encrypt, decrypt, plaintext_size=32, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    