# online privately verifiable digital signature scheme ("designated verifier signature scheme?")
from os import urandom
from hmac import HMAC
import hashlib

import publickeyencryption

def hmac(key, message, algorithm=hashlib.sha512):
    return HMAC(key, message, algorithm).digest()

MAC_SIZE = len(hmac('\x00', '\x00'))
HASH_SIZE = MAC_SIZE

def generate_signature_request(alices_public_key, bobs_public_key, 
                               message_to_be_signed,
                               mac_function=hmac, signature_token_size=32,
                               encryption_function=publickeyencryption.encrypt_then_mac,
                               serialize_key=publickeyencryption.save_public_key):
    signature_token = urandom(signature_token_size)    
    message = serialize_key(alices_public_key) + signature_token + message_to_be_signed    
    ciphertext = encryption_function(message, bobs_public_key)     
    return ciphertext    
    
def sign(bobs_private_key, bobs_public_key, signature_request, 
         signature_token_size=32, mac_function=hmac, mac_size=MAC_SIZE, hash_size=HASH_SIZE,
         encryption_function=publickeyencryption.encrypt_then_mac, decryption_function=publickeyencryption.decrypt_then_mac,
         serialize_key=publickeyencryption.save_public_key, deserialize_key=publickeyencryption.load_public_key):    
    plaintext = decryption_function(signature_request, bobs_private_key)    
    if plaintext is None:
        raise ValueError("Integrity Error/Invalid MAC")
        
    message_to_be_signed = plaintext[-hash_size:]
    signature_token = plaintext[-(hash_size + signature_token_size):-hash_size]       
    alices_public_key = deserialize_key(plaintext[:-hash_size - signature_token_size])
    signature = mac_function(signature_token, message_to_be_signed)
    message = serialize_key(bobs_public_key) + signature + signature_token + message_to_be_signed
    return encryption_function(message, alices_public_key)            
        
def verify(signature_package, alices_private_key, 
           signature_token_size=32, mac_function=hmac, mac_size=MAC_SIZE, hash_size=HASH_SIZE,
           decryption_function=publickeyencryption.decrypt_then_mac):    
    plaintext = decryption_function(signature_package, alices_private_key)
    if plaintext is None:
        raise ValueError("Integrity Error/Invalid MAC")
        
    message_to_be_signed = plaintext[-hash_size:]
    signature_token = plaintext[-hash_size - signature_token_size:-hash_size]
    signature = plaintext[-hash_size - signature_token_size - mac_size:-hash_size - signature_token_size]
    bobs_public_key = load_public_key(plaintext[:-hash_size - signature_token_size - mac_size])
    _signature = mac_function(signature_token, message_to_be_signed)
    if signature == _signature:
        return True
            
def test_sign_verify():
    from hashlib import sha512
    from publickeyencryption import generate_keypair    
    alice_public, alice_private = generate_keypair()
    bob_public, bob_private = generate_keypair()
    message_to_be_signed = sha512("\x00").digest()
    
    request = generate_signature_request(encrypt, alice_public, bob_public, message_to_be_signed)
    signature = sign(decrypt, encrypt, bob_private, bob_public, request)
    assert verify(signature, decrypt, alice_private)
    
if __name__ == "__main__":
    test_sign_verify()
            