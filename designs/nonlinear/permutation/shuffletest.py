from os import urandom

def bytes_to_bits(data):
    return ''.join(format(word, 'b').zfill(8) for word in data)
    
def generate_key(size_in_bytes, word_of_all_ones=255):
    key = []
    for bit in bytes_to_bits(bytearray(urandom((size_in_bytes * (size_in_bytes - 1)) / 8))):
        if bit == '1':
            key.append(word_of_all_ones)
        else:
            key.append(0)
    return key    
            
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(k, a, b):
    #k = 0x63
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
                  
def permutation(state, key):
    size = len(state)
    for index in range(size - 1):
        for index2 in range(index + 1, size):            
            word1 = state[index]; word2 = state[index2]
            word1, word2 = choice_swap(key[index], word1, word2)
            state[index] = word1; state[index2] = word2
            
def test_permutation():    
    for count in range(1024):
        key = generate_key(16)
        data = bytearray(urandom(16))
        while len(set(data)) != 16:
            data = bytearray(urandom(16))
        original = data[:]
        permutation(data, key)
        assert data != original
        permutation(data, key)
        assert data == original, (data, original)
        
if __name__ == "__main__":
    test_permutation()
    