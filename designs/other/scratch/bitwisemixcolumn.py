from crypto.utilities import slide, integer_to_bytes
from crypto.designs.nonlinear.ciphercomponents import choice, rotate_left
from crypto.analysis.visualization import test_4x64_function

def rotl16(word, amount):
    return rotate_left(word, amount, bit_width=16)
    
def round_function(a, b, c, d):
    # operate in parallel on 16x16 grid of bits
    register0, register1, register2, register3 = load_to_16bit_registers(a, b, c, d)     
    # rotate each row left by row#
    register0, register1, register2, register3 = shift_rows(register0, register1, register2, register3) 
    # vertically mix each 4 bit high column of each quarter, doing each quarter in parallel
    #register0, register1, register2, register3 = mix_quarters(register0, register1, register2, register3) 
    return register0, register1, register2, register3
   
def mix_quarters(register0, register1, register2, register3):   
    register0 ^= choice(register1, register2, register3)
    register1 ^= choice(register2, register3, register0)
    register2 ^= choice(register3, register0, register1)
    register3 ^= choice(register0, register1, register2)   
    return register0, register1, register2, register3
    
def load_to_16bit_registers(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):   
    register0 = ((a & word_0) << 0 ) | ((b & word_0) >> 16) | ((c & word_0) >> 32) | ((d & word_0) >> 48)    
    register1 = ((a & word_1) << 16) | ((b & word_1) << 0 ) | ((c & word_1) >> 16) | ((d & word_1) >> 32)
    register2 = ((a & word_2) << 32) | ((b & word_2) << 16) | ((c & word_2) << 0 ) | ((d & word_2) >> 16)    
    register3 = ((a & word_3) << 48) | ((b & word_3) << 32) | ((c & word_3) << 16) | ((d & word_3) >> 0 )    
    return register0, register1, register2, register3
    
def shift_rows(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):
    register0 = (rotl16((a & word_0) >> 48, 0 ) << 48) | (rotl16((a & word_1) >> 32, 1 ) << 32) | (rotl16((a & word_2) >> 16, 2 ) << 16) | rotl16(a & word_3, 3 )
    register1 = (rotl16((b & word_0) >> 48, 4 ) << 48) | (rotl16((b & word_1) >> 32, 5 ) << 32) | (rotl16((b & word_2) >> 16, 6 ) << 16) | rotl16(b & word_3, 7 )
    register2 = (rotl16((c & word_0) >> 48, 8 ) << 48) | (rotl16((c & word_1) >> 32, 9 ) << 32) | (rotl16((c & word_2) >> 16, 10) << 16) | rotl16(c & word_3, 11)
    register3 = (rotl16((d & word_0) >> 48, 12) << 48) | (rotl16((d & word_1) >> 32, 13) << 32) | (rotl16((d & word_2) >> 16, 14) << 16) | rotl16(d & word_3, 15)
    return register0, register1, register2, register3
    
def mix_rows(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):    
    #register0 = (rotl16((a & word_0) >> 48, 0 ) << 48) | (rotl16((a & word_1) >> 32, 1 ) << 32) | (rotl16((a & word_2) >> 16, 2 ) << 16) | rotl16(a & word_3, 3 )
    #register1 = (rotl16((b & word_0) >> 48, 4 ) << 48) | (rotl16((b & word_1) >> 32, 5 ) << 32) | (rotl16((b & word_2) >> 16, 6 ) << 16) | rotl16(b & word_3, 7 )
    #register2 = (rotl16((c & word_0) >> 48, 8 ) << 48) | (rotl16((c & word_1) >> 32, 9 ) << 32) | (rotl16((c & word_2) >> 16, 10) << 16) | rotl16(c & word_3, 11)
    #register3 = (rotl16((d & word_0) >> 48, 12) << 48) | (rotl16((d & word_1) >> 32, 13) << 32) | (rotl16((d & word_2) >> 16, 14) << 16) | rotl16(d & word_3, 15)
    register0, register1, register2, register3 = shift_rows(a, b, c, d)
    register0, register1, register2, register3 = mix_quarters(register0, register1, register2, register3)
    
    return register0, register1, register2, register3
    
