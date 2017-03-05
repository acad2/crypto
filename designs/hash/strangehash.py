from crypto.utilities import rotate_left, pad_input, slide

def branch(word): # branch == 5
    word ^= rotate_left(word, 3, 8)
    word ^= rotate_left(word, 6, 8)
    return word
    
def strange_hash(data): # outputs span a 5-bit range; the hash of the first 32 integers yields the 32 outputs the hash can produce; 
    output = bytearray()
    state = 0
    key = list(set([branch(word) for word in range(256)]))
    key = dict((entry, key.index(entry)) for entry in key)

    data = bytearray(pad_input(data, 1))
    for index, byte in enumerate(data):        
        state ^= key[branch(byte ^ index)]
        output.append(state)        
    return quints_to_bytes(output)
    
def quints_to_bytes(hash_output): 
    bits = ''.join(format(word, 'b').zfill(5) for word in hash_output)
    return bytearray(int(_bits, 2) for _bits in slide(bits, 8))                    
        
def test_strange_hash():
    outputs = []
    for byte in range(256):
        outputs.append(bytes(strange_hash(chr(byte))))
    print '\n'.join(bytes(item) for item in outputs[:64])
        
if __name__ == "__main__":
    test_strange_hash()
    