# imported by a few modules. Mostly contains ideas that weren't very efficient
from crypto.utilities import rotate_left, rotate_right, shift_left, shift_right, xor_subroutine
from crypto.utilities import slide, integer_to_bytes, bytes_to_integer, longs_to_bytes, bytes_to_longs

def mixRow(a):
    b = a & 0x80808080;
    
    # b |= b >> 1; # without multiply instruction
    # b |= b >> 3;
    # b >>= 3;
        
    b = (b >> 7) * 0x1B; # with multiply instruction

    b ^= (a << 1) & 0xFEFEFEFE;
    c = a ^ b;
    b ^= (c >>  8) | ((c << 24) & 0xFFFFFFFF);
    b ^= ((a <<  8) & 0xFFFFFFFF) | (a >> 24);
    return b ^ (a >> 16) ^ ((a << 16) & 0xFFFFFFFF);
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))  
    
def choice_rotate_mixRow(a, b, c, d):    
    a ^= mixRow(rotate_left(choice(b, c, d), 1, bit_width=32))
    b ^= mixRow(rotate_left(choice(c, d, a), 3, bit_width=32))
    c ^= mixRow(rotate_left(choice(d, a, b), 5, bit_width=32))
    d ^= mixRow(rotate_left(choice(a, b, c), 7, bit_width=32)) 
    return a, b, c, d  

def invert_choice_rotate_mixRow(a, b, c, d):
    d ^= mixRow(rotate_left(choice(a, b, c), 7, bit_width=32)) 
    c ^= mixRow(rotate_left(choice(d, a, b), 5, bit_width=32))
    b ^= mixRow(rotate_left(choice(c, d, a), 3, bit_width=32))
    a ^= mixRow(rotate_left(choice(b, c, d), 1, bit_width=32))
    return a, b, c, d   
    
def byte_transposition_state(state):                 
    #state[0] = state[0] # does not need to be done
    temp = state[1]
    
    state[1] = state[7] 
    state[7] = state[2]    
    state[2] = state[14]    
    state[14] = state[4]
    state[4] = state[5]
    state[5] = state[11]
    state[11] = state[6]
    state[6] = state[8]
    state[8] = state[3]
    state[3] = temp
         
    temp = state[9]
    state[9] = state[10]
    state[10] = state[13]
    state[13] = state[12]
    state[12] = state[15]        
    state[15] = temp  
    
def byte_transposition_words(a, b, c, d):                 
    t0 = (((a >> 0 ) & 255)) | (((b >> 24) & 255) << 8) | (((d >> 16) & 255) << 16) | (((a >> 8 ) & 255) << 24)
    t1 = (((b >> 8 ) & 255)) | (((c >> 24) & 255) << 8) | (((c >> 0 ) & 255) << 16) | (((a >> 16) & 255) << 24)
    t2 = (((a >> 24) & 255)) | (((c >> 16) & 255) << 8) | (((d >> 8 ) & 255) << 16) | (((b >> 16) & 255) << 24)
    t3 = (((d >> 24) & 255)) | (((d >> 0 ) & 255) << 8) | (((b >> 0 ) & 255) << 16) | (((c >> 8 ) & 255) << 24)
    return t0, t1, t2, t3             
    
def bit_transposition_words(a, b, c, d):    
    # top half   
    # the strange ordering applies shuffle_bytes before the bit permutation                     
    t = (b ^ (b >> 7)) & 0x00AA00AA;  b = b ^ t ^ (t << 7);    
    t = (a ^ (a >>14)) & 0x0000CCCC;  a = a ^ t ^ (t <<14); 
    t = (b ^ (b >>14)) & 0x0000CCCC;  b = b ^ t ^ (t <<14); 
    
    t = (a & 0xF0F0F0F0) | ((b >> 4) & 0x0F0F0F0F); 
    b = ((a << 4) & 0xF0F0F0F0) | (b & 0x0F0F0F0F);     
    
    # bottom half           
    t2 = (d ^ (d >> 7)) & 0x00AA00AA;  d = d ^ t2 ^ (t2 << 7); 
    
    t2 = (c ^ (c >>14)) & 0x0000CCCC;  c = c ^ t2 ^ (t2 <<14); 
    t2 = (d ^ (d >>14)) & 0x0000CCCC;  d = d ^ t2 ^ (t2 <<14); 
    
    t2 = (c & 0xF0F0F0F0) | ((d >> 4) & 0x0F0F0F0F); 
    d = ((c << 4) & 0xF0F0F0F0) | (d & 0x0F0F0F0F);    
    
    return t, b, t2, d
    
