from crypto.designs.blockcipher.aes_procedures import mixColumns
from crypto.utilities import print_state_4x4

def shuffle_bytes(state, section=slice(0, 16), temp=list(range(16))):          
    temp[7]  = state[0] 
    temp[12] = state[1]
    temp[14] = state[2]
    temp[9]  = state[3]
    temp[2]  = state[4]
    temp[1]  = state[5]
    temp[5]  = state[6]
    temp[15] = state[7]
    temp[11] = state[8]
    temp[6]  = state[9]
    temp[13] = state[10]
    temp[0]  = state[11]
    temp[4]  = state[12]
    temp[8]  = state[13]
    temp[10] = state[14]
    temp[3]  = state[15]
            
    state[section] = temp[:]
    
def mixer(state):
    shuffle_bytes(state)
    mixColumns(state)
        
def test_mixer():
    state = list(bytearray(15)); state.append(1)#range(16)
    print_state_4x4(state, "Before mixing: ")
    while not raw_input("... "):        
        mixer(state)
        print_state_4x4(state, "After mixing: ")
       
def test_mixer_stats():
    state = range(16)
    sbox = []
    for byte in range(256):
        state = bytearray(15)
        state.append(byte)
        mixer(state)
        
    
if __name__ == "__main__":
    test_mixer()
    