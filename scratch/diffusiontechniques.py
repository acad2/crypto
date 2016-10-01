import inspect
   
S_BOX = bytearray(pow(251, x, 257) % 256 for x in range(256))

def p_box(data_bytes):        
    # convert data_bytes to data_bits first
    data_bits = ''.join(format(character, 'b').zfill(8) for character in data_bytes)         
    for index in range(8):
        data_bytes[index] = int(data_bits[index::8], 2)
            
def rotate_left(left, right, amount):     
    amount %= 8  
    return  ((left << amount) & 255) | ((right >> 8 - amount)), (right << amount) & 255 | ((left >> 8 - amount))
    
def rotate_right(left, right, amount):     
    amount %= 8  
    return  (left >> amount) | ((right << (8 - amount))) & 255, ((right >> amount) | ((left << (8 - amount)) & 255))    
    
def cipher_with_poor_diffusion(data_bytes, key_bytes):
    for index, data_byte in enumerate(data_bytes):
        data_bytes[index] = S_BOX[data_byte ^ key_bytes[index]]       
        
def cipher_with_better_diffusion_p_box(data_bytes, key_bytes):
    p_box(data_bytes)
    cipher_with_poor_diffusion(data_bytes, key_bytes)
    
def cipher_with_better_diffusion_rotation(data_bytes, key_bytes):    
    data_size = len(data_bytes)
    for index in range(data_size):
        left_byte_index = index
        right_byte_index = (index + 1) % data_size
        
        left_byte, right_byte = rotate_left(data_bytes[left_byte_index], data_bytes[right_byte_index], 3)
               
        data_bytes[left_byte_index] = S_BOX[left_byte ^ key_bytes[left_byte_index]]                
        data_bytes[right_byte_index] = S_BOX[right_byte ^ key_bytes[right_byte_index]]
        
def cipher_with_better_diffusion_state(data_bytes, key_bytes):
    state = 0
    for byte in data_bytes:
        state ^= byte
    for byte in key_bytes:
        state ^= byte
    for index in range(len(data_bytes)):
        state ^= byte
        data_bytes[index] ^= S_BOX[state ^ key_bytes[index]]
        state ^= byte    
    
def cipher_combined(data_bytes, key):
    p_box(data_bytes)
    state = 0
    for byte in data_bytes:
        state ^= byte
    for byte in key:
        state ^= byte
    
    data_size = len(data_bytes)    
    for index in range(data_size):
        right_index = (index + 1) % data_size
        
        state ^= data_bytes[index] ^ data_bytes[right_index]        
       
        data_bytes[index], data_bytes[right_index] = rotate_left(data_bytes[index], data_bytes[right_index], 3)
        
        data_bytes[index] ^= S_BOX[state ^ key[index]]
        state ^= data_bytes[index]
        
        data_bytes[right_index] ^= S_BOX[state ^ key[right_index]]
        state ^= data_bytes[right_index]            
    
def invert_cipher_combined(data_bytes, key):
    state = 0
    for byte in data_bytes:
        state ^= byte
    for byte in key:
        state ^= byte
        
    data_size = len(data_bytes)
    two_byte_word = bytearray(2)
    for index in reversed(range(data_size)):
        right_index = (index + 1) % data_size
        
        state ^= data_bytes[right_index]        
        data_bytes[right_index] ^= S_BOX[state ^ key[right_index]]
                
        state ^= data_bytes[index]        
        data_bytes[index] ^= S_BOX[state ^ key[index]]
     
        data_bytes[index], data_bytes[right_index] = rotate_right(data_bytes[index], data_bytes[right_index], 3)
        
        state ^= data_bytes[index] ^ data_bytes[right_index]        
    p_box(data_bytes)      
                
def demo_cipher_diffusion(cipher, rounds=1):    
    message = bytearray("Testing!")
    message2 = bytearray("Testing?")
    print "Plaintexts: ", message, message2
    key = bytearray(range(8))
    for round in range(rounds):
        cipher(message, key)
        cipher(message2, key)    
    
    print "Ciphertexts: "
    print message
    print message2   
    
