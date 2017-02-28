from crypto.utilities import rotate_right, rotate_left

def diffusion_transformation(word, other_word, wordsize=8, mask=(2 ** 8) - 1):
    #output = word
    #output ^= rotate_right(word, 0, wordsize)
    #output ^= rotate_right(word, 1, wordsize)
    #output ^= rotate_right(word, 2, wordsize)
    #output ^= rotate_right(word, 3, wordsize)
    #output ^= rotate_right(word, 4, wordsize)
    #output ^= rotate_right(word, 5, wordsize)
    #output ^= rotate_right(word, 6, wordsize)    
    #output ^= rotate_right(word, 7, wordsize)    
    #return output    
    output = word   
    flip = 0
    for bit in range(wordsize):        
        if other_word & (1 << bit):
            flip ^= mask
        output ^= rotate_right(rotate_right(word, bit, wordsize) & word, bit) ^ flip
    return output & mask
    
def mix_state(a, b, c, d):
    #a = diffusion_transformation(a, b)
    #a = diffusion_transformation(a, c)
    a = diffusion_transformation(a, d)
   # b = diffusion_transformation(b, a)
   # c = diffusion_transformation(c, b)
   # d = diffusion_transformation(d, c)    
    #c = diffusion_transformation(c, d)
    #b = diffusion_transformation(b, c)
    #d = diffusion_transformation(d, a)
    return a, rotate_left(b, 8, 32), rotate_left(c, 16, 32), rotate_left(d, 24, 32)
        
def test_diffusion_transformation():
    #k = 15
    #for m in range(8):
    #    print("Input:\n{}".format('\n'.join(format(word, 'b').zfill(8) for word in (m, k))))
    #    print("Output:\n{}".format(format(diffusion_transformation(m, k), 'b').zfill(8)))
    for a in range(256):
        for b in range(256):
            output = diffusion_transformation(a, b)
            assert output in (a ^ b, a, a ^ 0xFF, a ^ 0xFF ^ b), (a, b, format(diffusion_transformation(a, b), 'b').zfill(8), format(a ^ 0xFF ^ b, 'b').zfill(8))

def visualize_mix_state():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(mix_state, (0, 0, 0, 1))
     
if __name__ == "__main__":
    #test_diffusion_transformation()
    visualize_mix_state()        
        
        
        
    
        
    
    