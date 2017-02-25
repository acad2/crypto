from os import urandom
import hmac
import hashlib

from publickeyencryption import encrypt_then_mac as encrypt
from publickeyencryption import decrypt_then_mac as decrypt
from publickeyencryption import generate_keypair, save_public_key, load_public_key
from utilities import addition_subroutine

def generate_random_value(size=32):
    return bytearray(urandom(size))
    
def _derive_shared_secret(random_value1, random_value2):    
    key1 = bytearray(random_value1)
    key2 = bytearray(random_value2)
    addition_subroutine(key1, key2, 256)    
    return key1
    
def generate_request(identifier, bobs_public_key, random_value_size=32, encrypt=encrypt):
    """ usage: generate_request(initiator_identifier : bytearray,
                                bobs_public_key : bytearray,
                                random_value_size=32, encrypt=encrypt) => ciphertext, random_value
                                
        Generates a request for the initiating party to send to the receiving party using the receiving party's public key.
        Returns (identifier || random_value), encrypted under the receiver's public key, as well as the plaintext random value.
        The ciphertext should be sent to the receiving party.
        The random value is required to be supplied to the verify_signature method and should be remembered until then. 
        
        identifier should either be the initiators public key
        - or - 
        some means to indicate which public key to respond with i.e. a hash of the public key and a table with the hash:key in it receiver side. """
    random_value = generate_random_value(random_value_size)
    return encrypt(identifier + random_value, bobs_public_key), random_value
    
def sign_request(initial_ciphertext, bobs_private_key, bobs_identifier, 
                 random_value_size=32, encrypt=encrypt, decrypt=decrypt,
                 identifier_resolver=lambda identifier: identifier): # default resolver assumes identifier is just the public key
    """ usage: sign_request(initiation_ciphertext : bytearray, 
                            bobs_private_key : bytearray,
                            bobs_identifier : bytearray,
                            random_value_size=32, 
                            encrypt=encrypt, decrypt=decrypt,
                            identifier_resolver=lambda identifier: identifier) => ciphertext, shared_secret
                            
        Generates a response to the initiation request.
        Returns the response challenge ciphertext, and a shared secret. 
        The identifier_resolver function should take as input the identification string retrieved from the ciphertext, and produce as output the corresponding public key.
        The default function simply assumes the identifier is the public key, but an one could use a hash as the identifier and look it up in a table on the receiving side."""
    plaintext = decrypt(initial_ciphertext, bobs_private_key)
    random_value1 = plaintext[-random_value_size:]
    alices_public_key = identifier_resolver(load_public_key(plaintext[:-random_value_size]))
    random_value2 = generate_random_value(random_value_size)
    message = bobs_identifier + random_value1 + random_value2    
    ciphertext = encrypt(message, alices_public_key)    
    return ciphertext, _derive_shared_secret(random_value1, random_value2)
    
def verify_signature(second_ciphertext, alices_private_key, random_value1, random_value_size=32, decrypt=decrypt):
    """ usage: verify_signature(response_ciphertext : bytearray, 
                                alices_private_key : bytearray,
                                random_value1 : bytearray,
                                random_value_size=32, decrypt=decrypt) => shared secret
                                
        Verifies a signature request. Returns a shared secret. """                
    plaintext = decrypt(second_ciphertext, alices_private_key)
    random_value2 = plaintext[-random_value_size:]
    _random_value1 = plaintext[-(2 * random_value_size):-random_value_size]
    bobs_identifier = plaintext[:-(2 * random_value_size)]
    secret = _derive_shared_secret(random_value1, random_value2)
    if hmac.compare_digest(_random_value1, random_value1):        
        output = secret       
    else:
        output = None
    return output
    
def test_protocol():    
    alices_public, alices_private = generate_keypair()
    bobs_public, bobs_private = generate_keypair()    
        
    # alice does this and sends the initiation message to bob
    signature_request, alices_random1 = generate_request(alices_public, bobs_public)    
        
    # bob does this and sends the response to alice
    signature, bobs_secret = sign_request(signature_request, bobs_private, bobs_public)    
        
    # alice does this and then both alice and bob have a mutual secret. alice has also authenticated bob
    alices_secret = verify_signature(signature, alices_private, alices_random1)        
    assert alices_secret == bobs_secret    
            
if __name__ == "__main__":
    test_protocol()    
    