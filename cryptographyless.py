""" Provides authenticated encryption and decryption functions using only the python standard library and the persistence module.
    Used when the cryptography module cannot be installed.  """
raise NotImplementedError() # todo: copy aead from epqcrypto
    
import itertools
import hashlib
import hmac
import os
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
DEFAULT_HASH = "sha256"
OUTPUT_SIZES = {"sha1" : 20,
                "sha224" : 28,
                "sha256" : 32,
                "sha384" : 48,
                "sha512" : 64}
                    
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
                  
class HKDF(object):
                        
    def __init__(self, hash_function=DEFAULT_HASH):
        self.hash_function = hash_function
        self.hash_length = OUTPUT_SIZES[hash_function]
        
    def extract(self, input_keying_material, salt=''):
        return extract(input_keying_material, salt, self.hash_function)        
        
    def expand(self, psuedorandom_key, length, info=''):
        return expand(psuedorandom_key, length=length, info=info, hash_function=self.hash_function)
        
    def hkdf(self, input_keying_material, length, info='', salt=''):
        return hkdf(input_keying_material, length, info, salt)
        
# end code from pride.functions.hkdf        
                  
def random_bytes(count):
    """ Generates count cryptographically secure random bytes """
    return os.urandom(count) 
             
class Key_Derivation_Object(object):
    
    def __init__(self, algorithm, length, salt, iterations):
        self.algorithm = algorithm
        self.length = length
        self.salt = salt
        self.iterations = iterations
        
    def derive(self, kdf_input):
        return hashlib.pbkdf2_hmac(self.algorithm, kdf_input, self.salt, 
                                   self.iterations, self.length)
        
class HKDFExpand(object):
    
    def __init__(self, algorithm="sha256", length=32, info='', backend=None):
        self.algorithm = algorithm
        self.length = length
        self.info = info
        
    def derive(self, key_material):
        return expand(key_material, length=self.length, info=self.info, 
                      hash_function=getattr(hashlib, self.algorithm.lower()))
                           
class Hash_Factory(object):
            
    def __init__(self, algorithm_name):
        self.hash_factory = getattr(hashlib, algorithm_name.lower())
        
    def __call__(self, message=''):
        return Hash_Object(self.hash_factory(message))
        
        
class Hash_Object(object):

    def __init__(self, hash_function):
        self.hash_function = hash_function
        
    def __getattribute__(self, attribute):
        get_attribute = super(Hash_Object, self).__getattribute__
        try:
            return getattr(get_attribute("hash_function"), attribute)
        except AttributeError:
            try:
                return get_attribute(attribute)
            except AttributeError:
                raise AttributeError("{} object has no attribute '{}'".format(self, attribute))              
                
    def finalize(self):
        return self.hash_function.digest()

def hash_password(password, iterations, algorithm="pbkdf2hmac", sub_algorithm="sha256",
                                        salt=None, salt_size=16, output_size=32,
                                        backend="cryptographyless"):    
    salt = os.urandom(salt_size)
    header = save_data(algorithm, sub_algorithm, iterations, salt_size, output_size)
    if algorithm == "pbkdf2hmac":
        return save_data(header, salt, hashlib.pbkdf2_hmac(sub_algorithm, header + password, salt, iterations, output_size))
    else:
        return -1

def verify_hashed_password(password, header_salt_hash, backend="cryptographyless"):
    header, salt, correct_output = load_data(header_salt_hash)
    algorithm, sub_algorithm, iterations, salt_size, output_size = load_data(header)
    if algorithm == "pbkdf2hmac":
        output = hashlib.pbkdf2_hmac(sub_algorithm, header + password, salt, iterations, output_size)
    else:
        return -1
    return constant_time_comparison(output, correct_output)    
    
def constant_time_comparison(data1, data2):
    return hmac.compare_digest(data1, data2)        
        
def hash_function(algorithm_name, backend=None):
    return Hash_Factory(algorithm_name)()#Hash_Object(algorithm_name.lower())#getattr(hashlib, algorithm_name.lower())()
 
def hkdf_expand(algorithm="SHA256", length=256, info='', backend=None):
    """ Returns an hmac based key derivation function (expand only) from
        cryptography.hazmat.primitives.hkdf. """
    return HKDFExpand(algorithm, length, info, backend)
                      
def key_derivation_function(salt, algorithm="sha256", length=32, 
                            iterations=100000, backend=None):
    return Key_Derivation_Object(algorithm, length, salt, iterations)
    
