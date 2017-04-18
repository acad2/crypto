from os import urandom

import keyexchange
from hashing import hmac, hash_function

from crypto.utilities import integer_to_bytes, bytes_to_integer, xor_subroutine

def generate_keypair():
    return keyexchange.generate_keypair()
    
def generate_signing_key(signers_public_key, signature_key_size=32):
    signing_key = keyexchange.generate_random_secret(signature_key_size)
    return keyexchange.exchange_key(signing_key, signers_public_key), signing_key
    
def retrieve_signing_key(encrypted_signing_key, signers_private_key):
    return keyexchange.recover_key(encrypted_signing_key, signers_private_key)
   
def sign(data, signing_key, signature_size=32, already_hashed=False, hash_function=hash_function):        
    if not already_hashed:        
        data = hash_function(data)
    signature = hmac(data, signing_key)
        
    data = bytearray(data)
    xor_subroutine(data, signing_key)
    
    return data, signature    
    
def verify(encrypted_data, signature, validation_key):        
    data = bytearray(encrypted_data)
    xor_subroutine(data, validation_key)
    
    if hmac(data, validation_key) == signature:
        return True
    else:
        return False

def serialize_key(signing_key):
    return integer_to_bytes(signing_key, 200)

def deserialize_key(serialized_key):
    return bytes_to_integer(serialized_key)               
            
def unit_test():
    pub1, priv1 = generate_keypair()
    pub2, priv2 = generate_keypair()
    data = "Test data" 
    
    encrypted_signature_key, validation_key = generate_signing_key(pub2)    
    signing_key = retrieve_signing_key(encrypted_signature_key, priv2)     
    
    saved_key = serialize_key(signing_key)  
    loaded_key = deserialize_key(saved_key)
    assert loaded_key == signing_key     
        
    #print("Signing: {}".format(data))
    _data, signature = sign(data, serialize_key(signing_key))
    #print("Validating signature: {}".format(signature))
    #print("On data: {}".format(_data))
    assert verify(_data, signature, serialize_key(validation_key))          
    
    
if __name__ == "__main__":
    unit_test()
