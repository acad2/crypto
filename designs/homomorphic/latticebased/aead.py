""" Provides authenticated encryption and decryption functions using only the python standard library and the persistence module.
    Should be replaced by a "real" module with a C backend at some point.  """    
import hashlib
import hmac
from os import urandom 
import six # python 2/3 compatibility

from persistence import save_data, load_data

__all__ = ("InvalidTag", "random_bytes", "psuedorandom_bytes", "encrypt", "decrypt", 
           "Hash_Object", "Key_Derivation_Object", "HKDFExpand", "hkdf_expand",
           "key_derivation_function", "generate_mac", "apply_mac", "verify_mac",
           "hash_function")

_TEST_KEY = "\x00" * 16
_TEST_MESSAGE = "This is a sweet test message :)"

class InvalidTag(BaseException): pass

# from pride.functions.hkdf
DEFAULT_HASH = "sha512"
                    
def extract(input_keying_material, salt, hash_function=DEFAULT_HASH):
    hasher = getattr(hashlib, hash_function.lower())
    return hasher(salt + bytes(input_keying_material)).digest()    
    
def expand(psuedorandom_key, length=32, info='', hash_function=DEFAULT_HASH):
    outputs = [b'']
    hasher = getattr(hashlib, hash_function)
    blocks, extra = divmod(length, hasher().digest_size)
    blocks += 1 if extra else 0
    for counter in range(blocks):
        outputs.append(hmac.HMAC(psuedorandom_key, 
                                 outputs[-1] + info + six.int2byte(counter), 
                                 hasher).digest())      
    return b''.join(outputs)[:length]
    
def hkdf(input_keying_material, length, info='', salt='', hash_function=DEFAULT_HASH):
    return expand(extract(input_keying_material, salt), 
                  length, info, hash_function)                  
                  
def random_bytes(count):
    """ Generates count cryptographically secure random bytes """
    return urandom(count) 
             
def encrypt(data='', key='', mac_key=None, iv=None, extra_data='', algorithm="SHA256",
            mode=None, return_mode="cryptogram", backend=None, iv_size=16, hash_algorithm="sha256"):        
    iv = iv or random_bytes(iv_size)
    if (not data) or (not key) or (not mac_key):
        raise ValueError("Encryption requires data, encryption key, and mac key")
    return _encrypt(data, key, mac_key, iv, extra_data)      
            
def decrypt(packed_encrypted_data, key, mac_key, backend=None):
    """ Decrypts packed encrypted data as returned by encrypt with the same key. 
        If extra data is present, returns plaintext, extra_data. If not,
        returns plaintext. Raises InvalidTag on authentication failure. """       
    return _decrypt(packed_encrypted_data, key, mac_key)        
        
def _hash_stream_cipher_hkdf(data, key, seed, algorithm="sha256"):
    data = bytearray(data)    
    keystream = bytearray(hkdf(key, len(data), seed, algorithm))
    for index, byte in enumerate(keystream):
        data[index] ^= byte
    return bytes(data)
    
def _encrypt(data, key, mac_key, nonce='', extra_data='', algorithm="sha512", nonce_size=32, hmac_algorithm="sha256",
             return_mode="cryptogram"):
    """ usage: _encrypt(data, key, extra_data='', nonce='', 
                hash_function="SHA256", nonce_size=32) => encrypted_packet
    
        Encrypts data using key. 
        Returns a packet of encrypted data, nonce, mac_tag, extra_data
        Authentication and integrity of data, nonce, and extra data are assured
        Confidentiality of data is assured.
        
        Encryption is provided by _hash_stream_cipher.
        Integrity/authenticity are provided via HMAC. 
        nonce is randomly generated when not supplied.
        nonce_size defaults to 32; decreasing below 16 may destroy security.
        A nonce_size of 16 with a random nonce shortens key lifetime when encrypting many messages. """    
    nonce = nonce or urandom(nonce_size)            
    encrypted_data = _hash_stream_cipher_hkdf(data, key, nonce, algorithm)
    
    mode = "hkdf"
    algorithm = algorithm.lower()
    hmac_algorithm = hmac_algorithm.lower()          
    header = algorithm + '_' + mode + '_' + hmac_algorithm
    
    mac_tag = hmac.HMAC(mac_key, header + extra_data + nonce + encrypted_data, getattr(hashlib, hmac_algorithm)).digest()
    
    if return_mode == "cryptogram":
        return save_data(header, encrypted_data, nonce, mac_tag, extra_data)
    elif return_mode == "values":
        return header, encrypted_data, nonce, mac_tag, extra_data
    else:
        raise ValueError("Invalid mode supplied: '{}'; (valid: {})".format(("cryptogram", "values")))
        
def _decrypt(data, key, mac_key):
    """ usage: _decrypt(data, key, mac_key) => (plaintext, extra_data)
                                                or
                                                plaintext
                                          
        Returns (extra_data, plaintext) when extra data is available
        Otherwise, just returns plaintext data. 
        Authenticity and integrity of the plaintext/extra data is guaranteed. """
    header, encrypted_data, nonce, mac_tag, extra_data = load_data(data)
    algorithm, mode, mac_algorithm = header.split('_', 2)
    mac_algorithm = mac_algorithm.lower()
    try:
        hasher = getattr(hashlib, mac_algorithm)
    except AttributeError:
        raise ValueError("Unsupported mode {}".format(header))
        
    if hmac.HMAC(mac_key, header + extra_data + nonce + encrypted_data, hasher).digest() == mac_tag:
        if mode == "hkdf":
            cipher = _hash_stream_cipher_hkdf            
        else:
            assert mode == "hmac"
            ciphert = _hash_stream_cipher_hmac
            
        plaintext = cipher(encrypted_data, key, nonce, algorithm)
        if extra_data:
            return (plaintext, extra_data)
        else:
            return plaintext
    else:
        raise InvalidTag("Invalid tag")
          
def test__encrypt__decrypt():        
    packet = _encrypt(_TEST_MESSAGE, _TEST_KEY, _TEST_KEY, extra_data="extra_data")
    #print "Encrypted packet: \n\n\n", packet
    decrypted = _decrypt(packet, _TEST_KEY, _TEST_KEY)
    assert decrypted == (_TEST_MESSAGE, "extra_data"), decrypted
    
    header, encrypted_data, nonce, mac_tag, extra_data = load_data(packet)
    extra_data = "Changed"
    packet = save_data(header, encrypted_data, nonce, mac_tag, extra_data)
    try:
        _decrypt(packet, _TEST_KEY, _TEST_KEY)
    except InvalidTag:
        pass
    else:
        print "Failed to protect authenticity/integrity of extra_data"
        assert False
    
def test_encrypt_decrypt():
    packet = encrypt(_TEST_MESSAGE, _TEST_KEY, _TEST_KEY, extra_data="extra data")
    decrypted = decrypt(packet, _TEST_KEY, _TEST_KEY)
    assert decrypted == (_TEST_MESSAGE, "extra data"), decrypted
    print "Passed encrypt_decrypt unit test"
    
if __name__ == "__main__":    
    test__encrypt__decrypt()
    test_encrypt_decrypt()    
    