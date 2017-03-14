from crypto.utilities import slide, xor_subroutine  
from arxcalibur512 import permutation, invert_permutation

ROUNDS = 1
from pprint import pprint
def encrypt(data, iv, key, mac_key):
    # state_0, state_k0 = permute(iv || key)
    # state_1, state_k1 = permute(data_0 || state_k0)
    # state_2, state_k2 = permute(data_1 || state_k1)
    # ...
    # state_n, state_kn = permute(data_n - 1 || state_kn - 1)
    # output state_0 ... state_n as ciphertext; 
    # output state_kn XOR mac_key as tag;
    block_key = key
    assert len(block_key) == 8
    assert len(mac_key) == 8
    assert len(iv) == 8
    assert not len(data) % 8
    ciphertexts = []
    for block in slide(iv + data, 8):
        state = block + block_key        
        for round in range(ROUNDS):
            state = permutation(*state)           
        ciphertexts.extend(state[:8])
        block_key = list(state[8:])
    
    #del ciphertexts[:8] # remove the encryption of the IV 
    xor_subroutine(block_key, mac_key)
    return ciphertexts + block_key
    
def decrypt(data_and_tag, iv, key, mac_key):
    block_key = data_and_tag[-8:]
    xor_subroutine(block_key, mac_key)
    
    ciphertexts = data_and_tag[:-8]
    plaintexts = []
    for ciphertext in reversed(list(slide(ciphertexts, 8))):
        state = ciphertext + block_key
        for round in range(ROUNDS):
            state = invert_permutation(*state)
        plaintexts.extend(state[:8])
        block_key = list(state[8:])   
    
    if list(plaintexts[-8:]) == iv:    
        return plaintexts[:-8]
    else:
        return None
        
def test_encrypt_decrypt():
    data    = [0, 0, 0, 0, 0, 0, 0, 1]
    data2   = [0, 0, 0, 0, 0, 0, 0, 2]
    iv      = [0, 0, 0, 0, 0, 0, 0, 4]
    key     = [0, 0, 0, 0, 0, 0, 0, 1]
    mac_key = [0, 0, 0, 0, 0, 0, 0, 1]    
    ciphertext = encrypt(data, iv, key, mac_key)    
    plaintext = decrypt(ciphertext, iv, key, mac_key)
    assert plaintext == data, (plaintext, data)
    
    ciphertext2 = encrypt(data2, iv, key, mac_key)
    print
    print ciphertext[8:]
    print ciphertext2[8:]
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        
        
    
        
    
    
