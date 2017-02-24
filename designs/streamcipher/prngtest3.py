from crypto.utilities import rotate_left, choice, bytes_to_words, words_to_bytes

def add_key(a, b, c, d, k0, k1, k2, k3):
    a = a ^ k0
    b = b ^ k1
    c = c ^ k2
    d = d ^ k3
    return a, b, c, d
    
def choice_swap(a, b, c):
    t = b
    b = choice(a, b, c)
    c = choice(a, c, t)
    return b, c
        
def transpose_columns(a, b, c, d):
    a, b = choice_swap(c, a, b)
    c, d = choice_swap(a, c, d)
    b, c = choice_swap(d, b, c)
    d, a = choice_swap(b, d, a)
    return a, b, c, d            
            
def bit_transposition(a, b, c, d, wordsize=32):
    a, b, c, d = transpose_columns(a, b, c, d)            
    b = rotate_left(b, 1, wordsize)
    c = rotate_left(c, 2, wordsize)
    d = rotate_left(d, 3, wordsize)
                
    a, b, c, d = transpose_columns(a, b, c, d)
    b = rotate_left(b, 4, wordsize)
    c = rotate_left(c, 8, wordsize)
    d = rotate_left(d, 12, wordsize)
    
    a, b, c, d = transpose_columns(a, b, c, d)
    b = rotate_left(b, 16, wordsize)
    c = rotate_left(c, 20, wordsize)
    d = rotate_left(d, 24, wordsize)
    
    return transpose_columns(a, b, c, d)
      
def keyed_permutation(a, b, c, d, k0, k1, k2, k3, counter, wordsize=32):    
    a, b, c, d = add_key(a, b, c, d, k0, k1, k2, k3)
    a, b, c, d = add_key(a, b, c, d, counter, counter << 1, counter << 2, counter << 4)
    a, b, c, d = bit_transposition(a, b, c, d, wordsize)
    return a, b, c, d
    
def _prng(a, b, c, d, k0, k1, k2, k3, wordsize=32):
    a, b, c, d = keyed_permutation(a, b, c, d, k0, k1, k2, k3, 1, wordsize)
    return a, b, c, d, k0, k1, k2, k3
       
def stream_cipher(data, key, nonce):
    state = bytes_to_words(bytearray(data), 4)
    nonce = bytes_to_words(bytearray(nonce), 4)
    key = bytes_to_words(bytearray(key), 4)
    
    blocks = len(state) - 4
    assert blocks > 0
    try:
        for index in range(blocks): 
            nonce = list(keyed_permutation(*(nonce + key + [index + 1])))
            state[(index * 4) + 0] ^= nonce[0]
            state[(index * 4) + 1] ^= nonce[1]
            state[(index * 4) + 2] ^= nonce[2]
            state[(index * 4) + 3] ^= nonce[3]
    except IndexError:
        pass
    _data = words_to_bytes(state, 4)
    try:
        data[:] = _data
    except (TypeError, ValueError):
        pass
    return _data
    
        
def visualize_permutation():
    from crypto.analysis.visualization import test_8x32_function
    test_8x32_function(prng, [0, 0, 0, 1, 0, 0, 1, 0])
    
def test_metrics():
    from crypto.analysis.metrics import test_stream_cipher
    test_stream_cipher(stream_cipher, "\x00" * 16, "\x00" * 16)
        
        
if __name__ == "__main__":
    #visualize_permutation()
    test_metrics()    
    
    