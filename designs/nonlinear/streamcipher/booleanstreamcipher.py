from crypto.utilities import xor_subroutine, rotate_left, bytes_to_words, integer_to_bytes

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def bytes_to_long_longs(data):
    return bytes_to_words(data, 8)
    
def long_longs_to_bytes(*inputs):
    output = bytearray()
    for word in inputs:
        output.extend(integer_to_bytes(word, 8))
    return output
    
def nonlinear_mixing(a, b, c, d): 
    a ^= rotate_left(choice(b, c, d), 1, bit_width=64)
    b ^= rotate_left(choice(c, d, a), 3, bit_width=64)
    c ^= rotate_left(choice(d, a, b), 5, bit_width=64)
    d ^= rotate_left(choice(a, b, c), 7, bit_width=64)
    return a, b, c, d                   
                   
def bitwise_mix_columns(a, b, c, d):
    a ^= choice(b, c, d)
    b ^= choice(c, d, a)
    c ^= choice(d, a, b)
    d ^= choice(a, b, c)
    return a, b, c, d
    
def _stream_cipher(nonce, key, output, data_size, rounds, wordsize=64, constants=range(256)):
    k1, k2, k3, k4 = bytes_to_long_longs(key)
    s1, s2, s3, s4 = bytes_to_long_longs(nonce)
    wordsize /= 8 # wordsize in bytes
    for block in range((data_size / wordsize / 4) + (data_size % wordsize)):
        for round in range(1, rounds + 1):                          
            (s1, s2, 
             s3, s4) = nonlinear_mixing(constants[round ^ 3] ^ s1 ^ k1, constants[round ^ 5] ^ s2 ^ k2, 
                                        constants[round ^ 7] ^ s3 ^ k3, constants[round ^ 13] ^ s4 ^ k4) 
            (k1, k2,
             k3, k4) = nonlinear_mixing(constants[round ^ 17] ^ k1, constants[round ^ 19] ^ k2, 
                                        constants[round ^ 23] ^ k3, constants[round ^ 29] ^ k4)
            
        output.extend(long_longs_to_bytes(s1 ^ k1, s2 ^ k2, s3 ^ k3, s4 ^ k4))            
    
def crypt_stream(plaintext, key, nonce, rounds=16):        
    data = bytearray(plaintext)
    data_size = len(data)
    output = bytearray()  
    
    _stream_cipher(bytearray(nonce), bytearray(key), output, data_size, rounds)    
    xor_subroutine(data, output)    
    return bytes(data)
       
def test_crypt_stream():
    message = bytearray(32)    
    key = bytearray(32)
    nonce = bytearray(32)    
    nonce[-1] = 1
    message[1] = 2
    _message = message[:]
    
    crypt_stream(message, key, nonce)
        
    #print "Ciphertext: {}\n{}".format(len(message), [byte for byte in message])
    
    crypt_stream(message, key, nonce)
    assert message == _message, (message, _message)
    
def test_crypt_stream_metrics():
    from crypto.analysis.metrics import test_stream_cipher
    test_stream_cipher(crypt_stream, bytearray(32), bytearray(32))
        
if __name__ == "__main__":
    test_crypt_stream()
    test_crypt_stream_metrics()        
    