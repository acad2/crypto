from os import urandom

from crypto.utilities import random_integer, rotate_left

DEFAULT_SEED = [random_integer(4) for count in range(4)]
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, k):
    """ Conditionally swaps a and b, based on the value of k. """
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    """ Transposes each 1 bit wide/4 bit tall column such that each bit has 1/4 probability of being in any word """
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)

    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def bit_permutation(inputs, key, wordsize=32): 
    """ Transpose the bits of the supplied inputs according to key.
        Selects one of 128! permutations of bits. (not evenly distributed because they key is not large enough) """
    a, b, c, d = inputs    
    k0, k1, k2, k3 = key
    for round in range(1):              
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4 bit tall column is now active
        b = rotate_left(b, 1, wordsize)
        c = rotate_left(c, 2, wordsize)
        d = rotate_left(d, 3, wordsize)               
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4x4 bit subsection is now active
        b = rotate_left(b, 4, wordsize)
        c = rotate_left(c, 8, wordsize)
        d = rotate_left(d, 12, wordsize)                              
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 16x4 bit subsection is now active                  
        b = rotate_left(b, 8, wordsize)
        c = rotate_left(c, 12, wordsize)
        d = rotate_left(d, 16, wordsize)        
                
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 32x4 bit subsection is now active  
    return a, b, c, d
    
def generate_private_key(key_size=4, wordsize=32):
    return [random_integer(wordsize / 8) for count in range(key_size)]
    
def generate_public_key(seed, private_key):
    public_key = bit_permutation(seed, private_key)
    return public_key
    
def generate_keypair(key_size=4, wordsize=32, seed=DEFAULT_SEED):
    private_key = generate_private_key(key_size, wordsize)
    public_key = generate_public_key(seed, private_key)
    return public_key, private_key
    
def key_agreement(public_keyb, private_keya):
    shared_secret = bit_permutation(public_keyb, private_keya)
    return shared_secret
    
def test_key_agreement():
    pub1, priv1 = generate_keypair()
    pub2, priv2 = generate_keypair()
    s1 = key_agreement(pub2, priv1)
    s2 = key_agreement(pub1, priv2)
    assert s1 == s2
    
if __name__ == "__main__":
    test_key_agreement()
    