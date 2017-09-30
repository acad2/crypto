#s(a + e) + r, with the errors covering the upper bits instead of the lower bits
from crypto.utilities import random_integer

SECURITY_LEVEL = 32

def generate_parameters(security_level):         
    e_size = security_level 
    a_size = s_size = r_size = security_level
    
    shift_amount = security_level * 8
    mask = (2 ** shift_amount) - 1
    return e_size, s_size, a_size, r_size, shift_amount, mask
    
E_SIZE, S_SIZE, A_SIZE, ERROR_SIZE, SHIFT_AMOUNT, MASK = generate_parameters(SECURITY_LEVEL)
A = random_integer(A_SIZE)

def generate_private_key(security_level=SECURITY_LEVEL, s_size=S_SIZE):    
    s = random_integer(s_size)    
    return s
    
def generate_public_key(private_key, e_size=E_SIZE, error_size=ERROR_SIZE, a=A, shift=SHIFT_AMOUNT):
    s = private_key        
    e = random_integer(e_size)
    r = random_integer(error_size)
    return (s * (a + (e << shift))) + (r << shift)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, s_size=S_SIZE, e_size=E_SIZE, error_size=ERROR_SIZE):
    private_key = generate_private_key(security_level, s_size)
    public_key = generate_public_key(private_key, e_size, error_size, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, mask=(2 ** 256) - 1): 
    return (public_key * private_key) & mask        
        
def unit_test():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    share = key_agreement(public1, private2)
    test = (public1 * public2)
    # s(a + e) + r == sh + r 
    # x(a + y) + z == xk + z
    # xk(sh + r) + z(sh + r) == xksh + xkr + zsh + zr
    #                           xs(a + y)(a + e) + xr(a + y) + sz(a + e) + zr
    #                           xsa + xsy(a + e) + xra + xry + sza + sze + zr
    #                           xsa + xsya + xsye + xra + xry + sza + sze + zr
    #                           
    #                           asx + asxy + exsy + qrx + xry + asz + esz + rz
    #                           sx(a + ay + ey) + qrx + xry + asz + esz + rz
    #                           sx(a + e) + xr
    #                           sx(a + y) + sz
    
    # xk(sh + r) + z(sh + r) == xksh + xkr + zsh + zr
    #                           ss(a + e)(a + y) + s(a + y)r + s(a + e)z + zr
    #                           ssa + sse(a + y) + sra + sry + sza + sze + zr
    #                           ssa + ssae + ssey + sra + sry + sza + sze + zr
    #                               
    assert ((public1 * public2) / A) & mask != share
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement e", generate_keypair, key_agreement, iterations=1000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    