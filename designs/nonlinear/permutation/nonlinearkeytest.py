from crypto.utilities import rotate_left

def fill(byte):
    byte ^= rotate_left(byte, 1, 32)
    byte ^= rotate_left(byte, 2, 32)
    byte ^= rotate_left(byte, 4, 32)
    byte ^= rotate_left(byte, 8, 32)
    byte ^= rotate_left(byte, 16, 32)
    #byte ^= rotate_left(byte, 32, 64)    
    return byte
    
def mix_columns(_a, _b, _c, _d):
    _a ^= _b
    _c ^= _d
    _b ^= _c
    _d ^= _a
    #r = [_a, _b, _c, _d]
    #a = [0] * 4
    #b = [0] * 4
    #for count in range(4):
    #    a[count] = r[count]        
    #    h = fill(r[count] >> 7)
    #    b[count] = (r[count] << 1) & 0xFFFFFFFF
    #    b[count] ^= 0xc3 & h
    #    
    #r[0] = b[0] ^ a[3] ^ a[2] ^ b[1] ^ a[1]
    #r[1] = b[1] ^ a[0] ^ a[3] ^ b[2] ^ a[2]
    #r[2] = b[2] ^ a[1] ^ a[0] ^ b[3] ^ a[3]
    #r[3] = b[3] ^ a[2] ^ a[1] ^ b[0] ^ a[0]
    return _a, _b, _c, _d
    
def encrypt(a, b, c, d):           
    t = a
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t           
    a, b, c, d = mix_columns(a, b, c, d)    
    return a, b, c, d
    
def visualize_encrypt():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(encrypt, (0, 0, 0, 1))
    
#def test_active_bits():
    
if __name__ == "__main__":
    visualize_encrypt()
    