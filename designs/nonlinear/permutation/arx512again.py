def _swap_bits(integer, word_size):
    return int(''.join(reversed(format(integer, 'b').zfill(word_size))), 2)
    
class Register(object):
    
    def __init__(self, words, word_size=32, mask=0xFFFFFFFF):
        self.words = list(words)
        self.word_size = word_size
        self.mask = mask
        
    def __add__(self, other_words):
        words = self.words
        mask = self.mask
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] + word) & mask
        return self
        
    def __xor__(self, other_words):
        words = self.words
        for index, word in enumerate(other_words.words):
            words[index] = words[index] ^ word
        return self
        
    def little_swap(self):
        word_size = self.word_size
        words = self.words
        for index, word in enumerate(words):
            _word = ((_swap_bits(word >> 24, 8) << 24) | 
                     (_swap_bits((word >> 16) & 255, 8) << 16) |
                     (_swap_bits((word >> 8) & 255, 8) << 8) |
                     (_swap_bits(word & 255, 8)))
            
            words[index] = _word
    
    def big_swap(self):
        word_size = self.word_size
        words = self.words
        for index, word in enumerate(self.words):
            words[index] = _swap_bits(word, word_size)
            
    def shift_rows(self, amount):
        self.words = self.words[amount:] + self.words[:amount]
        
    
def mix_columns(a, b, c, d):    
    a = a + b        #   ab
    c = c + d        #   cd
    b ^= c           #   bcd
    d ^= a ^ b       #   ac        
    return a, b, c, d
          
def shift_rows(a, b, c, d, word_size=32):
    pass
    
def permutation(a, b, c, d, 
                e, f, g, h,
                i, j, k, l,
                m, n, o, p,
                word_size=32, mask=0xFFFFFFFF, rounds=1):
    a = Register((a, b, c, d), word_size, mask)
    b = Register((e, f, g, h), word_size, mask)
    c = Register((i, j, k, l), word_size, mask)
    d = Register((m, n, o, p), word_size, mask)
    for round in range(rounds):
        round_constant = Register((round, round, round, round), word_size, mask)        
        a = a + round_constant
        a, b, c, d = mix_columns(a, b, c, d)
        a.little_swap()    
        a, b, c, d = mix_columns(a, b, c, d)    
        a.big_swap()        
        b.shift_rows(1)
        c.shift_rows(2)
        d.shift_rows(3)
    return a.words + b.words + c.words + d.words
    
def visualize_permutation():
    from crypto.analysis.visualization import test_16x32_function
    state = ([0] * 15) + [1]
    test_16x32_function(permutation, state)
    
if __name__ == "__main__":
    visualize_permutation()
    