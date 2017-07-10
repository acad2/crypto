""" Python implementation of a homomorphic public key encryption algorithm.
    Currently offers 256 bit (32 byte) private keys and 8KB public keys. """
    
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

BLOCKSIZE = 32

def hmac(key, data, algorithm="sha512"):
    return HMAC(key, data, getattr(hashlib, algorithm)).digest()
      
def generate_public_key(encryption_function, key, blocksize=BLOCKSIZE):  
    """ Generate a public key, given an encryption function and key that outputs ciphertexts that are partially homomorphic. 
        
        A public key consists of encryptions of the range of numbers 0-255, in order. """        
    public_key = []
    for byte in range(DEFAULT_MODULUS):   
        message = [byte]        
        ciphertext = encryption_function(message, key)     
        assert len(ciphertext) == blocksize or len(bytes(ciphertext[0])) == blocksize
        public_key.extend(ciphertext)
    return public_key
           
def randomize_public_key(public_key, encryption_function):
    return generate_public_key(lambda *args, **kwargs: encrypt(*args, ciphertext_count=32, **kwargs), public_key)
    
def generate_private_key():
    """ Generates a 256-bit private key. """
    key = secretkey.generate_key(BLOCKSIZE)
    return key
    
def generate_keypair(encryption_function=secretkey.encrypt):
    """ Generates a random 256-bit private key and random (256-bit * 256) = 655356 bit (8192 byte) public key. """
    private_key = generate_private_key()
    pre_public_key = generate_public_key(encryption_function, private_key)       
    public_key = randomize_public_key(pre_public_key, encrypt)    
    return public_key, private_key
    
def encrypt(message, public_key, ciphertext_count=16, 
            prng=lambda amount: bytearray(urandom(amount)),
            modulus=DEFAULT_MODULUS, blocksize=BLOCKSIZE):
    """ usage: encrypt(message : bytes, public_key : bytearray) => ciphertext : bytearray
    
        Public key encryption method, based on homomorphic encryption.
        A public key consists of encryptions of the numbers 0-255, in order.
        All math is done on ciphertexts:
            - To encrypt one byte, add together a random subset of integers such that the sum equals the message byte.
                - c = r1 + r2 + r3 ... + rN + (m - (r1 + r2 + r3 ... + rN))
                      
        Encryption can send one 8-bit value per 256-bit ciphertext. This results in a 32x increase in data size. 
        Ciphertexts are partially homormophic. 
        
        Works on arbitrarily long messages, albeit one byte at a time. Output is the concatenation of the ciphertexts.
        This method only provides confidentiality of the message, it does not provide message integrity. """
    output = []
    size = len(message)
    key_bytes = iter(prng(size * ciphertext_count))        
    assert not isinstance(message, int)
    null_block = [0 for count in range(blocksize)]
    for symbol in (bytearray(message) if isinstance(message, str) else message):
        ciphertext_byte = null_block[:]
        _key_byte = 0
        for count in range(ciphertext_count):        
            key_byte = next(key_bytes)
            _key_byte += key_byte               
            ciphertext_key_byte = public_key[key_byte * blocksize:(key_byte + 1) * blocksize]               
            #print len(ciphertext_key_byte), key_byte, blocksize, len(public_key), key_byte * blocksize, (key_byte + 1) * blocksize
            addition_subroutine(ciphertext_byte, ciphertext_key_byte, modulus)
           
        final_key_byte = modular_subtraction(symbol, _key_byte, modulus)          
        final_ciphertext = public_key[final_key_byte * blocksize:(final_key_byte + 1) * blocksize]          
        addition_subroutine(ciphertext_byte, final_ciphertext, modulus)                     
        output.extend(ciphertext_byte)
    return output
    
def decrypt(ciphertexts, private_key, blocksize=BLOCKSIZE, decryption_function=secretkey.decrypt):
    """ usage: decrypt(ciphertexts : bytearray, private_key : bytearray,
                       blocksize=BLOCKSIZE, 
                       decryption_function=secretkey.decrypt) => plaintext : bytearray
                       
        Private key decryption function based on homomorphic encryption/decryption. """
    message = []#bytearray()
    for ciphertext_byte in slide(ciphertexts, blocksize):           
        plaintext_byte = decryption_function(ciphertext_byte, private_key)                       
        message.append(plaintext_byte[0])
    return message
    
def encrypt_then_mac(message, *args, **kwargs):
    """ usage: encrypt_then_mac(message : bytearray, *args, **kwargs) => ciphertext + tag
    
        Preserves the confidentiality and integrity of messageW
        Generates a message integrity key to use with hmac.
        Appends the message integrity key to the message
        Encrypts (message || message integrity key) using the public key to produce the ciphertext.
        Produces a tag = HMAC(message integrity key, ciphertext)
        Outputs ciphertext || tag. """
    integrity_key = urandom(32)    
    message += integrity_key
    ciphertext = encrypt(message, *args, **kwargs)        
    tag = hmac(integrity_key, save_ciphertext(ciphertext))
    ciphertext.extend(tag)
    return ciphertext
    
def decrypt_then_mac(ciphertext, private_key, blocksize=32, tag_size=64, integrity_key_size=32):
    """ Decrypts a (message || message integrity key) ciphertext to obtain the message and key.
        Then, calculates the tag via HMAC(message integrity key, ciphertext)
        Returns message upon successful tag validation. Returns None if tag validation fails. """
    tag = bytearray(ciphertext[-tag_size:])
    plaintext = decrypt(ciphertext[:-tag_size], private_key, blocksize)    
    integrity_key = plaintext[-integrity_key_size:]        
    message = plaintext[:-integrity_key_size]
    
    _tag = hmac(integrity_key, save_ciphertext(ciphertext[:-tag_size]))
    if compare_digest(_tag, tag):
        return message
    else:
        return None    
    
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
    message = "Testing!"
    ciphertext = encrypt(message, public_key)     
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext2 = encrypt(message, public_key)
    assert ciphertext2 != ciphertext, "Ciphertexts are not randomized"
    plaintext2 = decrypt(ciphertext2, private_key)
    assert plaintext2 == message            
    
    addition_subroutine(ciphertext, ciphertext2, DEFAULT_MODULUS)
    addition_subroutine(plaintext, plaintext2, DEFAULT_MODULUS)
    plaintext3 = decrypt(ciphertext, private_key)
    assert plaintext3 == plaintext
    print "Passed public key encryption and private key decryption unit test"
    
def test_homomorphic_encrypt_decrypt():
    key = secretkey.generate_key(16)
    message = list(bytearray(8))
    byte = 1
    message[0] = byte
    ciphertext = secretkey.encrypt(message, key)    
    plaintext = secretkey.decrypt(ciphertext, key)
    assert plaintext[0] == byte, (plaintext[0] % DEFAULT_MODULUS, byte)
    
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
    test_save_load_public_key()
    test_save_load_ciphertext()
    test_encrypt_then_mec_decrypt_then_mac()
    test_encrypt_time()
    
    