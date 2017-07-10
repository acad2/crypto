from crypto.utilities import big_prime, modular_inverse, gcd

from rsakeygen import generate_keypair as generate_rsa_keypair
import epqcrypto.secretkey

def generate_keypair(p1_size, p2_size, rsa_size):
    private_key1 = epqcrypto.secretkey.generate_key(p1_size, p2_size)
    e, d, private_modulus = generate_rsa_keypair(rsa_size)            
    public_modulus = epqcrypto.secretkey.encrypt(private_modulus, private_key1)
    return (public_modulus, e), (d, private_modulus, private_key1)
    
def encrypt(m, e, n):
    return pow(m, e, n)    
    
def decrypt(c, d, n):
    return pow(c, d, n)
    
def test_encrypt_decrypt():
    #public_key, private_key = generate_rsa_keypair(110, 36, 16)
    #e, n = public_key
    #d, _n, k = private_key
    e, d, n = generate_rsa_keypair(16)
    n += 1
    for message in range(2, 256):#message = 1        
        ciphertext = encrypt(message, e, n)
        plaintext = decrypt(ciphertext, d, n)
        assert plaintext == message, (plaintext, message)
    
if __name__ == "__main__": 
    test_encrypt_decrypt()
    