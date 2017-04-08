""" Python implementation of a homomorphic public key encryption algorithm. """
    
# to do:
# decrease public key size by distributing encryptions of 1, 2, 3, ... and build the remaining entries when needed? 
# log encoding and 0s is probably better

# compressed public key technique
# results in 512 bit public key for a 256-bit plaintext word, using log encoding for the public key
# release E(0, k), E(1, k) as the compressed public key
# to decompress a public key, do:
# e_1 := E(1, k)
# e_2 = e_1 << 1
# e_3 = e_2 << 1
# ...
# e_256 = e_255 << 1

# e_0 := E(0, k)
# e_1 = e_0 + e_0 + e_0 + ... + e_0_n
# e_2 = e_1 + e_1 + e_1 + ... + e_0_n
# ...


    
from os import urandom
from hmac import HMAC, compare_digest
import hashlib

import secretkey
from constants import DEFAULT_MODULUS
from utilities import slide, addition_subroutine, modular_subtraction
from crypto.utilities import bytes_to_integer, integer_to_bytes

BLOCKSIZE = 32

def hmac(key, data, algorithm="sha512"):
    return HMAC(key, data, getattr(hashlib, algorithm)).digest()

def secret_key_encrypt(data, key):
    return secretkey.encrypt(data, key)
    
def secret_key_decrypt(data, key):
    return secretkey.decrypt(data, key)    
        
def generate_public_key(encryption_function, key, blocksize=BLOCKSIZE, key_size=256):  
    """ Generate a public key, given an encryption function and key that outputs ciphertexts that are partially homomorphic. 
        
        A public key consists of encryptions of 0, represented as integers. """        
    return [encryption_function(0, key) for count in range(key_size)]
           
def randomize_public_key(public_key, encryption_function):
    return generate_public_key(encryption_function, public_key)
    
def generate_private_key():
    """ Generates a private key. """
    return secretkey.generate_key()    
    
def generate_keypair(encryption_function=secret_key_encrypt):
    """ Generates a random 256-bit private key and random (256-bit * 256) = 655356 bit (8192 byte) public key. """
    private_key = generate_private_key()
    pre_public_key = generate_public_key(encryption_function, private_key)       
    public_key = randomize_public_key(pre_public_key, encrypt)    
    return public_key, private_key
    
def encrypt(message, public_key, ciphertext_count=16,
            prng=lambda amount: bytearray(urandom(amount))):    
    random_generator = iter(prng(ciphertext_count))
    ciphertext = message + sum(public_key[next(random_generator)] for count in range(ciphertext_count))
    return ciphertext
    
def decrypt(ciphertext, private_key, decryption_function=secret_key_decrypt):
    return decryption_function(ciphertext, private_key) 
  
def encrypt_then_mac(message, *args, **kwargs):        
    integrity_key = bytes_to_integer(bytearray(urandom(32)))
    ciphertext = save_ciphertext(encrypt(message, *args, **kwargs))
    ciphertext += save_ciphertext(encrypt(integrity_key, *args, **kwargs))
    tag = hmac(integrity_key, ciphertext)    
    return ciphertext + tag
    
def decrypt_then_mac(ciphertexts, private_key, blocksize=32, tag_size=64, 
                     integrity_key_size=32, decryption_function=secret_key_decrypt):
    tag = bytearray(ciphertext[-tag_size:])
    ciphertexts = ciphertext[:-tag_size]
    _ciphertexts = [load_ciphertext(ciphertext) for ciphertext in slide(ciphertexts, blocksize)] # is this right?    
    message = decryption_function(_ciphertexts[0], private_key)
    integrity_key = decryption_function(_ciphertexts[-1], private_key)
    
    _tag = hmac(integrity_key, ciphertexts)
    if compare_digest(_tag, tag):
        return message
    else:
        return None    
        
#-----------serialization
from utilities import words_to_bytes, bytes_to_words

