from crypto.utilities import words_to_bytes, bytes_to_words

class Register(object):
    
    def __init__(self, words, word_size=32, mask=0xFFFFFFFF):
        self.words = list(words)
        self.word_size = word_size
        self.mask = mask
        
    def __add__(self, other_words):
        words = self.words[:]
        mask = self.mask
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] + word) & mask
        return self.__class__(words, self.word_size, mask)
        
    def __xor__(self, other_words):
        words = self.words[:]
        for index, word in enumerate(other_words.words):
            words[index] = words[index] ^ word
        return self.__class__(words, self.word_size, self.mask)
        
    def __mul__(self, other_words):
        words = self.words[:]
        mask = self.mask        
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] * word) & mask
        return self.__class__(words, self.word_size, mask)
        
    def __iadd__(self, other_words):
        words = self.words
        mask = self.mask
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] + word) & mask
        return self
        
    def __ixor__(self, other_words):
        words = self.words
        for index, word in enumerate(other_words.words):
            words[index] = words[index] ^ word
        return self
    
    def __imul__(self, other_words):
        mask = self.mask
        words = self.words
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] * word) & mask
        return self
     
    def __shl__(self, shift_amounts):
        mask = self.mask
        words = self.words
        for index, amount in enumerate(shift_amounts):
            words[index] = (words[index] << amount) & mask
        return self
        
    def __getitem__(self, index):
        return self.words[index]
        
    def __setitem__(self, index, value):
        self.words[index] = value
            
    def shift_rows(self, amount):
        self.words = self.words[amount:] + self.words[:amount]
        
    def shift_left(self, amount):
        mask = self.mask
        words = self.words
        for index, word in enumerate(words):
            words[index] = (word << amount) & mask
            
    def little_swap(self):
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (7, 12, 14, 9, 2, 1, 5, 15, 11, 6, 13, 0, 4, 8, 10, 3)]        
        self.words[:] = bytes_to_words(shuffled_bytes, 4)
        
    def rotate_left1(self):
        # 0  1  2  3
        # 4  5  6  7
        # 8  9 10 11
        #12 13 14 15
        
        # 1  2  3  0
        # 5  6  7  4
        # 9 10 11  8
        #13 14 15 12   
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (1, 2, 3, 0, 
                                                        5, 6, 7, 4,
                                                        9, 10, 11, 8,
                                                        13, 14, 15, 12)]
        self.words[:] = bytes_to_words(shuffled_bytes, 4)
        
    def rotate_left2(self):        
        # 2  3  0  1
        # 6  7  4  5
        #10 11  8  9
        #14 15 12  13
        
        # 2  7  8 13
        # 6 11 12  1
        #10 15  0  5
        #14  3  4  9    
        
        # 2 11 12  1
        # 6 15  0  5
        #10  3  4  9
        #14  7  8 13  
        
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (2, 3, 0, 1,
                                                        6, 7, 4, 5,
                                                        10, 11, 8, 9,
                                                        14, 15, 12, 13)]
        self.words[:] = bytes_to_words(shuffled_bytes, 4)    
        
    def rotate_left3(self):        
        # 3  0  1  2
        # 7  4  5  6
        #11  8  9 10
        #15 12 13 14
        
        # 3  4  9 14                                        
        # 7  8 13  2
        #11 12  1  6
        #15  0  5 10   

        # 3  8 13 10
        # 7 12  1 14
        #11  0  5  2
        #15  4  9  6
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (3, 0, 1, 2,
                                                        7, 4, 5, 6,
                                                        11, 8, 9, 10,
                                                        15, 12, 13, 14)]
        self.words[:] = bytes_to_words(shuffled_bytes, 4)   
                                           
    def rotate_down(self):
        # 0  1  2  3
        # 4  5  6  7
        # 8  9 10 11
        #12 13 14 15
        
        # 0  5 10 15
        # 4  9 14  3
        # 8 13  2  7
        #12  1  6 11
                
        # 0 13 10  7 # inverse
        # 4  1 14 11
        # 8  5  2 15
        #12  9  6  3
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (0, 5, 10, 15,
                                                        4, 9, 14,  3,
                                                        8, 13, 2, 7,
                                                        12, 1, 6, 11)]
        self.words[:] = bytes_to_words(shuffled_bytes, 4)
        
