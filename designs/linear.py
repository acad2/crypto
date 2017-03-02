from crypto.analysis.branch_number import branch_number
from crypto.utilities import rotate_left

PRINT_STRING = "Branch number for 2x {}-bit words: {} (optimum: {})"

def branch8(word):
    # 0 1 2 3  4 5 6 7    
    word ^= rotate_left(word, 3)
    word ^= rotate_left(word, 6)
    return word

def mix8(a, b):
    a ^= b
    b ^= rotate_left(a, 2)
    return a, b

def linear8(a, b):
    return (branch8(a), branch8(b))
    
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
    return (branch16(a), branch16(b))
    
def branch32(word):
    # 0 1 2 3  4 5 6 7  8 9 10 11  12 13 14 15  16 17 18 19  20 21 22 23  24 25 26 27  28 29 30 31    
    word ^= rotate_left(word, 3,  32)
    word ^= rotate_left(word, 6, 32)
    word ^= rotate_left(word, 13, 32)
    word ^= rotate_left(word, 8, 32)
    return word
        
def mix32(a, b):
    a ^= b
    b ^= rotate_left(a, 2, 32)
    return a, b
    
def linear32(a, b):
    return (branch32(a), branch32(b))
    
def branch64(word):
#0 1 2 3|4 5 6 7|8 9 10 11|12 13 14 15|16 17 18 19|20 21 22 23|24 25 26 27|28 29 30 31|32 33 34 35|36 37 38 39|40 41 42 43|44 45 46 47|48 49 50 51|52 53 54 55|56 57 58 59|60 61 62 63
    # 03 69 1215  1821 2427
    # 0369 691215 18212427
    # 036918212427
    word ^= rotate_left(word, 3, 64)
    word ^= rotate_left(word, 6, 64)
    word ^= rotate_left(word, 17, 64)
    word ^= rotate_left(word, 5, 64) # 46 and 23, 46 and 41
    word ^= rotate_left(word, 27, 64) 
    #word ^= rotate_left(word, 3, 64)
    #word ^= rotate_left(word, 6, 64)    
    #word ^= rotate_left(word, 9, 64)
    #word ^= rotate_left(word, 16, 64)
    #word ^= rotate_left(word, 29, 64)
    return word
    
def mix64(word0, word1):
    word0 ^= word1  
    word1 ^= rotate_left(word0, 2, 64)  
    return word0, word1
    
def linear64(a, b):
    return (branch64(a), branch64(b))
                
def test_branch8():
    print PRINT_STRING.format(8, branch_number(linear8), 5)            
    
def test_branch16():
    print PRINT_STRING.format(16, branch_number(linear16), 9)            
        
def test_branch32():
    print PRINT_STRING.format(32, branch_number(linear32), 17)
    #for tester in range(1, 32):
    #    globals()["TESTER"] = tester
    #    result = branch_number(linear32)        
    #    print tester, PRINT_STRING.format(32, result, 17)
    #    if result == 17:
    #        raw_input()    
            
def test_branch64():   
    print PRINT_STRING.format(64, branch_number(linear64), 33)
    #for A in range(1, 32):
    #    print "A: ", A
    #    for B in range(1, 32):
    #        globals()["A"] = A
    #        globals()["B"] = B
    #        result = branch_number(linear64)        
    #        print A, B, PRINT_STRING.format(64, result, 33)
    #        if result == 33:
    #            raw_input()
        
if __name__ == "__main__":    
    test_branch8()
    test_branch16()
    test_branch32()
    test_branch64()    
    