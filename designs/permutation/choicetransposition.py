from crypto.utilities import rotate_left, rotate_right

def choice(a, b, c):
    return c ^ (a & (b ^ c))

def choice_swap(a, b, c):
    t = b
    b = choice(a, b, c)
    c = choice(a, c, t)
    return b, c    
    
def choice_transposition(a, b, c, d, e, f, g, h,
                         ab_mask=int("00000001", 2),
                         ac_mask=int("00000011", 2),
                         ad_mask=int("00000111", 2),
                         ae_mask=int("00001111", 2),
                         af_mask=int("00011111", 2),
                         ag_mask=int("00111111", 2),
                         ah_mask=int("01111111", 2)):
    b = rotate_left(b, 1, bit_width=8);
    c = rotate_left(c, 2, bit_width=8);
    d = rotate_left(d, 3, bit_width=8);
    e = rotate_left(e, 4, bit_width=8);
    f = rotate_left(f, 5, bit_width=8);
    g = rotate_left(g, 6, bit_width=8);
    h = rotate_left(h, 7, bit_width=8);
    
    a, b = choice_swap(ab_mask, a, b)
    a, c = choice_swap(ac_mask, a, c)
    a, d = choice_swap(ad_mask, a, d)
    a, e = choice_swap(ae_mask, a, e)
    a, f = choice_swap(af_mask, a, f)
    a, g = choice_swap(ag_mask, a, g)
    a, h = choice_swap(ah_mask, a, h)   
    
    return a, b, c, d, e, f, g, h
    
def choice_transposition32(*words):
    mask = 1    
    a = words[0]
    output = [0 for count in range(len(words))]
    for index, word in enumerate(words[1:]):
        word = rotate_left(word, index + 1, bit_width=32)

        a, word = choice_swap(mask, a, word)
        mask <<= 1
        mask ^= 1
        output[1 + index] = rotate_right(word, index + 1, bit_width=32)
    output[0] = a
    return output
        
def visualize_choice_transposition():
    from crypto.analysis.visualization import test_8x8_function
    test_8x8_function(choice_transposition, (1, 1, 1, 1, 1, 1, 1, 1))
    
def visualize_choice_transposition32():
    from crypto.analysis.visualization import test_32x32_function
    test_32x32_function(choice_transposition32,  [int('1' * 32, 2)] + [0 for count in range(31)])
        
if __name__ == "__main__":
    #visualize_choice_transposition()  
    visualize_choice_transposition32()
    