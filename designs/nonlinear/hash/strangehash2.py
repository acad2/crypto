from crypto.utilities import rotate_left, pad_input, slide, bytes_to_words, odd_size_to_bytes

def branch(word):             
    # 0 1 2 3  4 5 6 7  8 9 10 11  12 13 14 15
    word ^= rotate_left(word, 3, 16)
    word ^= rotate_left(word, 6, 16)
    word ^= rotate_left(word, 5, 16)
    return word
    
KEY = list(set([branch(word) for word in range(65536)]))
KEY = dict((entry, KEY.index(entry)) for entry in KEY)
        
def strange_hash(data, key=KEY): 
    output = list()
    state = 0
    data = bytes_to_words(bytearray(pad_input(data, 2)), 2)
    for index, word in enumerate(data):        
        state ^= key[branch(word ^ index)]        
        output.append(state)        
    return odd_size_to_bytes(output, 12)
    
def test_strange_hash():
    outputs = []
    for byte in range(256):
        for byte2 in range(256):
            outputs.append(bytes(strange_hash(chr(byte) + chr(byte2))))
        #outputs.append(bytes(strange_hash(chr(byte))))
    #print '\n'.join(bytes(item) for item in outputs[:64])
    print len(set(outputs[4096 * 2:4096 * 3]))
    
if __name__ == "__main__":
    test_strange_hash()
    