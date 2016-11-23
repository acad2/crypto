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

from homomorphicbitpermutation import encrypt64v2, decrypt64v2
from crypto.utilities import words_to_bytes, bytes_to_words

def homomorphic_encrypt(data, secret_key):    
    return bytes_to_words(encrypt64v2(data, secret_key), 4)
    
def homomorphic_decrypt(data, secret_key):
    return decrypt64v2(words_to_bytes(data, 4), secret_key)
    
def generate_public_key(private_key):  
    """ Generate a public key, given the secret key of a symmetric homomorphic cryptosystem. 
        
        A public key consists of encryptions of the range of numbers 0-255, in order. 
        Larger public keys could be made, consisting of all 16-bit unsigned integers for example.
        This will result in a correspondingly larger public key, but reduced message expansion during encryption"""
    public_key = []
    for integer in range(256):
        data = bytearray(8)
        data[-1] = integer
        ciphertext = homomorphic_encrypt(data, private_key)
        public_key.append(ciphertext)
    return public_key
    
def generate_private_key():
    """ Generates a random 128-bit value. """
    return bytes_to_words(bytearray(urandom(16)), 4)
    
def generate_keypair():
    """ Generates a 128-bit private key and (128-bit * 256) = 32768 bit (4096 byte) public key. """
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def public_key_encryption(message, public_key, ciphertext_count=16):
    """ Public key encryption scheme, based on symmetric homomorphic encryption.
        A public key consists of encryptions of the numbers 0-255, in order.
        
        To encrypt, add together (using XOR) a random subset of the integers (which are 
        represented as ciphertexts) such that the sum equals one byte of the message. 
        
        This can be done simply in practice, by adding together enough random 
        integers from the public key, then calculating the difference between the resulting integer
        and desired integer, and adding that last integer to the sum. 
        
        Encryption can send one 8-bit value per 128-bit ciphertext. This results in a 16x increase in data size. 
        This inflation could be reduced by using a larger public key. """        
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
    
def private_key_decryption(ciphertexts, private_key):
    """ Private key decryption function based on symmetric homomorphic encryption and subset sum. """
    message = bytearray()
    for ciphertext_byte in ciphertexts:        
        plaintext_byte = homomorphic_decrypt(ciphertext_byte, private_key)[-1]
        message.append(plaintext_byte)
    return message
    
def test_public_key_encryption_private_key_decryption():
    public_key, private_key = generate_keypair()
    message = "Testing!"
    ciphertext = public_key_encryption(message, public_key)
    plaintext = private_key_decryption(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext2 = public_key_encryption(message, public_key)
    assert ciphertext2 != ciphertext
    plaintext2 = private_key_decryption(ciphertext2, private_key)
    assert plaintext2 == message            
    print "Passed public key encryption and private key decryption unit test"
    
if __name__ == "__main__":
    test_public_key_encryption_private_key_decryption()        
    