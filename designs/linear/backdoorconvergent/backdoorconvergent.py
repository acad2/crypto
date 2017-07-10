import hashlib

from crypto.utilities import random_bytes, random_integer, modular_inverse, modular_subtraction, bytes_to_integer, integer_to_bytes

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

def hash_function(message, algorithm="sha256"):
    return bytearray(getattr(hashlib, algorithm.lower())(message).digest())
    
def symmetric_encrypt(message, key, _hash=hash_function):
    # encrypt one block of 256 bits
    key_material = _hash(key)
    ciphertext = bytearray(message)
    assert len(key_material) == len(message)    
    for index, byte in enumerate(key_material):
        ciphertext[index] ^= byte
    return ciphertext
    
def symmetric_decrypt(message, key, _hash=hash_function):
    return symmetric_encrypt(message, key, _hash)    
        
def generate_private_key(pi_size=65, n=N):
    pi = random_integer(pi_size)  
    p = modular_inverse(pi, n)    
    return p, pi
    
def generate_public_key(private_key, q_size=32, n=N): 
    """ usage: generate_public_key(private_key, q_size=32, n=N) => public_key
    
        Returns 1 integer, suitable for use as a public key. """
    p, pi = private_key
    r = random_integer(q_size)
    pr = (p * r) % n    
    while pr & 1 != 1:
        r = random_integer(q_size)
        pr = (p * r) % n
    return pr, r
    
def generate_keypair(n=N):
    """ usage: generate_keypair() => public_key, private_key
    
        Generate a keypair; Returns 2 integers. """
    p, pi = private_key = generate_private_key()
    public_key, r = generate_public_key(private_key)
    private_key = (p, pi, modular_inverse(r, n))
    return public_key, private_key
    
def convergent_encrypt(message, public_key, n=N, 
                       _hash=hash_function, encrypt=symmetric_encrypt): 
    """ usage: convergent_encrypt(message, public_key, n=N,
                                  _hash=hash_function, encrypt=symmetric_encrypt) => ciphertext, decryption key
                                  
        Given a plaintext message and public key, returns a ciphertext and secret decryption key.        
        The ciphertext and key are both integers, which is what the convergent_decrypt function requires.
        Ciphertexts produced this way are deterministic - encrypting the same plaintext produces the same ciphertext.
        There exists a private key that allows the decryption of any ciphertext produced this way.
        Currently only supports the encryption of a single 256-bit block of data. """                        
    key = _hash(message)
    ciphertext = bytes_to_integer(encrypt(message, key))       
    key = bytes_to_integer(key)        
    return ((public_key * ciphertext) + key) % n, key
    
def _decrypt(key, ciphertext, decrypt, _hash):            
    key = integer_to_bytes(key, 32)
    message = decrypt(integer_to_bytes(ciphertext, 32), key)
    _mac = _hash(message)    
    if _mac == key:
        return message
    else:
        return None
        
def convergent_decrypt(ciphertext, key, public_key, n=N,
                       _hash=hash_function, decrypt=symmetric_decrypt):   
    """ usage: convergent_decrypt(ciphertext, key, public_key, n=N,
                                  _hash=hash_function, decrypt=symmetric_decrypt) => message or None
                                  
        Decrypts ciphertext using key; If the integrity is validated, then return the message; If not, then return None. """
        
    public_key_ciphertext = modular_subtraction(ciphertext, key, n)
    ciphertext = (modular_inverse(public_key, n) * public_key_ciphertext) % n    
    return _decrypt(key, ciphertext, decrypt, _hash)
    
def backdoor_decrypt(ciphertext, private_key, n=N,
                     _hash=hash_function, decrypt=symmetric_decrypt):  
    """ usage: backdoor_decrypt(ciphertext, private_key, n=N,
                                _hash=hash_function, decrypt=symmetric_decrypt) => message
                                
        Decrypts a ciphertext using the private key; If the integrity is validated, then return the message; If not, then return None.
        This method can be used on any ciphertext that was created with the corresponding public key. """
    p, pi, ri = private_key       
    pikey_cr = (pi * ciphertext) % n    
    cr = pikey_cr % pi    
    pikey = modular_subtraction(pikey_cr, cr, n)
    ciphertext = (cr * ri) % n
    key = (pikey * p) % n
    return _decrypt(key, ciphertext, decrypt, _hash)
        
def hash_public_key(hash_function, public_key):
    """ usage: hash_public_key(hash_function, public_key) => public_key_fingerprint
    
        Returns a hash of public key, suitable for use as an identifier. """
    return hash_function(serialize_public_key(public_key))
        
def serialize_public_key(public_key):
    """ usage: serialize_public_key(public_key) => serialized_public_key
        
        Returns a saved public key, in the form of bytes. """
    return save_data(public_key)
    
def deserialize_public_key(serialized_public_key):
    """ usage: deserialize_public_key(serialized_public_key) => public_key
        
        Loads a saved public key, as produced by serialize_public_key. """
    return load_data(serialized_public_key)
    
def test_serialized_public_key_deserialize_public_key():
    public_key, _ = generate_keypair()
    serialized = serialize_public_key(public_key)
    _public_key = deserialize_public_key(serialized)
    assert _public_key == public_key, (_public_key, public_key)
    
def test_encrypt_decrypt_backdoor():
    public, private = generate_keypair()
    message = bytearray(random_bytes(32))
    ciphertext, key = convergent_encrypt(message, public)
    plaintext = convergent_decrypt(ciphertext, key, public)
    _plaintext = backdoor_decrypt(ciphertext, private)
    assert plaintext == message
    assert _plaintext == plaintext, (_plaintext, plaintext)
    print "backdoorconvergent encryption unit test complete"
    
if __name__ == "__main__":
    test_encrypt_decrypt_backdoor()
           