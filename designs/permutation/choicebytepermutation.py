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
        
def generate_key2(size_in_bytes):
    key_material = iter(bytearray(urandom((size_in_bytes * 2) + 64)))
    key2 = []
    while len(key2) < size_in_bytes:
        key_byte = next(key_material)
        if key_byte % 2: # odd numbers have a modular inverse
            key2.append(key_byte)
    return key2 
TEST_KEY2 = generate_key2(1024 * 1024)
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(k, a, b):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def psuedohadamard_transform(a, b, modulus=256):
    _a = (a + b) % modulus
    b = (a + (2 * b)) % modulus
    return _a, b
    
def invert_psuedohadamard_transform(a, b, modulus=256):
    _b = modular_subtraction(b, a, modulus)
    a = modular_subtraction((2 * a), b, modulus)
    return a, _b
    
def multiplication_subroutine(data1, data2, modulus):
    for index, byte in enumerate(data1):
        data1[index] = (byte * data2[index]) % modulus        
        
def bytewise_permutation(data, key, key2=TEST_KEY2, rounds=2, modulus=256):
    size = len(data)    
    key_stream = iter(key)
    for round in range(rounds):
        multiplication_subroutine(data, key2, modulus)
        for index1 in range(size):
            for index2 in reversed(range(index1 + 1, size)):                     
                word1, word2 = data[index1], data[index2]                        
                word1, word2 = choice_swap(next(key_stream), word1, word2) 
                data[index1], data[index2] = psuedohadamard_transform(word1, word2, modulus)     
    multiplication_subroutine(data, key2, modulus)              
            
def test_bytewise_permutation():
    from crypto.analysis.cryptanalysis import summarize_sbox
    data = range(16)
    key = generate_key(16)
    
    while not raw_input():
        bytewise_permutation(data, key)
        print data
        #summarize_sbox(data)
      
def test_bytewise_permutation_metrics():
    from crypto.analysis.metrics import test_permutation
    _key = generate_key(16)
    def test_function(data):
        data = bytearray(data)
        bytewise_permutation(data, _key if len(data) < 16 else generate_key(len(data)))
        return bytes(data)        
    test_permutation(test_function, 32)
        
if __name__ == "__main__":
    test_bytewise_permutation()
    test_bytewise_permutation_metrics()
    