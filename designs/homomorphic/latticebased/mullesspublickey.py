import crypto.designs.homomorphic.latticebased.qtpie as secretkey

from crypto.utilities import random_bits

def generate_private_key(keygen=secretkey.generate_key):
    return keygen()
    
def generate_public_key(private_key, encrypt=secretkey.encrypt):
    return encrypt(0, private_key), encrypt(1, private_key)
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
        
def expand_to_wordsize(bit, target_size, memo={}):
    try:
        return memo[bit] # do not memoize in a "real" implementation
    except KeyError:
        memo_entry = bit
        size = 1        
        while size < target_size:
            bit ^= bit << size
            size <<= 1
            
        memo[memo_entry] = bit
        return bit
        
from math import log
        
def encrypt(message_integer, public_key, bit_count=32):
    bits = (int(item) for item in reversed(format(message_integer, 'b')))
    ciphertext = 0    
    p0, p1 = public_key    
    for index, bit in enumerate(bits):       
        addend = choice(expand_to_wordsize(bit, 2048), p1, p0)        
        ciphertext += addend
        p1 += p1
        p0 += p0    
    return ciphertext
    
def decrypt(ciphertext, private_key, decrypt_function=secretkey.decrypt):
    return decrypt_function(ciphertext, private_key)
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt    
    test_asymmetric_encrypt_decrypt("mullesspublickey", generate_keypair, encrypt, decrypt)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    