from crypto.utilities import words_to_bytes, bytes_to_words

ROUNDS = 1

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
        
    def __sub__(self, other_words):
        words = self.words
        modulus = self.mask + 1
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] - word) % modulus
        return self
        
    def __xor__(self, other_words):
        words = self.words
        for index, word in enumerate(other_words.words):
            words[index] = words[index] ^ word
        return self
    
    def __mul__(self, other_words):
        mask = self.mask
        words = self.words
        for index, word in enumerate(other_words.words):
            words[index] = (words[index] * word) % mask
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
            
    def shift_right(self, amount):
        mask = self.mask
        words = self.words
        for index, word in enumerate(words):
            words[index] = (word >> amount) & mask        
        
    def little_swap(self):
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (7, 12, 14, 9, 2, 1, 5, 15, 11, 6, 13, 0, 4, 8, 10, 3)]        
        self.words[:] = bytes_to_words(shuffled_bytes, 4)
        
    def invert_little_swap(self):
        word_size = self.word_size
        words = self.words        
        in_bytes = words_to_bytes(words, 4)        
        shuffled_bytes = [in_bytes[index] for index in (11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7)]
        self.words[:] = bytes_to_words(shuffled_bytes, 4)        
        
        
def encrypt(d0, d1, d2, d3, k0, k1, k2, k3, rounds=32):
    a = Register((d0, d1, d2, d3))
    k = Register((k0, k1, k2, k3))
    round_constants = Register((1, 1, 1, 1))    
    for index in range(1, rounds + 1):    
        a += round_constants
        a.little_swap()
        a += k
        a *= a
        #k += a
        round_constants.shift_left(1)        
        for word in a.words:
            print format(word, 'b').zfill(32)
        raw_input("Viewing: {}...".format(index))
    return a.words + k.words#[k0, k1, k2, k3]
        
def decrypt(d0, d1, d2, d3, k0, k1, k2, k3, rounds=32):
    a = Register((d0, d1, d2, d3))
    k = Register((k0, k1, k2, k3))
    round_constants = Register((2 ** 31, 2 ** 31, 2 ** 31, 2 ** 31))    
    for index in range(1, rounds + 1):   
        a -= k
        a.invert_little_swap()
        a -= round_constants
        round_constants.shift_right(1)
    return a.words + k.words#[k0, k1, k2, k3]
    
     
def visualize_encrypt():
    from crypto.analysis.visualization import test_4x32_cipher
    from crypto.utilities import random_integer
    data = [0, 0, 0, 3]
    key = [0, 0, 0, 1]
    test_4x32_cipher(encrypt, data + key)
    
    #data1 = [0, 0, 0, 3]
    #data2 = [0, 0, 0, 1]
    #key = [random_integer(4) for count in range(4)]
    #ciphertext1 = encrypt(*data1 + key)[:4]
    #ciphertext2 = encrypt(*data2 + key)[:4]
    #_data1 = decrypt(*ciphertext1 + key)[:4]
    #_data2 = decrypt(*ciphertext2 + key)[:4]
    #assert _data1 == data1
    #assert _data2 == data2
    #data3 = [data1[index] + data2[index] for index in range(4)]
    #ciphertext3 = [ciphertext1[index] + ciphertext2[index] for index in range(4)]
    #_data3 = decrypt(*ciphertext3 + key)[:4]
    #assert _data3 != data3
    #print (Register(ciphertext1) - Register(ciphertext2)).words
    
if __name__ == "__main__": 
    visualize_encrypt()
        
    