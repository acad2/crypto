""" Module for deterministically deriving private and public keys from a password. """

from getpass import getpass
from hashlib import pbkdf2_hmac, sha256
from functools import wraps

from publickey import homomorphic_encrypt, encrypt
from utilities import bytes_to_words

def key_derivation_function(password, salt, iterations=250000, algorithm="sha512"):
    return bytearray(pbkdf2_hmac(algorithm, password, salt, iterations)[:32])
    
def derive_private_key(salt, key_derivation_function=key_derivation_function, password_prompt="Please enter the password: "):
    password = getpass(password_prompt)
    key = key_derivation_function(password, salt, iterations=250000)
    return key[:32]
                  
def random(byte_count, key, nonce, hash_algorithm=sha256):
    output = bytes()
    while len(output) < byte_count:
        output += hash_algorithm(key + output + nonce).digest()
    return bytearray(output)[:byte_count]
        
def derive_public_key(private_key):  
    pre_public_key = []
    for byte in range(256):
        message = bytearray(8)
        message[0] = byte
        ciphertext = homomorphic_encrypt(message, private_key, bytearray(sha256(private_key + message + "pre_public").digest()))
        pre_public_key.append(bytes_to_words(ciphertext, 4))
        
    public_key = []
    for byte in range(256):
        message = bytearray()
        message.append(byte)        
        ciphertext = encrypt(message, pre_public_key, prng=lambda amount: random(amount, private_key, chr(byte)))[0] # encrypt returns a list with 1 ciphertext in it    
        public_key.append(bytes_to_words(ciphertext, 4))    
    return public_key
    
def derive_keypair(salt):
    private_key = derive_private_key(salt)
    public_key = derive_public_key(private_key)
    return public_key, private_key
        
def test_derive_private_key_derive_public_key():
    salt = bytes("\x00" * 16)
    private_key = derive_private_key(salt)
    public_key = derive_public_key(private_key)
    
    public_key2, private_key2 = derive_keypair(salt)
    assert private_key2 == private_key
    assert public_key2 == public_key
    print "derive private key/public key unit test success"
    
if __name__ == "__main__":
    test_derive_private_key_derive_public_key()
    