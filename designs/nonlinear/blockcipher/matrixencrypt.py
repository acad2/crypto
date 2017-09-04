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
        
        
def encrypt(a, b, c, k0, k1, k2, rounds=1):
    for round in range(rounds):
        a += (b * k0) + (c * k1)
      #  a.little_swap()
        b += (a * k1) + (c * k2)
      #  b.little_swap()
        c += (a * k2) + (b * k0)
        c.little_swap()
    a += (b * k0) + (c * k1)
    b += (a * k1) + (c * k2)
    c += (a * k2) + (b * k0)        
    return a, b, c
        
def visualize_encrypt():
    from crypto.analysis.visualization import test_12x32_cipher
    size, mask = 32, 0xFFFFFF
    #data = [Register((1, 0, 0, 0), size, mask),
    #        Register((0, 1, 0, 0), size, mask),
    #        Register((0, 0, 1, 0), size, mask)]
    data = [1] + ([0] * 11)
    key = [Register((1, 1, 1, 1), size, mask),
           Register((1, 1, 1, 1), size, mask),
           Register((1, 1, 1, 1), size, mask)]
    def test_encrypt(a0, a1, a2, a3,
                     b0, b1, b2, b3,
                     c0, c1, c2, c3,
                     k0, k1, k2, size=size, mask=mask):
        a = Register((a0, a1, a2, a3), size, mask)
        b = Register((b0, b1, b2, b3), size, mask)
        c = Register((c0, c1, c2, c3), size, mask)
        print "Encrypting: ", 
        print a.words
        print b.words
        print c.words
        a, b, c = encrypt(a, b, c, k0, k1, k2)
        print "Encrypted: "
        print a.words
        print b.words
        print c.words
        return a.words + b.words + c.words + [k0, k1, k2]
    test_12x32_cipher(test_encrypt, data + key)
    
if __name__ == "__main__":
    visualize_encrypt()
    