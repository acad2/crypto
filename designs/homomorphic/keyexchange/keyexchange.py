# key exchange from addition

raise NotImplementedError()

from os import urandom

def bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def integer_to_bytes(integer, _bytes):
    output = bytearray()    
    for byte in range(_bytes):        
        output.append((integer >> (8 * (_bytes - 1 - byte))) & 255)
    return output

def generate_private_key():
    return bytes_to_integer(bytearray(urandom(32))), bytes_to_integer(bytearray(urandom(32)))
    
def message(message_bytes):
    size = len(message_bytes)
    if size > 32:
        raise ValueError("Message too long to encrypt")
    m = bytearray(32)
    m[:size] = message_bytes
    return bytes_to_integer(m)
        
def encrypt(m_256, k1_256, k2_256, modulus=2 ** 256):
    m_256 = message(m_256)
    r_256 = bytes_to_integer(bytearray(urandom(32)))
    c_m = (m_256 + k1_256 + r_256) % modulus
    c_r = (r_256 + k2_256) % modulus
    return c_r, c_m
    
def decrypt(c, k1_256, k2_256, modulus=2 ** 256):
    c_r, c_m = c
    r_256 = (modulus + (c_r - k2_256)) % modulus
    m_256 = (modulus + (c_m - (k1_256 + r_256))) % modulus
    return integer_to_bytes(m_256, 32)
    
def public_key_encrypt(message_bytes, public_key, ciphertext_count=16, modulus=2 ** 256):
    m = [0, message(message_bytes)]
    for entry in bytearray(urandom(ciphertext_count)):        
        c_r, c_m = public_key[entry]
        m[0] = (m[0] + c_r) % modulus
        m[1] = (m[1] + c_m) % modulus
    return m     
    
def generate_compressed_public_key(k1, k2):
    return encrypt("\x00" * 32, k1, k2)
    
def decompress_public_key(compressed_key, k1, k2, modulus=2 ** 256):                   
    next_entry = compressed_key
    for key_part in range(8):                    
        next_entry = ((next_entry[0] + next_entry[0]) % modulus,
                      (next_entry[1] + next_entry[1]) % modulus)
            
    _plaintext = decrypt(next_entry, (k1 * 256) % modulus, (k2 * 256) % modulus)        
    assert _plaintext == "\x00" * 32, (_plaintext, len(_plaintext), key_part)
    
    public_key = []
    for entry in range(256):
        next_entry = ((next_entry[0] + next_entry[0]) % modulus,
                      (next_entry[1] + next_entry[1]) % modulus)
        _plaintext = decrypt(next_entry, (k1 * 256) % modulus, (k2 * 256) % modulus)    
        assert _plaintext == "\x00" * 32, (_plaintext, len(_plaintext), entry)
        public_key.append(next_entry)
    return public_key
    
def compress_public_key(public_key):
    return public_key[0]
    
def generate_public_key(k1, k2):
    compressed_key = generate_compressed_public_key(k1, k2)
    public_key = decompress_public_key(compressed_key, k1, k2)
    return public_key
    
def generate_keypair():
    k1, k2 = generate_private_key()
    public_key = generate_public_key(k1, k2)
    return public_key, ((k1 * 256) % (2 ** 256), (k2 * 256) % (2 ** 256))             
        
def test_generate_compressed_public_key_decompress_public_key():
    k1, k2 = generate_private_key()
    compressed_key = generate_compressed_public_key(k1, k2)
    public_key = decompress_public_key(compressed_key, k1, k2)
     
def test_public_key_encrypt():
    public_key, private_key = generate_keypair()
    _message = "Testin!"    
    ciphertext = public_key_encrypt(_message, public_key)
    plaintext = decrypt(ciphertext, *private_key)
    assert plaintext[:len(_message)] == _message, (plaintext, _message)
        
def test_encrypt_decrypt():    
    m = "Testing!"    
    k1, k2 = generate_private_key()
    c = encrypt(m, k1, k2)
    _m = decrypt(c, k1, k2)
    assert _m[:len(m)] == m, (_m, m)
    
if __name__ == "__main__":
    #test_encrypt_decrypt()
    test_generate_compressed_public_key_decompress_public_key()
    test_public_key_encrypt()
    