def mix(a, b, c, d):            
    t = b
    t *= c    
    a += d
    
    b.little_swap()   
    a ^= t        
    return a
          
def mix2(a, b):
#    a ^= b
    a += b
    return a
    
def mix_columns(a, b, c, d):
    #a = mix(a, b, c, d)
    #b = mix(b, c, d, a)
    #c = mix(c, d, a, b)
    #d = mix(d, a, b, c)
    #for count in range(1):
    #a ^= b #ab
    #c ^= d #cd
    #b ^= c #bcd
    #d ^= a ^ b #ac
    #a += c    
    #a = mix2(a, b)
    #b = mix2(b, a)
    #c = mix2(c, d)
    #d = mix2(d, a)
    
    a += b  # ab
    c ^= d  # cd
    b ^= c  # bcd
    d ^= a ^ b  # ac
    a.rotate_down()     
    
     
     
    #a ^= b #ab
    #c ^= d #cd
    #b ^= c #bcd
    #d ^= a ^ b #ac
    #a += c
    #a = mix2(a, b)    
    #c = mix2(c, d)    
    #b = mix2(b, c)    
    #d = mix2(d, a)    
    a += b
    c ^= d
    b ^= c
    d ^= a ^ b        
    b.rotate_left1()   
    c.rotate_left2()       
    d.rotate_left3()       
    #c += d
    #
    #for count in range(8):
    #    a += b
    #    b += c
    #    c ^= a
    #    d ^= b    
    #c.shift_left_and_down2()
    #
    #for count in range(8):
    #    a += b
    #    b += c
    #    c ^= a
    #    d ^= b    
    #d.shift_left_and_down3()
 #   for count in range(4):
 #       a += b
 #       c += d
 #       b ^= c
 #       d ^= a    
 #   b.little_swap()
    #d.little_swap()
    #a += d
    #t = b * c
    #   
    #a += t
    #t = (c * d)
    #
    #a.little_swap()
    #b += t
    #
    #b += a
    #t = (
    return a, b, c, d
              
def permutation(a, b, c, d, 
                e, f, g, h,
                i, j, k, l,
                m, n, o, p,
                word_size=32, mask=0xFFFFFFFF, rounds=16):
    a = Register((a, b, c, d), word_size, mask)
    b = Register((e, f, g, h), word_size, mask)
    c = Register((i, j, k, l), word_size, mask)
    d = Register((m, n, o, p), word_size, mask)    
    round_constant = Register(generate_initial_constants(), word_size, mask);
    #shuf_mask = Register((13,12, 15,14,  9,8, 11,10,  5,4, 7,6,  1,0, 3,2);\
    for round in range(1, rounds + 1): 
        a ^= round_constant
        round_constant += round_constant                      
        a, b, c, d = mix_columns(a, b, c, d)
        print '\n'.join(format(word, 'b').zfill(32) for word in a.words)
        print '\n'.join(format(word, 'b').zfill(32) for word in b.words)
        print '\n'.join(format(word, 'b').zfill(32) for word in c.words)
        print '\n'.join(format(word, 'b').zfill(32) for word in d.words)
        raw_input()
       # c.little_swap()
        #b.shift_rows(1)
        #c.shift_rows(2)
        #d.shift_rows(3)
    return a.words + b.words + c.words + d.words
    
def visualize_permutation():
    from crypto.analysis.visualization import test_16x32_function
    state = [2] + ([0] * 15) 
    test_16x32_function(permutation, state)
    
def generate_initial_constants():    
    constants = [2 ** 0, 2 ** 5, 2 ** 10, 2 ** 15]
    constants[0] ^= constants[0] << 1
    constants[1] ^= constants[1] << 2
    constants[2] ^= constants[2] << 3
    constants[3] ^= constants[3] << 4
    return constants
    
        
if __name__ == "__main__":
    #generate_initial_constants()
    visualize_permutation()
    