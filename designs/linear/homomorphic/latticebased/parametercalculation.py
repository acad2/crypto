#xy + z + ai(b)
# axy + az + b



# s + aie    1  1  4      1 + 4 = 5
# as + e     1  1  4

# 00000000 00000000 00000000 10011001
# 00000000 00000000 01010101 11010111 +
# ------------------------------------
#                   01001101 01111111
# 10101011 10101100 00011011 11110000 +
# ---------------------------------------

# 32 32 128   160

def calculate_parameters(security_level=31, e_modulus_ratio=.66):  
    assert 0 < e_modulus_ratio < 1, e_modulus_ratio
    s_size = security_level
    inverse_size = security_level + 1
    e_size = security_level
    modulus_size = float(inverse_size + e_size)
    coverage =  e_size / modulus_size
    while coverage < e_modulus_ratio:
        e_size += 1
        modulus_size += 1
        coverage = (e_size / modulus_size)
    return s_size, inverse_size, e_size, modulus_size, coverage
    
def display_parameter_calculation(security_level, e_modulus_ratio=.66):
    (s_size, inverse_size, e_size, 
     modulus_size, coverage) = calculate_parameters(security_level, e_modulus_ratio)    
    print("s size      : {}".format(s_size))
    print("inverse size: {}".format(inverse_size))
    print("e size      : {}".format(e_size))
    print("modulus size: {}".format(modulus_size))
    print("e/modulus   : {} coverage".format(coverage))
    
def test_calculate_parameters():
    display_parameter_calculation(31, .95)
    
if __name__ == "__main__":
    test_calculate_parameters()
