from crypto.analysis.branch_number import branch_number
from crypto.utilities import rotate_left

PRINT_STRING = "Branch number for 2x {}-bit words: {} (optimum: {})"

def branch8(word):
    # 0 1 2 3  4 5 6 7    
    word ^= rotate_left(word, 4)
    word ^= rotate_left(word, 7)
    return word

def mix8(a, b):
    a ^= b
    b ^= rotate_left(a, 2)
    return a, b

def linear8(a, b):
    return mix8(branch8(a), branch8(b))
    
def branch16(word):             
    # 0 1 2 3  4 5 6 7  8 9 10 11  12 13 14 15
    word ^= rotate_left(word, 3, 16)
    word ^= rotate_left(word, 6, 16)
    word ^= rotate_left(word, 5, 16)
    return word
    
def mix16(a, b):
    a ^= b
    b ^= rotate_left(a, 2, 16)
    return a, b
      
def linear16(a, b):
    return mix16(branch16(a), branch16(b))
    
def branch32(word):
    # 0 1 2 3  4 5 6 7  8 9 10 11  12 13 14 15  16 17 18 19  20 21 22 23  24 25 26 27  28 29 30 31    
    word ^= rotate_left(word, 3,  32)
    word ^= rotate_left(word, 6, 32)
    word ^= rotate_left(word, 13, 32)
    word ^= rotate_left(word, 8, 32)
    return word
        
def mix32(a, b):
    a ^= b
    b ^= rotate_left(a, 10, 32)
    return a, b
    
def linear32(a, b):
    return mix32(branch32(a), branch32(b))
    
def branch64(word):
#0 1 2 3|4 5 6 7|8 9 10 11|12 13 14 15|16 17 18 19|20 21 22 23|24 25 26 27|28 29 30 31|32 33 34 35|36 37 38 39|40 41 42 43|44 45 46 47|48 49 50 51|52 53 54 55|56 57 58 59|60 61 62 63
    word ^= rotate_left(word, 3, 64)
    word ^= rotate_left(word, 6, 64)
    word ^= rotate_left(word, 17, 64)
    word ^= rotate_left(word, 15, 64) # 5
    word ^= rotate_left(word, 24, 64) # 25 26 27
    return word
    
def mix64(word0, word1):
    word0 ^= word1  
    word1 ^= rotate_left(word0, 7, 64)  
    return word0, word1
    
def linear64(a, b):
    return mix64(branch64(a), branch64(b))
                
def test_branch8():
    print PRINT_STRING.format(8, branch_number(lambda x, y: (branch8(x), y)), 8)            
    #_globals = globals()
    #for a in range(1, 8):
    #    for b in range(1, 8):
    #        for c in range(1, 8):
    #            _globals["A"] = a
    #            _globals["B"] = b
    #            _globals["C"] = c
    #            result = branch_number(linear8)
    #            print a, b, c, PRINT_STRING.format(8, result, 8 + 1)
    #            if result == 9:
    #                raw_input()
    
def test_branch16():
    print PRINT_STRING.format(16, branch_number(linear16), 16 + 1)            
        
def test_branch32():
    print PRINT_STRING.format(32, branch_number(linear32), 32 + 1)
    #for tester in range(1, 32):
    #    globals()["TESTER"] = tester
    #    result = branch_number(linear32)        
    #    print tester, PRINT_STRING.format(32, result, 32)
    #    if result == 32:
    #        raw_input()    
            
def test_branch64():   
    print PRINT_STRING.format(64, branch_number(linear64), 64 + 1)    
    #for A in range(1, 32):
    #    
    #    globals()["TESTER"] = A
    #    
    #    result = branch_number(linear64)        
    #    print A, PRINT_STRING.format(64, result, 64)
    #    if result == 64:
    #        raw_input()
        
if __name__ == "__main__":    
    test_branch8()
    #test_branch16()
    #test_branch32()
    #test_branch64()    
    