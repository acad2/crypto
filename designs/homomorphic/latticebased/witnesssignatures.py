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
from math import log

import keyexchange
from hashing import hmac, hash_function

from crypto.utilities import integer_to_bytes, bytes_to_integer, xor_subroutine

def generate_keypair():
    """ usage: generate_keypair() => public_key, private_key
    
        Returns a public key and a private key, suitable for use with signing. """
    return keyexchange.generate_keypair()
    
def generate_signature_request(signers_public_key, signature_key_size=32):
    """ usage: generate_signature_request(signers_public_key,
                                          signature_key_size=32) => signature_request, validation_key
                                       
        Returns a signing request and signature validation key.
        The signing request is bound to the owner of the supplied public key - only the owner will be able to produce a signature
        The validation key is bound to the party that generates the signature request - nobody else may use it to verify Bob's signature. """                
    validation_key = deserialize_key(bytearray(urandom(signature_key_size)))
    signature_request = keyexchange.exchange_key(validation_key, signers_public_key)    
    return serialize_key(signature_request), serialize_key(validation_key)
    
def _retrieve_validation_key(encrypted_signing_key, signers_private_key):    
    return keyexchange.recover_key(encrypted_signing_key, signers_private_key)
   
def sign(data, signature_request, private_key, signature_size=32):   
    """ usage: sign(data, signature_request, private_key,
                    signature_size=32) => signature, signing_key
                    
        Returns a signature and signing key.
        The two items should be returned to the requester of the signature for verification. """
    signing_key = bytearray(urandom(signature_size))
    _signing_key = signing_key[:] 
    
    validation_key = _retrieve_validation_key(deserialize_key(signature_request), private_key)        
    xor_subroutine(signing_key, serialize_key(validation_key))               
    signature = hmac(data, signing_key)            
    return signature, _signing_key   
    
def verify(data, signature, signing_key, validation_key):   
    """ usage: verify(data, signature, signing_key, validation_key) => True or False
    
        Returns True if the signature on data is valid.
        Returns False if the signature on data is invalid. """        
    xor_subroutine(signing_key, validation_key)        
    if hmac(data, signing_key) == signature:
        return True
    else:
        return False

def serialize_key(validation_key):
    """ usage: serialize_key(validation_key) => serialized key
    
        Converts a big integer into a byte stream, suitable for transportation. """  
    key_size = log(validation_key, 2)
    key_size_bytes = (key_size / 8) + 1
    return integer_to_bytes(validation_key, int(key_size / 8) + 1)    
    
def deserialize_key(serialized_key):
    """ usage: deserialize_key(serialized_key) => key
    
        Converts a byte stream into a big integer. """
    return bytes_to_integer(serialized_key)               
            
def unit_test():
    pub1, priv1 = generate_keypair()
    pub2, priv2 = generate_keypair()
    data = serialize_key(hash("Test data"))
    
    signature_request, validation_key = generate_signature_request(pub2)    
    # broadcast proof of/commitment to validation key                 
    signature, _signing_key = sign(data, signature_request, priv2)
    # release signature
    # release validation key
    assert verify(data, signature, _signing_key, validation_key)
    
def test_sign_verify_time():
    from timeit import default_timer as timer
    print "Calculating time to generate keypair... "    
    before = timer()
    for number in range(1024):
        public_key, private_key = generate_keypair()
    after = timer()
    print("Time taken to generate 1 keypair: {}".format((after - before) / number))
    print("Time taken to generate {} keypairs: {}".format(number + 1, after - before))
    before = timer()
        
    message = serialize_key(hash(bytes(bytearray(range(32)))))
    pub1, priv1 = generate_keypair()
    pub2, priv2 = generate_keypair()    
    for number in range(1024):                
        #pub1, priv1 = generate_keypair()
        #pub2, priv2 = generate_keypair()    
        signature_request, validation_key = generate_signature_request(pub2)        
        signature, signing_key = sign(message, signature_request, priv2)
        assert verify(message, signature, signing_key, validation_key), number
    after = timer()    
    print("Time taken to sign {} {} byte message: {}".format(1, len(message), (after - before) / (number + 1)))
    print("Time taken to sign {} {} byte message: {}".format(number + 1, len(message), after - before))
    
if __name__ == "__main__":
    unit_test()
    test_sign_verify_time()
    