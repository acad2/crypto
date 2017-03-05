def branch(word):
    word ^= rotate_left(word, 3, 8)
    word ^= rotate_left(word, 6, 8)
    return word
    
def strange_hash(data):
    output = 0
    key = sorted(set([branch(word) for word in range(256)]))
    for index, byte in enumerate(data):
        output ^= key[branch(byte ^ output ^ index)]
    return output
    
def test_strange_hash():
    for byte in range(256):
        print strange_hash(chr(byte))
        
        
if __name__ == "__main__":
    test_strange_hash()
    