def optimized_bit_byte_transposition_words(a, b, c, d):  

    x = ((a >> 0) & 255) | (((b >> 24) & 255) << 8) | (((d >> 16) & 255) << 16) | (((a >> 24) & 255) << 24)
    y = ((b >> 8) & 255) | (((c >> 24) & 255) << 8) | (((c >> 0 ) & 255) << 16) | (((a >> 16) & 255) << 24)    
         
    # top half   
    # the strange ordering applies shuffle_bytes before the bit permutation                     
    t = (y ^ (y >> 7)) & 0x00AA00AA;  y = y ^ t ^ (t << 7);    
    t = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t ^ (t <<14); 
    t = (y ^ (y >>14)) & 0x0000CCCC;  y = y ^ t ^ (t <<14); 
    
    t = (x & 0xF0F0F0F0) | ((y >> 4) & 0x0F0F0F0F); 
    y = ((x << 4) & 0xF0F0F0F0) | (y & 0x0F0F0F0F);     
    
    # bottom half
    x2 = ((a >> 24) & 255) | (((c >> 16) & 255) << 8) | (((d >> 8 ) & 255) << 16) | (((b >> 16) & 255) << 24)
    y2 = ((d >> 24) & 255) | (((d >> 0 ) & 255) << 8) | (((b >> 0 ) & 255) << 16) | (((c >> 8 ) & 255) << 24)   
    
#    x2 =  (((state2 >> 56) & 255) << 24) | (((state2 >> 48) & 255) << 16) | (((state2 >> 40) & 255) << 8) | ((state2 >> 32) & 255)
#    d = (((state2 >> 24) & 255) << 24) | (((state2 >> 16) & 255) << 16) | (((state2 >> 8) & 255) << 8)  |  (state2 & 255)       
       
    t2 = (y2 ^ (y2 >> 7)) & 0x00AA00AA;  y2 = y2 ^ t2 ^ (t2 << 7); 
    
    t2 = (x2 ^ (x2 >>14)) & 0x0000CCCC;  x2 = x2 ^ t2 ^ (t2 <<14); 
    t2 = (y2 ^ (y2 >>14)) & 0x0000CCCC;  y2 = y2 ^ t2 ^ (t2 <<14); 
    
    t2 = (x2 & 0xF0F0F0F0) | ((y2 >> 4) & 0x0F0F0F0F); 
    y2 = ((x2 << 4) & 0xF0F0F0F0) | (y2 & 0x0F0F0F0F);    
    
    return t, y, t2, y2
    

def test_bit_byte_transposition_words():
    a, b, c, d = 255, 127, 16, 1
    def test_function(a, b, c, d):                                      
        return bit_transposition_words(*byte_transposition_words(a, b, c, d))
        
    output1 = test_function(a, b, c, d)
    output2 = optimized_bit_byte_transposition_words(a, b, c, d)
    def _state(words):        
        return '\n'.join(format(word, 'b').zfill(32) for word in words)    
    bits1 = _state(output1)
    bits2 = _state(output2)    
    assert bits1.count('1') == bits2.count('1')
  #  print bits1
  #  print
  #  print bits2
    assert output1 == output2, (output1, output2)    

def visualize_choice_rotate_mixrow():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(choice_rotate_mixRow, (0, 0, 0, 1))
        
        
if __name__ == "__main__":
    #test_bit_byte_transposition_words()
    visualize_choice_rotate_mixrow()
    