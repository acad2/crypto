from crypto.utilities import rotate_left, slide, integer_to_bytes, bytes_to_integer, xor_subroutine, longs_to_bytes, bytes_to_longs
from crypto.designs.nonlinear.ciphercomponents import choice_rotate_mixRow as nonlinear_mixing       
from crypto.designs.nonlinear.ciphercomponents import invert_choice_rotate_mixRow as invert_nonlinear_mixing

def encrypt(data, key, rounds=2):    
    k1, k2, k3, k4 = bytes_to_longs(key)
    s1, s2, s3, s4 = bytes_to_longs(data)
        
    for round in range(1, rounds + 1):              
        
        s1, s2, s3, s4 = nonlinear_mixing(round ^ s1 ^ k1, 
                                          round ^ s2 ^ k2, 
                                          round ^ s3 ^ k3, 
                                          round ^ s4 ^ k4)
    
        k1, k2, k3, k4 = nonlinear_mixing(k1, k2, k3, k4)            
        
    return longs_to_bytes(s1 ^ k1, s2 ^ k2, s3 ^ k3, s4 ^ k4)    
                
def decrypt(data, key, rounds=2):
    k1, k2, k3, k4 = bytes_to_longs(key)
    s1, s2, s3, s4 = bytes_to_longs(data)
        
    keys = []
    for round in range(1, rounds + 1):
        keys.append((k1, k2, k3, k4))
        k1, k2, k3, k4 = nonlinear_mixing(k1, k2, k3, k4)
    
    s1 ^= k1
    s2 ^= k2
    s3 ^= k3
    s4 ^= k4
    
    for round in reversed(range(1, rounds + 1)):
        k1, k2, k3, k4 = keys.pop(-1)
        
        s1, s2, s3, s4 = invert_nonlinear_mixing(s1, s2, s3, s4)
        s1 ^= k1 ^ round
        s2 ^= k2 ^ round
        s3 ^= k3 ^ round
        s4 ^= k4 ^ round        
    return longs_to_bytes(s1, s2, s3, s4)
    
def test_encrypt_decrypt():
    data = bytearray(16)
    key = bytearray(16)
    #data[3], data[7], data[11], data[15] = 0, 1, 1, 1
    #key[3] = 1
    data[-1] = 1
    key[-1] = 1
    rounds = 2
    ciphertext = encrypt(data, key, rounds)
    print "Ciphertext: \n{}".format(ciphertext)
    
    plaintext = decrypt(ciphertext, key, rounds)
    assert plaintext == data, (plaintext, data)
    
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        
    