def test_cipher(cipher):
    for round, round_word in enumerate(("one", "two", "three")):
        print "\nWith {} round(s): ".format(round_word)
        demo_cipher_diffusion(cipher, round + 1)
    
def test_cipher_with_poor_diffusion():
    test_cipher(cipher_with_poor_diffusion)
    
def test_cipher_with_better_diffusion_p_box():
    test_cipher(cipher_with_better_diffusion_p_box)
    
def test_cipher_with_better_diffusion_rotation():
    test_cipher(cipher_with_better_diffusion_rotation)
        
def test_cipher_with_better_diffusion_state():
    test_cipher(cipher_with_better_diffusion_state)
    
def test_cipher_combined():
    test_cipher(cipher_combined)
    
def print_intro():
    print """Techniques for obtaining diffusion
-----------------------------------------------
Diffusion is an important part of modern crypto primtives. Basically, we want
all bits of the input to influence equally all bits of the output.  
Consider the following basic substitution cipher:

{}
            
Suppose the message "Hello!" is enciphered using the above method. Then
consider what would happen if only the last character of the message was 
changed, so that the plaintext is now "Hello?". Only the last byte of the
ciphertexts will be different; all the rest of the bytes will have remained
the same. This cipher exhibits poor diffusion, as is demonstrated below: """.format(inspect.getsource(cipher_with_poor_diffusion))

def print_p_box():
    print """\nP-Box
-----------------------------------------------
There are a variety of ways to achieve diffusion. The first today is called a
P-Box. The goal of applying the P-Box is to spread input bits around to 
different bytes of output. Being a bit level shuffle can make it relatively 
expensive to implement in software, but relatively efficient in hardware. 

Here's an example P-Box, which simply applies the definition of diffusion: 
make it so that each input bit influences the output evenly. The P-Box works on
eight eight-bit bytes. It takes the first bit from each byte and outputs that
as byte 1, the second bit from each byte and outputs that as byte 2, and so
on through all 8 bytes.

{}
            
If p_box is applied before cipher_with_poor_diffusion, a stronger cipher is
created:

{}
    
This is visible by repeating our diffusion test from earlier; If you 
cipher two similar messages as before, more then one byte will have changed.
If the cipher is applied multiple times in succession (called applying rounds),
the difference becomes more pronounced, as is shown below: """.format(inspect.getsource(p_box), 
                                                                      inspect.getsource(cipher_with_better_diffusion_p_box))

def print_rotation():
    print """\nRotations
    Bit rotations
-----------------------------------------------
Bitwise shifts and rotations are a way to mix bits across byte boundaries. And
fortunately, bitwise rotations are cheap, running in constant time when 
rotating by fixed amounts on virtually all platforms. 
    
Consider the rotation of two bytes (called a "word") before applying an 8-bit
S-Box over each byte indivdually. The result is that each S-Box input/output 
consists of some bits of each the left/right byte. This means the ciphertext
will exhibit more diffusion, which we can examine: 

{}""".format(inspect.getsource(cipher_with_better_diffusion_rotation))

def print_state():
    print """\nSummation into a state
-----------------------------------------------
One way to incorporate all input bytes is to fold them all into a single
value, usually via bitwise xor. This has the disadvantage of needing to 
enumerate the entire data (and usually key too), but a change in the 
plaintext (or key) anywhere will often times change the output completely even
after a single round. For an example: 

{}""".format(inspect.getsource(cipher_with_better_diffusion_state))

def print_combined():
    print """\nCombining effects
-----------------------------------------------
Consider a cipher that applies the P-Box first, creates an 8-bit
state next via xor, then proceeds to apply the S-Box after performing the
rotations we learned about previously. Let's see how this works!:

{}""".format(inspect.getsource(cipher_combined))
                
if __name__ == "__main__":
    print_intro()    
    test_cipher_with_poor_diffusion()
    print_p_box()
    test_cipher_with_better_diffusion_p_box()
    print_rotation()
    test_cipher_with_better_diffusion_rotation()
    print_state()
    test_cipher_with_better_diffusion_state()
    print_combined()
    test_cipher_combined()        
