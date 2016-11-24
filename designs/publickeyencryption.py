""" Python implementation of a public key cryptosystem based on a partially homomorphic secret key cipher and subset sum. 
    Private keys are 128-bit uniformly random data for the used cipher. 
    Public keys are ordered encryptions of integers
        - For example, 256 128-bit ciphertexts to represent all 8-bit integers (4096 bytes)
    Public key encryption adds together random integers from the public key, until they sum to the desired value.
        - This works because the integers are represented as ciphertexts and can be manipulated via XOR
        - Can be done quickly and efficiently with little more then XOR instructions and indexing some memory
    Private key decryption decrypts the sum to obtain to the transmitted value.
        - Can be done as quickly as the underlying secret key homomorphic scheme can decrypt"""

from os import urandom

from homomorphicbitpermutation import encrypt8, decrypt8
from crypto.utilities import words_to_bytes, bytes_to_words, slide

def homomorphic_encrypt(byte, secret_key): 
    """ Encrypt one 8-bit byte homomorphically using secret key. """
    return bytes_to_words(encrypt8(byte, secret_key), 4)
    
def homomorphic_decrypt(byte, secret_key):
    """ Decrypts one 8-bit byte using secret key. """
    return decrypt8(words_to_bytes(byte, 4), secret_key)
    
def generate_public_key(private_key):  
    """ Generate a public key, given the secret key of a symmetric homomorphic cryptosystem. 
        
        A public key consists of encryptions of the range of numbers 0-255, in order. 
        Larger public keys could be made, consisting of all 16-bit unsigned integers for example.
        This will result in a correspondingly larger public key, but reduced message expansion during encryption"""
    public_key = []
    for byte in range(256):
        ciphertext = homomorphic_encrypt(byte, private_key)
        public_key.append(ciphertext)
    return public_key
    
def generate_private_key():
    """ Generates a random 128-bit value. """
    key = bytes_to_words(bytearray(urandom(16)), 4)
    return key
    
def generate_keypair():
    """ Generates a 128-bit private key and (128-bit * 256) = 32768 bit (4096 byte) public key. """
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encrypt(message, public_key, ciphertext_count=16):
    """ Public key encryption scheme, based on symmetric homomorphic encryption.
        A public key consists of encryptions of the numbers 0-255, in order.
        
        To encrypt, add together (using XOR) a random subset of the integers (which are 
        represented as ciphertexts) such that the sum equals one byte of the message. 
        
        This can be done simply in practice, by adding together enough random 
        integers from the public key, then calculating the difference between the resulting integer
        and desired integer, and adding that last integer to the sum. 
        
        Encryption can send one 8-bit value per 128-bit ciphertext. This results in a 16x increase in data size. 
        Ciphertexts are partially homormophic. """        
    output = []
    for symbol in bytearray(message):
        ciphertext_byte = [0, 0, 0, 0]
        _key_byte = 0
        for count in range(ciphertext_count - 1):        
            key_byte = ord(urandom(1))
            _key_byte ^= key_byte
            ciphertext_key_byte = public_key[key_byte]
            ciphertext_byte[0] ^= ciphertext_key_byte[0]
            ciphertext_byte[1] ^= ciphertext_key_byte[1]
            ciphertext_byte[2] ^= ciphertext_key_byte[2]
            ciphertext_byte[3] ^= ciphertext_key_byte[3]
            
        final_key_byte = _key_byte ^ symbol
        final_ciphertext = public_key[final_key_byte]
        ciphertext_byte[0] ^= final_ciphertext[0]
        ciphertext_byte[1] ^= final_ciphertext[1]
        ciphertext_byte[2] ^= final_ciphertext[2]
        ciphertext_byte[3] ^= final_ciphertext[3]
        output.append(ciphertext_byte)        
    return output
    
def decrypt(ciphertexts, private_key):
    """ Private key decryption function based on symmetric homomorphic encryption. """
    message = bytearray()
    for ciphertext_byte in ciphertexts:        
        plaintext_byte = homomorphic_decrypt(ciphertext_byte, private_key)
        message.append(plaintext_byte)
    return message
    
def test_public_key_encryption_private_key_decryption():
    public_key, private_key = generate_keypair()
    message = "Testing!"
    ciphertext = encrypt(message, public_key)
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext2 = encrypt(message, public_key)
    assert ciphertext2 != ciphertext
    plaintext2 = decrypt(ciphertext2, private_key)
    assert plaintext2 == message            
    print "Passed public key encryption and private key decryption unit test"
    
    
#-----------serialization
def save_public_key(public_key):
    lines = bytearray()
    for ciphertext_words in public_key:
        lines.extend(words_to_bytes(ciphertext_words, 4))
    return lines

def load_public_key(saved_key):
    public_key = []    
    for line in slide(saved_key, 16):        
        public_key.append(bytes_to_words(line, 4))
    return public_key        
        
def save_private_key(private_key):
    return words_to_bytes(private_key, 4)
    
def load_private_key(saved_private_key):    
    return bytes_to_words(saved_private_key, 4)
    
def test_save_load_public_key():
    public_key, private_key = generate_keypair()
    saved_public_key = save_public_key(public_key)
    _public_key = load_public_key(saved_public_key)
    assert _public_key == public_key, (_public_key, public_key)
    
    saved_private_key = save_private_key(private_key)
    _private_key = load_private_key(saved_private_key)
    assert _private_key == private_key
    
    
#-----------micks attack
def invert(x):
    return (~x) & 0xFFFFFFFF
def hamming_weight(x):
    return format(x, 'b').count('1')    
    
def micks_attack(key, threshold=50):
    P = 0    
    count = 0
    while hamming_weight(P) != 126:        
        X = bytes_to_words(homomorphic_encrypt(0, key), 16)[0]          
        count += 1
        if count >= threshold:
            return False 
        if X & 1:
            X = invert(X);
        P |= X;
    return P
    
def is_vulnerable_to_micks_attack(key, threshold=50):
    if micks_attack(key, threshold):
        return True
    else:
        return False
        
def test_encrypt_time():
    from timeit import default_timer as timer
    before = timer()
    for round in range(1000):
        public_key, private_key = generate_keypair()
    after = timer()
    print("Time taken to generate keypair: {}".format((after - before) / 1000))
    before = timer()
    for message in range(1024):
        ciphertext = encrypt(message, public_key)
    after = timer()
    print("Time taken to encrypt 8KB: {}".format(after - before))
    
if __name__ == "__main__":
    test_public_key_encryption_private_key_decryption()            
    test_save_load_public_key()
    #test_encrypt_time()
    