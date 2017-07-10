from os import urandom

from crypto.utilities import rotate_left, slide, bytes_to_words

def test_random_active_sboxes(input_count, word_size):
    output = []
    _word_size = word_size / 8
    for count in range(input_count):
        a0, b0, c0, d0 = bytes_to_words(bytearray(urandom(4 * _word_size)), _word_size)
        a1, b1, c1, d1 = bytes_to_words(bytearray(urandom(4 * _word_size)), _word_size)
        active_sboxes = 0
        for index in range(word_size):
            mask = 1 << index
            word0 = (a0 & mask) | ((b0 & mask) << 1) | ((c0 & mask) << 2) | ((d0 & mask) << 3)
            word1 = (a1 & mask) | ((b1 & mask) << 1) | ((c1 & mask) << 2) | ((d1 & mask) << 3)
            if word0 != word1:
                active_sboxes += 1
        output.append(active_sboxes)
    print("Minimum #: {}".format(min(output)))
    print("Median  #: {}".format(output[len(output) / 2]))
    print("Average #: {}".format(sum(output) / float(len(output))))
   
def count_active_sboxes(function, input_count, word_size):   
    output = []
    #chunks = input_count / 65536    
    #for progress in range(chunks):
    #    for input in range(progress * 65536, (progress + 1) * 65536):
    for input in ([1 << amount for amount in range(32)] + [3 << amount for amount in range(32)] + [5 << amount for amount in range(32)] +
                  [7 << amount for amount in range(32)]):
        a0, b0, c0, d0 = function(input)
        a1, b1, c1, d1 = function((input + 1) % input_count)        
        active_sboxes = 0
        for index in range(word_size):
            mask = 1 << index
            word0 = (a0 & mask) | ((b0 & mask) << 1) | ((c0 & mask) << 2) | ((d0 & mask) << 3)
            word1 = (a1 & mask) | ((b1 & mask) << 1) | ((c1 & mask) << 2) | ((d1 & mask) << 3)
            if word0 != word1:
                active_sboxes += 1
        output.append(active_sboxes)
    print("Minimum #: {}".format(min(output)))
    print("Median  #: {}".format(sorted(output)[len(output) / 2]))
    print("Average #: {}".format(sum(output) / float(len(output))))   
   
def test_count_active_sboxes():
    def branch32(word):        
        word ^= rotate_left(word, 3,  32)
        word ^= rotate_left(word, 6, 32)
        word ^= rotate_left(word, 13, 32)
        word ^= rotate_left(word, 8, 32)
        return word
    
    def linear_layer(number):
        return bytes_to_words(bytearray(urandom(4 * 8)), 8)
        a, b, c, d = 0, 0, number, 0
        a ^= branch32(1)
        for round in range(2):
            a ^= b; c ^= d; b ^= c; d ^= a;        
            b = rotate_left(b, 1, 32)
            c = rotate_left(c, 2, 32)
            d = rotate_left(d, 3, 32)
            
            a ^= b; c ^= d; b ^= c; d ^= a;
            b = rotate_left(b, 4, 32)
            c = rotate_left(c, 8, 32)
            d = rotate_left(d, 12, 32)
    
            a ^= b; c ^= d; b ^= c; d ^= a;
            b = rotate_left(b, 8, 32)
            c = rotate_left(c, 12, 32)
            d = rotate_left(d, 16, 32)
        
        return a, b, c, d
    count_active_sboxes(linear_layer, 2 ** 8, 64)
    
if __name__ == "__main__":
    #test_random_active_sboxes(2 ** 16, 32)
    test_count_active_sboxes()