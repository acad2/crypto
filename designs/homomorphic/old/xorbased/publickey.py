""" Python implementation of a public key cryptosystem based on a cipher that produces partially homomorphic ciphertexts and the subset sum problem. 
    - Private keys are 256-bit uniformly random data, for the used secret key cipher. 
    - Public keys are ordered encryptions of integers
        - Encrypt the integers 0-255 using a cipher homomorphic cipher, and distribute them in order
            - Public keys are 256 * 128 = 32768 bits = 4096 bytes in size
        
    - To encrypt with the public key:
        - All integers are represented by ciphertexts
            - i.e. 1 ^ 2 means public_key[1] ^ public_key[2]            
        - '+' and "add" mean XOR
        
        - Set the output to 0
        - For a sufficient number of terms, depending on the security parameter (>= 16):
            - Generate a random 8-bit integer 
            - xor the output ciphertext with the randomly generated integer (output ^= r)
            
        - Calculate the term that, when added to the output ciphertext, causes the output to equal the message
            - term = ciphertext_output ^ message
        - Add the calculated term to the sum         
                   
        - Can be done quickly and efficiently with little more then XOR instructions and indexing some memory                
        - Ciphertext expansion will consume cipher_blocksize_in_bytes as much data as the message (16x times in this implementation)
        
    - To decrypt with the private key:
        - Decrypt the ciphertext using the decryption operation of the homomorphic cipher and extract the 8-bit message
        - Can be done as quickly as the underlying homomorphic scheme can decrypt
        - Underlying scheme must incorporate padding/randomizer/nonce inside message/ciphertext
            - example: Scheme will not work with a stream cipher 
                    
    First, a pre-public key is generated from a secret key cipher.
    Second, a public key is generated using the public key encryption technique here and the pre-public key just generated    
    This second public key is released as the public key.
    
    The pre-public key functions fully as a public key, but the ciphertexts would provide a known plaintext attack on a linear cipher.
    The public key encryption technique is more secure then the linear cipher, and the resulting ciphertexts also 
     carry the homomorphic property. So they are suitable for use as a public key.
     
    - You can generate a new, random, valid public key from any other public key."""

from os import urandom

from secretkey import encrypt as _homomorphic_encrypt
from secretkey import decrypt as _homomorphic_decrypt
from utilities import words_to_bytes, bytes_to_words, slide

def homomorphic_encrypt(byte, secret_key, padding=None): 
    """ Encrypt 64-bits of data using secret key. Only 8 bits of data are needed when generating a public key. 
        byte should be a null padded 8 byte long bytearray with a single entry at the 0 index for the message byte. """    
    return _homomorphic_encrypt(byte, secret_key, padding)
    
def homomorphic_decrypt(byte, secret_key):
    """ Decrypts one 8-bit byte using secret key. """
    return _homomorphic_decrypt(byte, secret_key)[0]
            
def generate_public_key(encryption_function, key):  
    """ Generate a public key, given an encryption function and key that outputs ciphertexts that are partially homomorphic. 
        
        A public key consists of encryptions of the range of numbers 0-255, in order. 
        Encryption consists of (randomly) selecting numbers that sum to the value of the message (represented as an 8-bit byte)
 """        
    public_key = []
    for byte in range(256):   
        message = bytearray(8) # we only need to encrypt 8 bits, but the data block is 64 bits
        message[0] = byte 
        ciphertext = encryption_function(message, key)     
        public_key.append(bytes_to_words(ciphertext, 4))
    return public_key
           
def generate_private_key():
    """ Generates a random 128-bit value. """
    key = bytearray(urandom(16))
    return key
    
def generate_keypair():
    """ Generates a 128-bit private key and (128-bit * 256) = 32768 bit (4096 byte) public key. """
    private_key = generate_private_key()
    pre_public_key = generate_public_key(homomorphic_encrypt, private_key)    
    public_key = generate_public_key(lambda *args: encrypt(*args)[0], pre_public_key) # 0th item from the list is the message byte
    return public_key, private_key
    
def encrypt(message, public_key, ciphertext_count=16, 
            prng=lambda amount: bytearray(urandom(amount))):
    """ usage: encrypt(message : bytearray, public_key : list) => ciphertext : list
    
        Public key encryption scheme, based on symmetric homomorphic encryption.
        A public key consists of encryptions of the numbers 0-255, in order.
        
        To encrypt one byte, add together (using XOR) a random subset of the integers 
        (which are actually ciphertexts) such that the sum equals the message byte.
                
        This can be done simply in practice, by adding together enough random 
        integers from the public key, then calculating the difference between the resulting integer
        and desired integer, and adding that last integer to the sum. 
        
        Encryption can send one 8-bit value per 128-bit ciphertext. This results in a 16x increase in data size. 
        Ciphertexts are partially homormophic. 
        
        Works on arbitrarily long messages, albeit one byte at a time. """       
    output = []        
    key_bytes = iter(prng(len(message) * ciphertext_count))
    assert not isinstance(message, int)
    for symbol in bytearray(message):
        ciphertext_byte = [0, 0, 0, 0]
        _key_byte = 0
        for count in range(ciphertext_count):        
            key_byte = next(key_bytes)
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
        output.append(words_to_bytes(ciphertext_byte, 4))        
    return output
    
def decrypt(ciphertexts, private_key):
    """ Private key decryption function based on symmetric homomorphic encryption. """
    message = bytearray()
    for ciphertext_byte in ciphertexts:                
        plaintext_byte = homomorphic_decrypt(ciphertext_byte, private_key)
        message.append(plaintext_byte)
    return message
    
def test_encrypt_decrypt():
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
    
def test_homomorphic_encrypt_decrypt():
    key = bytearray(16)        
    message = bytearray(8)
    byte = 0
    message[0] = byte
    ciphertext = homomorphic_encrypt(message, key)    
    plaintext = homomorphic_decrypt(ciphertext, key)
    assert plaintext == byte, plaintext    
    
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
    return private_key
    
def load_private_key(saved_private_key):    
    return saved_private_key
    
def test_save_load_public_key():
    public_key, private_key = generate_keypair()
    saved_public_key = save_public_key(public_key)
    _public_key = load_public_key(saved_public_key)
    assert _public_key == public_key, (_public_key, public_key)
    
    saved_private_key = save_private_key(private_key)
    _private_key = load_private_key(saved_private_key)
    assert _private_key == private_key
            
def test_encrypt_time():
    from timeit import default_timer as timer
    print "Calculating time to generate keypair... "    
    before = timer()
    for number in range(100):
        public_key, private_key = generate_keypair()
    after = timer()
    print("Time taken to generate keypair: {}".format((after - before) / number))
    before = timer()
    for number in range(1024):
        _byte = format(number, 'b').zfill(16)
        byte0, byte1 = _byte[:8], _byte[8:]
        message = bytearray(8)
        message[0] = int(byte0, 2)
        message[1] = int(byte1, 2)
        ciphertext = encrypt(message, public_key)
    after = timer()
    print("Time taken to encrypt {} x 16 Byte ciphertexts ({}KB): {}".format(number + 1, ((number + 1) * 16) / 1024, after - before))
    
if __name__ == "__main__":
    test_homomorphic_encrypt_decrypt()
    test_encrypt_decrypt()            
    test_save_load_public_key()
    test_encrypt_time()
    