def save_public_key(public_key):      
    return ''.join(bytes(words_to_bytes(entry, 2)) for entry in slide(public_key, BLOCKSIZE))

def load_public_key(saved_key):    
    output = []
    for entry in slide(bytearray(saved_key), BLOCKSIZE * 2):
        output.extend(bytes_to_words(entry, 2))
    return output    
                
def save_private_key(private_key):        
    return words_to_bytes(private_key, 2)
    
def load_private_key(saved_private_key):           
    return bytearray(bytes_to_words(bytearray(saved_private_key), 2))
    
def save_ciphertext(ciphertext):
    return ''.join(bytes(words_to_bytes(entry, 2)) for entry in slide(ciphertext, BLOCKSIZE))
    
def load_ciphertext(saved_ciphertext):
    output = []
    for entry in slide(bytearray(saved_ciphertext), BLOCKSIZE * 2):
        output.extend(bytes_to_words(entry, 2))
    return output  
    
#----------Begin unit tests
    
def test_encrypt_then_mec_decrypt_then_mac():
    message = "Testing!"
    public_key, private_key = generate_keypair()
    ciphertext = encrypt_then_mac(message, public_key)
    plaintext = decrypt_then_mac(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext[0] = 0
    _plaintext = decrypt_then_mac(ciphertext, private_key)
    assert _plaintext != plaintext, (_plaintext, plaintext)
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    message = 1
    ciphertext = encrypt(message, public_key)     
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext2 = encrypt(message, public_key)
    assert ciphertext2 != ciphertext, "Ciphertexts are not randomized"
    plaintext2 = decrypt(ciphertext2, private_key)
    assert plaintext2 == message            
    
    
    ciphertext += ciphertext2
    plaintext += plaintext2    
    plaintext3 = decrypt(ciphertext, private_key)
    assert plaintext3 == plaintext
    print "Passed public key encryption and private key decryption unit test"
    
def test_homomorphic_encrypt_decrypt():
    key = secretkey.generate_key()
    message = 1    
    ciphertext = secret_key_encrypt(message, key)    
    plaintext = secret_key_decrypt(ciphertext, key)
    assert plaintext == message, (plaintext, message)
    
def test_save_load_ciphertext():
    public_key, private_key = generate_keypair()
    message = "Testing!"
    ciphertext = encrypt(message, public_key)
    saved_ciphertext = save_ciphertext(ciphertext)
    _ciphertext = load_ciphertext(saved_ciphertext)
    assert _ciphertext == ciphertext, (len(_ciphertext), len(ciphertext))
                
def test_save_load_public_key():
    public_key, private_key = generate_keypair()
    saved_public_key = save_public_key(public_key)
    _public_key = load_public_key(saved_public_key)
    assert _public_key == public_key, (len(_public_key), len(public_key))
    
    saved_private_key = save_private_key(private_key)
    _private_key = load_private_key(saved_private_key)
    assert _private_key == private_key, (len(_private_key), len(private_key), _private_key, private_key)
    print "Passed save load public key test"
    
def test_encrypt_time():
    from timeit import default_timer as timer
    print "Calculating time to generate keypair... "    
    before = timer()
    for number in range(100):
        public_key, private_key = generate_keypair()
    after = timer()
    print("Time taken to generate keypair: {}".format((after - before) / number))
    before = timer()
    
    public_key = randomize_public_key(public_key, encrypt)
    message = list(bytearray(16))
    for number in range(1024):                
        ciphertext = encrypt(message, public_key, ciphertext_count=1)
    after = timer()
    print("Time taken to encrypt {} x 16 Byte messages ({}KB): {}".format(number + 1, ((number + 1) * 16) / 1024, after - before))
    
if __name__ == "__main__":
    test_homomorphic_encrypt_decrypt()
    test_encrypt_decrypt()            
    #test_save_load_public_key()
    #test_save_load_ciphertext()
    #test_encrypt_then_mec_decrypt_then_mac()
    test_encrypt_time()
    
    