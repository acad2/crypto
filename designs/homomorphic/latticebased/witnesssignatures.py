""" Allows Alice and Bob to sign messages using public key encryption.
    
    1. Alice sends Bob a secret via his public key and remembers it for later. (K0)
    2. Bob decrypts and obtains the secret using his private key
    3. Bob generates an additional secret of his own (K1) and combines it with the transported secret via xor. (K0 XOR K1 = K_verify)
    4. Bob computes the HMAC tag of the (hash of the) data to be signed, using the key generated in the previous step as the HMAC key (K_verify)
    5. Bob releases the hmac_tag and K1 as the signature
    6. Alice may verify the signature by computing the hmac tag via HMAC(data, K0 XOR K1)
    
    The signature obtained by Alice at the end can not be used by anyone other then Alice to verify that Bob signed anything 
        - Alice easily could just generate a random HMAC tag of the data and claim anyone generated the signature
            - Bob has deniability 
        - But the signature verification is meaningful to Alice             
        - Bob has no idea who will be verifying his signature
            - The verifier remains anonymous
     
    Signing goals:
        Bobs decryption operation demonstrates his possession of the private key (Authentication)
        The signature cannot be forged by Alice (or anyone else)                 (Unforgeable)
            - Alice could not have computed the HMAC tag on the data without K1 
            - Nobody else has either K0 or K1 and so cannot verify or forge anything
    
    Extension:
    
    After step 1, Alice publishes a commitment to K0 and broadcasts it 
    Bob broadcasts his signature
    Alice waits some time to ensure everyone has seen the signature, and then broadcasts K0
    
    Then, anyone who heard the broadcasts can verify the signature.
    If they want actual *proof*, they can request a signature from Bob directly.
        - The more people engage in proofs and broadcast, the higher the confidence in the signature on the data 
        - Worst case scenario: 1-to-1 nature: everyone gets their own signature, individually
        - Best case scenario: 
            - The more proofs that are broadcasted, the fewer 1-to-1 proofs that need to occur
            - If a signature is witnessed by a peer that happens to be trusted, then we do not need to obtain our own direct proof"""          
from os import urandom

import keyexchange
from hashing import hmac, hash_function

from crypto.utilities import integer_to_bytes, bytes_to_integer, xor_subroutine

def generate_keypair():
    return keyexchange.generate_keypair()
    
def generate_validation_key(signers_public_key, signature_key_size=32):
    signing_key = keyexchange.generate_random_secret(signature_key_size)
    return keyexchange.exchange_key(signing_key, signers_public_key), signing_key
    
def retrieve_validation_key(encrypted_signing_key, signers_private_key):
    return keyexchange.recover_key(encrypted_signing_key, signers_private_key)
   
def sign(data, validation_key, signature_size=32, already_hashed=False, hash_function=hash_function):        
    if not already_hashed:        
        data = hash_function(data)
        
    signing_key = bytearray(urandom(signature_size))
    _signing_key = signing_key[:]
    
    xor_subroutine(signing_key, validation_key)
    signature = hmac(data, signing_key)        
    
    return data, signature, _signing_key   
    
def verify(data, signature, signing_key, validation_key):            
    xor_subroutine(validation_key, signing_key)
    
    if hmac(data, validation_key) == signature:
        return True
    else:
        return False

def serialize_key(signing_key):
    return integer_to_bytes(signing_key, 32)

def deserialize_key(serialized_key):
    return bytes_to_integer(serialized_key)               
            
def unit_test():
    pub1, priv1 = generate_keypair()
    pub2, priv2 = generate_keypair()
    data = "Test data" 
    
    encrypted_signature_key, validation_key = generate_validation_key(pub2)    
    # broadcast proof of/commitment to validation key
    signing_key = retrieve_validation_key(encrypted_signature_key, priv2)     
    
    saved_key = serialize_key(signing_key)  
    loaded_key = deserialize_key(saved_key)
    assert loaded_key == signing_key     
        
    print("Signing: {}".format(data))
    _data, signature, _signing_key = sign(data, serialize_key(signing_key))
    print("Validating signature: {}".format(signature))
    print("On data: {}".format(_data))
    # release validation key
    assert verify(_data, signature, _signing_key, serialize_key(validation_key))          
    
    
if __name__ == "__main__":
    unit_test()
