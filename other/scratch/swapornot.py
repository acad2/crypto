from crypto.utilities import xor_subroutine
from crypto.designs.ciphercomponents import choice

def swap_or_not(message, key, key2):
    k_xor_message = message ^ key
    choice(k_xor_message, message, key2)    
    
    for index in range(len(message)):
        a, b = message[index], k_xor_message[index]
        _a, _b = message[a], k_xor_message[b]       
        message[a]        = choice(_b, _a, key2[index])
        k_xor_message[b]  = choice(_a, _b, key2[index])        
        
        #if key2[index]:        
        #    temp = message[a]
        #    message[a] = k_xor_message[b]
        #    k_xor_message[b] = message[temp]
        #else:            
        #    temp = k_xor_message
        #    message[a] = message[a]
        #    k_xor_message[b] = k_xor_message[b]
            
            
def test_swap_or_not():
    message = []
    key = []
    key2 = []
    for word in range(4):
        message.extend((int(bit) for bit in format(word, 'b').zfill(8)))
        key.extend((int(bit) for bit in format(word * 2, 'b').zfill(8)))
        key2.extend((int(bit) for bit in format(word * 1, 'b').zfill(8)))
    print("Before: {}".format(message))
    for round in range(2):
        swap_or_not(message, key, key2)
    print("After : {}".format(message))
    
if __name__ == "__main__":
    test_swap_or_not()
    