def mix_columns16(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):    
    #register0 = (rotl16((a & word_0) >> 48, 0 ) << 48) | (rotl16((a & word_1) >> 32, 1 ) << 32) | (rotl16((a & word_2) >> 16, 2 ) << 16) | rotl16(a & word_3, 3 )
    #register1 = (rotl16((b & word_0) >> 48, 4 ) << 48) | (rotl16((b & word_1) >> 32, 5 ) << 32) | (rotl16((b & word_2) >> 16, 6 ) << 16) | rotl16(b & word_3, 7 )
    #register2 = (rotl16((c & word_0) >> 48, 8 ) << 48) | (rotl16((c & word_1) >> 32, 9 ) << 32) | (rotl16((c & word_2) >> 16, 10) << 16) | rotl16(c & word_3, 11)
    #register3 = (rotl16((d & word_0) >> 48, 12) << 48) | (rotl16((d & word_1) >> 32, 13) << 32) | (rotl16((d & word_2) >> 16, 14) << 16) | rotl16(d & word_3, 15)
    
    register0 = (a & word_0) | (a & word_1) | (a & word_2) | (a & word_3)
    register1 = (b & word_0) | (b & word_1) | (b & word_2) | (b & word_3)
    register2 = (c & word_0) | (c & word_1) | (c & word_2) | (c & word_3)
    register3 = (d & word_0) | (d & word_1) | (d & word_2) | (d & word_3)
    
    #register0 ^= rotate_left(choice(register1, register2, register3), 11, bit_width=64)
    #register1 ^= rotate_left(choice(register2, register3, register0), 23, bit_width=64)
    #register2 ^= rotate_left(choice(register3, register0, register1), 29, bit_width=64)
    #register3 ^= rotate_left(choice(register0, register1, register2), 37, bit_width=64)
      
      
    register0 ^= choice(register1, register2, register3)
    register1 ^= choice(register2, register3, register0)
    register2 ^= choice(register3, register0, register1)
    register3 ^= choice(register0, register1, register2)
    
    return register0, register1, register2, register3

    
def print_state_4x64(inputs_4x64):    
    for word in inputs_4x64:
        print '\n'.join(slide(format(word, 'b').zfill(64), 16))
        
def print_state_16x16(inputs_16x16):    
    for word in inputs_16x16:
        print format(word, 'b').zfill(16)
        
def test_mix_quarters():    
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0] 
   # inputs[0] = 1 | (1 << 16) | (1 << 32) | (1 << 48)
   # inputs[1] = 1 | (1 << 16) | (1 << 32) | (1 << 48)
   # inputs[2] = 1 | (1 << 16) | (1 << 32) | (1 << 48)
   # inputs[3] = 1 | (1 << 16) | (1 << 32) | (1 << 48)    
    print "test mix_quarters: "
    print_state_4x64(inputs)    
    while not raw_input("any key+enter to finish, enter to continue: "):        
        inputs = mix_quarters(*inputs)
        print "\n"
        print_state_4x64(inputs)
        
