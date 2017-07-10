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
        
def expand_to_wordsize(bit, target_size):
    size = 1
    while size < target_size:
        bit ^= bit << size
        size <<= 1
    return bit
        
def exchange_key(public_key, bit_count=256):
    bits = random_bits(bit_count)
    ciphertext = 0    
    p0, p1 = public_key
    for index, bit in enumerate(reversed(bits)):        
        addend = choice(expand_to_wordsize(bit, 2048), p1, p0)
        ciphertext += addend
        p1 += p1
        p0 += p0
    return ciphertext, int(''.join(str(item) for item in bits), 2)
    
def recover_key(ciphertext, private_key, decrypt=secretkey.decrypt):
    return decrypt(ciphertext, private_key)
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange    
    
    public_key, private_key = generate_keypair()
    ciphertext, key = exchange_key(public_key)
    _key = recover_key(ciphertext, private_key)    
    assert _key == key, (_key, key)
    
    test_key_exchange("mullesskeyexchange", generate_keypair, exchange_key, recover_key)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    