from crypto.utilities import rotate_left

def csprng(state):
    key = 0
    for byte in state:
        key ^= byte
    
    length = len(state)    
    for index, byte in enumerate(state):
        byte = (byte + key + index + state[(index + 1) % length] + state[(length + (index - 1)) % length]) & 255
        key ^= rotate_left(byte, 3)
        state[index] = byte
        
    for i in reversed(range(1, len(state))):                       
        # Fisher-Yates shuffle
        j = key & (i - 1)                
        state[i], state[j] = state[j], state[i]           

        key ^= state[j] ^ state[i] ^ i # randomize key value           
                  
        
def test_csprng():
    state = bytearray(16)
    state2 = state[:]
    state[0] = 2
    state2[0] = 1
    
    csprng(state)
    print '\n'.join([format(byte, 'b').zfill(8) for byte in state])
    csprng(state2)
    print
    print '\n'.join([format(byte, 'b').zfill(8) for byte in state2])
    
if __name__ == "__main__":
    test_csprng()
    