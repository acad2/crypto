# didnt work

from crypto.utilities import rotate_left, slide, bytes_to_words, words_to_bytes, pad_input

WORDSIZE = 32

def vector_rotate(word, amount, wordsize=WORDSIZE):
    return ((rotate_left((word >> 24) & 255, amount, 8) << 24) | 
            (rotate_left((word >> 16) & 255, amount, 8) << 16) | 
            (rotate_left((word >> 8) & 255, amount, 8)  <<  8) | 
            rotate_left(word & 255, amount, 8))   
    
def mix_pairs(a, b, c, d, wordsize=WORDSIZE):        
    a ^= b
    c ^= d    
    a = vector_rotate(a, 1)
    c = vector_rotate(c, 1)
    b ^= a
    d ^= c
    b = vector_rotate(b, 2)
    d = vector_rotate(d, 2)
    a ^= b
    c ^= d
    a = vector_rotate(a, 4)
    c = vector_rotate(c, 4)
    b ^= a
    d ^= c
    return a, b, c, d
    
def shift_rows(b, d, amount, wordsize=WORDSIZE):    
    b = rotate_left(b, (8 * amount), 32)#wordsize)
    d = rotate_left(d, (8 * amount), 32)#wordsize)
    return b, d
                
def mix_words(a, b, c, d, wordsize=WORDSIZE):
    a, b, c, d = mix_pairs(a, b, c, d, wordsize)
    b, d = shift_rows(b, d, 1, wordsize)    
    a, b, c, d = mix_pairs(a, b, c, d, wordsize)
    b, d = shift_rows(b, d, 2, wordsize)
    a, b, c, d = mix_pairs(a, b, c, d, wordsize) 
    a, d, b, c = mix_pairs(a, d, b, c, wordsize)
    return a, b, c, d
    
def compression_function(data):
    o0, o1, o2, o3 = 0, 1, 8 , 64
    for a, b, c, d in slide(bytes_to_words(data, 4), 4):
        a, b, c, d = mix_words(a, b, c, d)
        s0, s1, s2, s3 = mix_words(a, 1, 8, 64)
        s0, s1, s2, s3 = mix_words(s0, b, s1, s3)
        s0, s1, s2, s3 = mix_words(s0, s1, c, s3)
        s0, s1, s2, s3 = mix_words(s0, s1, s2, d)
        
        o0 ^= s0; o1 ^= s1; o2 ^= s2; o3 ^= s3;
    return words_to_bytes((o0, o1, o2, o3), 4)
    
def hash_function(data):
    data = pad_input(bytearray(data), 16)    
    return compression_function(data)        
        
def test_compression_function():
    data = bytearray(16)
    data[0] = 1
    print compression_function(data)
    data[0] = 2
    print compression_function(data)
    
def test_hash_function():
    data = bytearray(1)
    for count in range(256):
        data[0] = count
        print hash_function(data)
        if raw_input(): break

def test_metrics():
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function)
            
            
if __name__ == "__main__":
    #test_compression_function()
    #test_hash_function()
    test_metrics()
        
        