#s(a + e) + f
#r(a + t) + n
#sr(a + e) + rf     32 32 32   32 32 31   32 32
#sr(a + t) + sn
#                   2  2  2    2  2  1    2  2          6   5  4
#                   4  4  4    4  4  2    4  4         12  10  8

#                   3  3  3    3  3  1    3  3          9   7  6
#                   6  6  6    6  6  2    6  6         18  14 12
from crypto.utilities import random_integer

SIZE_DIFFERENCE = 8
SECURITY_LEVEL = 32
PADDING_AMOUNT = 2

def generate_parameters(security_level, size_difference, padding):         
    scaler = security_level / size_difference
    e_size = (security_level - size_difference) * scaler    
    a_size = s_size = r_size = security_level * scaler
    
    shift_amount = ((a_size * 3) - (security_level - padding)) * 8  
    return e_size, s_size, a_size, shift_amount, r_size
    
E_SIZE, S_SIZE, A_SIZE, SHIFT, ERROR_SIZE = generate_parameters(SECURITY_LEVEL, SIZE_DIFFERENCE, PADDING_AMOUNT)
A = random_integer(A_SIZE)

def generate_private_key(security_level=SECURITY_LEVEL, s_size=S_SIZE):    
    s = random_integer(s_size)    
    return s
    
def generate_public_key(private_key, e_size=E_SIZE, error_size=ERROR_SIZE, a=A):
    s = private_key        
    e = random_integer(e_size)
    r = random_integer(error_size)
    return (s * (a + e)) + r
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, s_size=S_SIZE, e_size=E_SIZE, error_size=ERROR_SIZE):
    private_key = generate_private_key(security_level, s_size)
    public_key = generate_public_key(private_key, e_size, error_size, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=SHIFT): 
    return (public_key * private_key) >> shift
    
def unit_test():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    share = key_agreement(public1, private2)
    test = (public1 * public2)
    def f(integer):
        return int(''.join(char for char in reversed(format(integer, 'b'))), 2) & ((1 << 256) - 1)
    assert f(share) != f(test), "Broken"        
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement b", generate_keypair, key_agreement, iterations=100000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    