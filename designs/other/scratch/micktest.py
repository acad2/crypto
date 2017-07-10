from os import urandom

from crypto.utilities import bytes_to_integer

MICKS_COMPRESSED_PUBLIC_KEY = 0x32FFCE591A8D2EF1D6360824DC87C48F1794240FF91D49F1C13D764D2A57BD082C59F8B061DC5B4749D4A6C4584E00C23BFDA2A955C84DD22D90D14E8829945

def decompress(k_compressed, ring=(2 ** 4096) - 1): # default for 128 bit security level
    return ((3 ** 4096) % ring) - (k_compressed << 3328)
    
MICKS_PUBLIC_KEY = decompress(MICKS_COMPRESSED_PUBLIC_KEY)

_RANDOMS = [1, 2, 3, 4, 5, 6]

def random(bits, index=[0]):
    #index[0] += 1
    #return _RANDOMS[index[0] - 1]
    byte_count = bits / 8
    return bytes_to_integer(bytearray(urandom(byte_count)))
    
def generate_private_key(n=16):
    p = random(3*n) + (2 ** (3*n))
    return p
    
def generate_public_key(p, n=16):    
    k = sorted([p*random(n) + random(n), p*random(n) + random(n)])
    return k
    
def encrypt(message, k, n=16):            
    ciphertext = (k[0] * random(n) % k[1]) + (2 ** (2 * n)) * message
    return ciphertext
    
def decrypt(ciphertext, p, n=16):       
    plaintext = round((ciphertext % p) / 2**(2*n))
    return plaintext
    
def test_micktest():
    m = 10
    p = generate_private_key()
    k = generate_public_key(p)
    ciphertext = encrypt(m, k)
    plaintext = decrypt(ciphertext, p)
    assert plaintext == float(m), (plaintext, float(m))
    
if __name__ == "__main__":
    test_micktest()
        
        