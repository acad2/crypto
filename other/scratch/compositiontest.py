from crypto.utilities import rotate_left, rotate_right

def bit_transposition(state):
    output = bytearray(8)
    for index in range(8):
        output[index] = 0
        for index2 in range(8):            
            byte = state[index2]
            output[index] |= ((byte & 1) << index2) & 255
            state[index2] = rotate_right(byte, 1, 8)  
        output[index] = rotate_right(output[index], index, 8)
    state[:] = output[:]  
    
def branch(word): 
    word ^= rotate_left(word, 3, 8)
    word ^= rotate_left(word, 6, 8)
    return word    
    
def wtf(word):
   # word |= rotate_left(word, 3, 8)    
   # word &= rotate_left(word, 6, 8)
    word ^= (rotate_left(word, 1, 8) & rotate_left(word, 6, 8)) | rotate_left(word, 3, 8)           
    return word
    
def composed_function(data):    
    for round in range(2):
        for index, word in enumerate(data):
            data[index] = branch(word)
        bit_transposition(data)
       # for index, word in enumerate(data):
       #     data[index] = branch(word)
       # bit_transposition(data)    
                
def test_composed_function():
    data = range(8)
    data[1] = 1
    composed_function(data)
    print data
    
def test_wtf():
    outputs = []
    for byte in range(256):
        for round in range(32):
            byte = wtf(byte)
        outputs.append(wtf(byte))
    print len(set(outputs))     
     
if __name__ == "__main__":
    #test_composed_function()
    test_wtf()
    