def generate_mac(key, data, algorithm="SHA256", backend=None):    
    return hmac.HMAC(key, algorithm + "::" + data, Hash_Factory(algorithm)).digest()
    
def apply_mac(key, data, algorithm="SHA256", backend=None):
    return save_data(generate_mac(key, data, algorithm, backend), data)
                    
def verify_mac(key, packed_data, algorithm="SHA256", backend=None):
    """ Verifies a message authentication code as obtained by apply_mac.
        Successful comparison indicates integrity and authenticity of the data. """
    mac, data = load_data(packed_data)
    calculated_mac = hmac.HMAC(key, algorithm + "::" + data, Hash_Factory(algorithm)).digest()        
    try:
        if not hmac.compare_digest(mac, calculated_mac):
            raise InvalidTag()
    except InvalidTag: # to be consistent with how it is done when the cryptography package is used
        return InvalidTag()
    else:
        return data

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
    
def _hmac_rng(key, seed, hash_function="SHA256"):
    """ Generates psuedorandom bytes via HMAC. Implementation could be improved to
        a compliant scheme like HMAC-DRBG. """
    hasher = hmac.HMAC(key, seed, getattr(hashlib, hash_function.lower()))
    for counter in (str(number) for number in itertools.count()):
        yield hasher.digest()
        hasher.update(key + seed + counter)
    
def psuedorandom_bytes(key, seed, count, hash_function="SHA256"): 
    """ usage: psuedorandom_bytes(key, seed, count, 
                                  hash_function="SHA256") => psuedorandom bytes
                
        Generates count cryptographically secure psuedorandom bytes. 
        Bytes are produced deterministically based on key and seed, using 
        hash_function with _hmac_rng. """
    hash_function = hash_function.lower()
    generator = _hmac_rng(key, seed, hash_function)
    output = ''
    output_size = getattr(hashlib, hash_function)().digest_size    
    iterations, extra = divmod(count, output_size)
    for round in range(iterations + 1 if extra else iterations):
        output += next(generator)
    return output[:count]       
            
def _hash_stream_cipher_hmac(data, key, nonce, hash_function="SHA256"):    
    """ Generates key material and XORs with data. Provides confidentiality,
        but not authenticity or integrity. As such, this should seldom be used alone. """
    output = bytearray(data)
    for index, key_byte in enumerate(bytearray(psuedorandom_bytes(key, nonce, len(data), hash_function))):
        output[index] ^= key_byte
    return bytes(output)    
        
def _hash_stream_cipher_hkdf(data, key, seed, algorithm="sha256"):
    data = bytearray(data)    
    keystream = bytearray(hkdf(key, len(data), seed, algorithm))
    for index, byte in enumerate(keystream):
        data[index] ^= byte
    return bytes(data)
    
def _encrypt(data, key, mac_key, nonce='', extra_data='', algorithm="sha256", nonce_size=32, hmac_algorithm="sha256",
             cipher_priority=("hkdf", "hmac"), return_mode="cryptogram"):
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
    nonce = nonce or os.urandom(nonce_size)        
    try:
        cipher = _hash_stream_cipher_hkdf
    except NameError:
        cipher = _hash_stream_cipher_hmac
        mode = "hmac"
    else:
        mode = "hkdf"
    algorithm = algorithm.lower()
    hmac_algorithm = hmac_algorithm.lower()
        
    encrypted_data = cipher(data, key, nonce, algorithm)

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
        
def test_hmac_rng():
    output = ''
    one_megabyte = 1024 * 1024
    for random_data in _hmac_rng(_TEST_KEY, _TEST_MESSAGE):
        output += random_data
        if len(output) >= one_megabyte: 
            break
    
    outputs = dict((x, output.count(chr(x))) for x in xrange(256))
    import pprint
    #pprint.pprint(sorted(outputs.items()))
    
    output2 = psuedorandom_bytes(_TEST_KEY, _TEST_MESSAGE, one_megabyte)
    assert output == output2, (len(output), len(output2))
    
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
    
def test_hash_password():
    password = "password"
    iterations = 100000
    _hash = hash_password(password, iterations)
    assert verify_hashed_password(password, _hash)   
    invalid_password = "passwore"
    assert not verify_hashed_password(invalid_password, _hash)    
    print "Passed hash_password/verify_password unit test"
    
if __name__ == "__main__":
    test_hmac_rng()
    test__encrypt__decrypt()
    test_encrypt_decrypt()
    test_hash_password()
    