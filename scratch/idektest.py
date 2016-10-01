from differential import find_best_differential
from linear import calculate_linearity

def test_function():
    sbox = bytearray(256)
    for x in range(256):
        temp = x * x
        sbox[x] = (temp >> 8) ^ (temp & 255)        
        
    print "Best differential: ", find_best_differential(sbox)
    print "Linearity: ", calculate_linearity(sbox)
    
if __name__ == "__main__":
    test_function()
    