from crypto.utilities import words_to_bytes, bytes_to_words, rotate_left, xor_subroutine
        
def _permutation(a, b, modulus=2 ** 32, wordsize=32):    
    a = (a + b) % modulus            
    b = (a + b) % modulus        
    b = rotate_left(b, 2, wordsize)    
    
    a = (a + b) % modulus    
    b = (a + b) % modulus    
    b = rotate_left(b, 4, wordsize)
    
    a = (a + b) % modulus    
    b = (a + b) % modulus    
    b = rotate_left(b, 8, wordsize)
    
    a = (a + b) % modulus    
    b = (a + b) % modulus    
    b = rotate_left(b, 16, wordsize)
    
    a = (a + b) % modulus
    b = (a + b) % modulus
    b = rotate_left(b, 1, wordsize)
    return a, b
    
def permutation(a, b, c, d, modulus=2 ** 32, wordsize=32):
    a, b = _permutation(a, b)
    c, d = _permutation(c, d)
    return a, b, c, d              
        
def add_key(a, b, c, d, k0, k1, k2, k3, modulus=2 ** 32):
    a = (a + k0) % modulus
    b = (b + k1) % modulus
    c = (c + k2) % modulus    
    d = (d + k3) % modulus    
    return a, b, c, d
    
def stream_cipher(data, key, seed, modulus=2 ** 32, wordsize=32):
    #assert isinstance(data, bytearray)
    state = bytes_to_words(bytearray(data), 4)    
    prng_key, seed_key = key
    xor_subroutine(seed, seed_key)
    assert len(seed) == 4, len(seed)
    a, b, c, d = seed
    k0, k1, k2, k3 = prng_key
    
    a, b, c, d = add_key(a, b, c, d, k0, k1, k2, k3)
    a, b, c, d = permutation(a, b, c, d, modulus)
        
    assert len(state)
    for index in range(len(state) - 1):
        a, b, c, d = add_key(a, b, c, d, k0, k1, k2, k3)
        a, b, c, d = add_key(a, b, c, d, index, index + 1, index + 2, index + 3)
        b, c, d, a = permutation(a, b, c, d)
        
        state[index] ^= (a + b) % modulus
        state[(index + 1)] ^= (c + d) % modulus
    _data = words_to_bytes(state, 4)
    try:
        data[:] = _data
    except (ValueError, TypeError):
        pass
    return _data
    
def test_stream_cipher():
    data = bytearray("Awesome0")
    key = ([0, 0, 0, 0], [0, 0, 0, 0])
    seed = [0, 0, 0, 0]
    print stream_cipher(data, key, seed)
    
def test_metrics():
    from crypto.analysis.metrics import test_stream_cipher
    def keygen(byte):               
        return (0, 0, 0, ord(byte)), (0, 0, 0, 0)
    def seedgen(padding, byte):        
        output = bytearray(16)
        try:
            output[-1] = byte
        except (ValueError, TypeError):
            output[-1] = byte[0]
        return bytes_to_words(output, 4)
        
    seed = [0 for count in range(4)]  
    test_stream_cipher(stream_cipher, ([0, 0, 0, 0], [0, 0, 0, 0]), seed, key_generation_function=keygen, seed_generation_function=seedgen)
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 1, 0, 0))
        
        
if __name__ == "__main__":
    visualize_permutation()
    #test_stream_cipher()
    #test_metrics()
    