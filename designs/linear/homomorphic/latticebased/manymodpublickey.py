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

def generate_private_key(dimension=4, m_size=33):
    return manymod.generate_key(dimension=dimension, size=m_size)
    
def generate_public_key(private_key):   
    key_size = len(private_key)
    level = [1] + ([0] * (key_size - 2))
    return [manymod.encrypt(level[count:] + level[:count], private_key) for count in range(key_size - 1)]
    #p_m = manymod.encrypt((1, 0, 0, ), private_key) # this is more readable, but the above scales automatically
    #p_r = manymod.encrypt((0, 1, 0, ), private_key)
    #p_x = manymod.encrypt((0, 0, 1, ), private_key)
    #return (p_m, p_r, p_x)
    
def generate_keypair(dimension=4, m_size=33):
    private_key = generate_private_key(dimension, m_size)
    public_key = generate_public_key(private_key)
    return public_key, private_key
        
def encrypt(m, public_key, r_size=64):    
    k_m = public_key[0]    
    ciphertext = (k_m * m) + sum(p_i * random_integer(r_size) for p_i in public_key[1:])
    return ciphertext    
    
def decrypt(ciphertext, private_key):
    k_m, k_r, k_x, k_ra = private_key
    ciphertext %= k_ra
    ciphertext %= k_x
    ciphertext %= k_r
    return ciphertext / k_m    

def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("manymodpublickey", generate_keypair, encrypt, decrypt)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    