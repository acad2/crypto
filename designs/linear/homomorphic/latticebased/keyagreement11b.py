#s(a + e) + f
#r(a + t) + n
#sr(a + e) + rf     32 32 32   32 32 31   32 32
#sr(a + t) + sn
#                   2  2  2    2  2  1    2  2          6   5  4
#                   4  4  4    4  4  2    4  4         12  10  8

#                   3  3  3    3  3  1    3  3          9   7  6
#                   6  6  6    6  6  2    6  6         18  14 12
from crypto.utilities import random_integer

SIZE_DIFFERENCE = 1
SECURITY_LEVEL = 32

def generate_parameters(security_level, size_difference):         
    scaler = security_level / size_difference
    e_size = (security_level - size_difference) * scaler    
    a_size = s_size = r_size = security_level * scaler
    shift_amount = (((a_size + s_size + s_size + 4) - (security_level)) * 8)
    return e_size, s_size, a_size, shift_amount, r_size
    
E_SIZE, S_SIZE, A_SIZE, SHIFT, ERROR_SIZE = generate_parameters(SECURITY_LEVEL, SIZE_DIFFERENCE)
A = random_integer(A_SIZE)

def generate_private_key(security_level=SECURITY_LEVEL, s_size=S_SIZE, e_size=E_SIZE):    
 #   print A_SIZE, s_size, e_size, ERROR_SIZE, SHIFT
    s = random_integer(s_size)
    e = random_integer(e_size)
    return s, e
    
def generate_public_key(private_key, error_size=ERROR_SIZE, a=A):
    s, e = private_key        
    return (s * (a + e)) + random_integer(error_size)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, s_size=S_SIZE, e_size=E_SIZE, error_size=ERROR_SIZE):
    private_key = generate_private_key(security_level, s_size, e_size)
    public_key = generate_public_key(private_key, error_size, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=SHIFT):   
  #  from math import log
 #   print log(public_key * private_key[2], 2) - shift
    return (public_key * private_key[0]) >> shift
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement b", generate_keypair, key_agreement, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    