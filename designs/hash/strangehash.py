from crypto.utilities import rotate_left, pad_input, slide

def branch(word): 
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
        
def test_min_weights():
    from operator import itemgetter
    from crypto.analysis.branch_number import branch_number
    _weights = []
    for r1 in range(8):
        for r2 in range(8):
            def branch(word):
                word ^= rotate_left(word, r1, 8)
                word ^= rotate_left(word, r2, 8)
                return word
            weights = []
            for byte in range(32):
                weights.append(format(branch(byte), 'b').count('1'))
                if weights[-1] == 0:
                    weights.pop(-1)
            _weights.append((r1, r2, weights))
    good_rotations = []
    for r1, r2, weight in _weights:        
        if weight and min(weight) >= 3:
            good_rotations.append((r1, r2))
    
    outputs = []
    for r1, r2 in good_rotations:
        def branch(word):
            word ^= rotate_left(word, r1, 8)
            word ^= rotate_left(word, r2, 8)
            return word
        outputs.append((r1, r2, branch_number(lambda x, y: (branch(x), y))))
    print sorted(outputs, key=itemgetter(2))
            
if __name__ == "__main__":
    #test_strange_hash()
    test_min_weights()
    