def test_mix_rows():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48) for count in range(4)]    
    print("Testing mix_rows: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = mix_rows(*inputs)
        print("\n")
        print_state_4x64(inputs)
        
def test_mix_quarters_mix_rows():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    print("Testing mix_rows(mix_quarters()): ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = mix_quarters(*mix_rows(*inputs))
        print("\n")
        print_state_4x64(inputs)
        
def test_mix_columns16():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    print("Testing mix_columns16: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = mix_columns16(*inputs)
        print("\n")
        print_state_4x64(inputs)
                
def shuffle(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):
    temp = a
    tempb = b
    tempc = c
    a = ((d & word_0) >> 0 )   | ((b & word_3) << 32) | ((b & word_2) >> 0 )    | ((c & word_0) >> 48)
    b = ((temp & word_3) << 48)| ((c & word_2) << 16) | ((b & word_1) >> 16)    | ((d & word_3) >> 0 )    
    c = ((c & word_3) << 48)   | ((d & word_1) << 0 ) | ((temp & word_0) >> 32) | ((d & word_2) >> 16)
    d = ((tempb & word_0) << 0)| ((temp & word_1) <<0)| ((tempc & word_1) >> 16)| ((temp & word_2) >> 16)
    return a, b, c, d

def shift_rows(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):
    register0 = (rotl16((a & word_0) >> 48, 0 ) << 48) | (rotl16((a & word_1) >> 32, 1 ) << 32) | (rotl16((a & word_2) >> 16, 2 ) << 16) | rotl16(a & word_3, 3 )
    register1 = (rotl16((b & word_0) >> 48, 4 ) << 48) | (rotl16((b & word_1) >> 32, 5 ) << 32) | (rotl16((b & word_2) >> 16, 6 ) << 16) | rotl16(b & word_3, 7 )
    register2 = (rotl16((c & word_0) >> 48, 8 ) << 48) | (rotl16((c & word_1) >> 32, 9 ) << 32) | (rotl16((c & word_2) >> 16, 10) << 16) | rotl16(c & word_3, 11)
    register3 = (rotl16((d & word_0) >> 48, 12) << 48) | (rotl16((d & word_1) >> 32, 13) << 32) | (rotl16((d & word_2) >> 16, 14) << 16) | rotl16(d & word_3, 15)
    return register0, register1, register2, register3

def shuffle_and_shift(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):   
    temp = a
    tempb = b
    tempc = c
    register0 = (rotl16((d & word_0)    >> 48, 0 ) << 48) | (rotl16((b & word_3)    << 0 , 1 ) << 32) | (rotl16((b & word_2)    >> 16, 2 ) << 16) | rotl16((c & word_0) >> 48, 3 )
    register1 = (rotl16((temp & word_3) >> 0 , 4 ) << 48) | (rotl16((c & word_2)    >> 16, 5 ) << 32) | (rotl16((b & word_1)    >> 32, 6 ) << 16) | rotl16((d & word_3) >> 0 , 7 )
    register2 = (rotl16((c & word_3)    >> 0 , 8 ) << 48) | (rotl16((d & word_1)    >> 32, 9 ) << 32) | (rotl16((temp & word_0) >> 48, 10) << 16) | rotl16((d & word_2) >> 16, 11)
    register3 = (rotl16((tempb & word_0)>> 48, 12) << 48) | (rotl16((temp & word_1) >> 32, 13) << 32) | (rotl16((tempc & word_1)>> 32, 14) << 16) | rotl16((temp & word_2) >> 16, 15)
    return register0, register1, register2, register3
    
def test_shuffle_and_shift():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    inputs[0] = 1
    print("Testing shuffle and shift: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = shuffle_and_shift(*inputs)
        print("\n")
        print_state_4x64(inputs)          
                
def shuffle_mix(a, b, c, d):    
    a, b, c, d = mix_quarters(a, b, c, d)
    a, b, c, d = shuffle_and_shift(a, b, c, d)
    #a, b, c, d = mix_quarters(a, b, c, d)
    return a, b, c, d
    
    
def test_shuffle():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    outputs = [inputs[:]]
    count = 0
  #  assert sum(format(word, 'b').zfill(64).count('1') for word in inputs) == 4, [format(word, 'b').zfill(64).count('1') for word in inputs]
    while True:
      #  assert sum(format(word, 'b').zfill(64).count('1') for word in inputs) == 4, [format(word, 'b').zfill(64).count('1') for word in inputs]
        inputs = shuffle(*inputs)
        if inputs[:] in outputs:
            break
        else:    
            count += 1
            print
            print_state_4x64(inputs)
            outputs.append(inputs[:])
    print count
    
def test_shuffle_mix():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]      
    inputs[0] = 1
    test_4x64_function(shuffle_mix, inputs)
    
    #print("Testing shuffle mix: ")
    #print_state_4x64(inputs)
    #while not raw_input("any key+enter to finish, enter to continue: "):
    #    inputs = shuffle_mix(*inputs)
    #    print("\n")
    #    print_state_4x64(inputs)   
        
def test_round_function():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    inputs[0] = 1
    print("Testing round function: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = round_function(*inputs)
        print("\n")
        print_state_4x64(inputs)  
                
if __name__ == "__main__":
    #test_round_function()
    #test_mix_quarters()
    #test_mix_rows()
    #test_mix_quarters_mix_rows()
    #test_mix_columns16()
    #test_shuffle()
    test_shuffle_mix()    
    #test_shuffle_and_shift()
    