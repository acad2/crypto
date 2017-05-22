# distribute encrypted write access message point 256 bits
# distribute encrypted write access randomizing point 512 bits
# distribute encrypted read access point 1024 bits
# k_m := encrypt([1, 0, 0], [p_m, p_r, p_ra])
# k_r := encrypt([0, 0, 0], [p_m, p_r, p_ra])
# manymod of dimension 3

# encryption:
#   c := (k_m * m) + (k_r * r) 
# decryption:
#   pm_plus_pr := c mod p_ra
#   pm := pm_plus_pr mod p_r
#   m := pm / p_m
import crypto.designs.homomorphic.latticebased.manymod as manymod
from crypto.utilities import random_integer

def generate_private_key(m_size=33, r_size=66, ra_size=134):
    p_m = random_integer(m_size)
    p_r = random_integer(r_size)
    p_ra = random_integer(ra_size)    
    return (p_m, p_r, p_ra)
    
def generate_public_key(private_key):
    k_m = manymod.encrypt((1, 0, ), private_key)
    k_r = manymod.encrypt((0, 1, ), private_key)
    return (k_m, k_r)
    
def generate_keypair(m_size=33, r_size=66, ra_size=134):
    private_key = generate_private_key(m_size, r_size, ra_size)
    public_key = generate_public_key(private_key)
    return public_key, private_key
        
def encrypt(m, public_key, r_size=64):
    k_m, k_r = public_key
    return (k_m * m) + (k_r * random_integer(r_size))
    
def decrypt(ciphertext, private_key):
    p_m, p_r, p_ra = private_key
    pm_plus_pr = ciphertext % p_ra
    pm = pm_plus_pr % p_r
    return pm / p_m

def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    for counter in range(65536):
        message = random_integer(32)
        ciphertext = encrypt(message, public_key)
        plaintext = decrypt(ciphertext, private_key)
        assert plaintext == message, (plaintext, message)
    print "manymodpublickey encrypt/decrypt unit test passed"
    
    from crypto.utilities import size_in_bits as size
    public_key_sizes = [size(public_key[0]), size(public_key[1])]
    private_key_sizes = [size(item) for item in private_key]
    print("Public key size : p_m: {}; p_r: {}; Total: {}".format(*public_key_sizes + [sum(public_key_sizes)]))    
    print("Private key size: k_m: {}; k_r: {}; k_ra: {}; Total: {}".format(*private_key_sizes + [sum(private_key_sizes)]))
    print("Ciphertext size: {}".format(size(ciphertext)))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    