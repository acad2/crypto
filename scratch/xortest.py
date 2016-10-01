import itertools
from pride.crypto.utilities import xor_sum, xor_subroutine

#M = M1, M2
#K = K1, K2
#state = M1 xor M2 xor K1 xor K2  # M xor K     
#
#state = M2 xor K1 xor K2         # state xor M1
#M1 = M1 xor M2 xor K1 xor K2     # M1 xor state
#state = M1                       # state xor M1
#
#state = M1 xor M2 xor K2         # state xor M2
#M2 = M1 xor K2                   # M2 xor state
#state = M2                       # state xor M2
#
#M1 = M1 xor M2 xor K2            # M1 xor K1
#M2 = M1                          # M2 xor K2

def shuffle_extract(data, state):    
    """ State update and round key extraction function. """
    for i in reversed(range(1, 256)):
        # Fisher-Yates shuffle
        j = state & (i - 1)                
        data[i], data[j] = data[j], data[i]           

        data[i] ^= s ^ data[i] ^ i # randomize key value   
        state ^= key[i] ^ key[j] # randomize value with output feedback
        
    key[0] ^= data[j] ^ data[i] 
    state ^= key[0] ^ key[j]
    return state
    
def xor_test(message, key, direction):        
    xor_subroutine(message, key)
    state = xor_sum(message)
    
    size = len(message) - 1
    index = 0 if direction == 1 else size
    for counter in range(len(message)):    
        state ^= message[index]           
        random_place = state & size        
        message[index] ^= (state + key[random_place] + ephemeral_byte) % 256
        #message[index] ^= key[random_place & (index - 1)] ^ random_place ^ state
        state ^= message[index]
        
        index += direction
        
    xor_subroutine(message, key)
    
def crack_message(plaintext, ciphertext):             
    keys = []
    size = len(plaintext)
    ASCII = ''.join(chr(counter) for counter in range(256))
    for key_guess in itertools.product(*(ASCII for count in range(size))):
        key = bytearray(key_guess)               
        verifier = ciphertext[:]
        xor_test(verifier, key, -1)
        if verifier == plaintext:
            keys.append(key)
    return keys
    
def test_xor_test():
    message = bytearray("Hi")
    ciphertext = message[:]
    key = bytearray("\x00\x00")
    xor_test(ciphertext, key, 1)
    
    print ciphertext
    print
    xor_test(ciphertext, key, -1)
    print ciphertext
        
    xor_test(ciphertext, key, 1)
    print len(crack_message(message, ciphertext))
     
    message2 = bytearray("Hj")
    ciphertext2 = message2[:]
    xor_test(ciphertext2, key, 1)
    print len(crack_message(message2, ciphertext2))
if __name__ == "__main__":
    test_xor_test()
    