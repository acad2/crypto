raise NotImplementedError("Broken")

import crypto.designs.homomorphic.latticebased.qtpie as secretkey

from crypto.utilities import random_bits

def generate_private_key(keygen=secretkey.generate_key):
    return keygen()
    
def generate_public_key(private_key, encrypt=secretkey.encrypt):
    return encrypt(1, private_key)
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def exchange_key(public_key, bit_count=256):
    bits = random_bits(bit_count)
    ciphertext = 0    
    for index, bit in enumerate(reversed(bits)):        
        #addend = choice(expand(bit), public_key, 0)
        if bit:
            addend = public_key            
        else:
            addend = 0
        ciphertext += addend
        public_key += public_key
    return ciphertext, int(''.join(str(item) for item in bits), 2)
    
def recover_key(ciphertext, private_key, decrypt=secretkey.decrypt):
    return decrypt(ciphertext, private_key)
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange    
    
    public_key, private_key = generate_keypair()
    ciphertext, key = exchange_key(public_key)
    _key = recover_key(ciphertext, private_key)    
    assert _key == key, (_key, key)
    
    test_key_exchange("onepoint", generate_keypair, exchange_key, recover_key)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    