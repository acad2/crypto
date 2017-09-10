from crypto.utilities import rotate_left, random_integer

# 101001011
# abcdefghi
# if a: 
#   then swap b <--> c
# rotate_left(1)

SWAP_TABLE = [int(item, 2) for item in ("000", "001", "010", "011", "100", "110", "101", "111")]
    
def rotate_left3(word, amount):
    return ((word << amount) | (word >> (3 - amount))) & 7
    
def choice_generator(word, wordsize=32):
    a_bit = 1 << (wordsize - 1)
    b_bit = a_bit >> 1
    c_bit = a_bit >> 2  
    invert = int('1' * wordsize, 2)
    while True:        
        if word & a_bit:            
            a = word & a_bit
            b = word & b_bit
            c = word & c_bit        
            _word = word & ((a_bit | b_bit | c_bit) ^ invert)           
            word = a | c | b | _word
        word = rotate_left(word, 1, wordsize)
        yield word
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_matrix_generator(worda, wordb, wordc, swap_table=SWAP_TABLE):
    while True:
        t = wordb
        wordb = choice(worda, wordb, wordc)
        wordc = choice(worda, wordc, t)
        worda, wordb, wordc = [swap_table[word] for word in (worda, wordb, wordc)]
        wordb = rotate_left3(wordb, 1)
        wordc = rotate_left3(wordc, 2)
        worda, wordb, wordc = wordb, wordc, worda
        yield worda, wordb, wordc
    
def test_choice_generator():
    seed = random_integer(4)
    print format(seed, 'b').zfill(32)
    for output in choice_generator(seed):
        print format(output, 'b').zfill(32)
        
def test_choice_matrix_generator():
    worda, wordb, wordc = [random_integer(1) & 7 for count in range(3)]
    def print_words(*words):
        print '\n'.join(format(word, 'b').zfill(3) for word in (words))
    print_words(worda, wordb, wordc)
    for outputs in choice_matrix_generator(worda, wordb, wordc):
        print_words(*outputs)
        raw_input()
        
    
if __name__ == "__main__":
    #test_choice_generator()
    test_choice_matrix_generator()
    