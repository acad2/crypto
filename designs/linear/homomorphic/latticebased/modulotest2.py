# x mod (p + e) == x - ((x / p) * e) mod p
# as + e mod p + q == as + e - r mod p   96 32      64     96 + 32       
#                     s + ai(e - r)         32   33 64            p = 96
#                    32  33 223  = 256
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PADDING = 2

def calculate_r_size(x_size, s_size, p_size, q_size):
    return ((x_size + s_size) - p_size) + q_size

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    ai_size = (security_level + 1)
    s_size = security_level - padding    
    p_size = security_level * 8
    e_size = r_size = p_size - (security_level + padding)
    q_size = (r_size - s_size) - (padding * 2)
    return ai_size, s_size, e_size - padding, p_size, q_size
    
INVERSE_SIZE, S_SIZE, E_SIZE, P_SIZE, Q_SIZE = generate_parameter_sizes(SECURITY_LEVEL, PADDING)

def generate_private_key(inverse_size=INVERSE_SIZE, p_size=P_SIZE):
    while True:
        inverse = random_integer(inverse_size)
        modulus = random_integer(p_size)
        try:
            modular_inverse(inverse, modulus)
        except ValueError:
            continue
        else:
            break            
    return inverse, modulus
    
def generate_public_key(private_key, q_size=Q_SIZE):
    ai, modulus = private_key
    q = random_integer(q_size)
    a = modular_inverse(ai, modulus)
    return a, modulus + q
    
def generate_keypair(inverse_size=INVERSE_SIZE, p_size=P_SIZE, q_size=Q_SIZE):
    private_key = generate_private_key(inverse_size, p_size)
    public_key = generate_public_key(private_key, q_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE):
    a, modulus = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return ((a * s) + e) % modulus, s
    
def recover_key(ciphertext, private_key):
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) % ai
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("cutemodulus", generate_keypair, encapsulate_key, recover_key, iterations=10000)

def parameter_search():    
    outputs = dict()    
    #for x in range(32, 128):
    extra = 128
    #x = 96 + extra
    s = 32
    for x in range(32, 128):
        x += extra
        for q in range(1, 64):    
            q += extra
            r = calculate_r_size(x, s, x, q)        
            if (x - max(q, r)) >= 32:
                coverage = float(q) / (x + s)
                try:
                    outputs[coverage].append((x, s, q, r))
                except KeyError:
                    outputs[coverage] = [(x, s, q, r)]
                    
    keys = outputs.keys()
    for key in list(reversed(sorted(keys)))[:16]:
        print key, outputs[key]

def test_lll_attack():
    from liblll import lll_reduction as lll
    public, private = generate_keypair()
    basis, modulus = public
    ciphertext, secret = encapsulate_key(public)
    #matrix = [[1, 0, modulus],
    #          [0, 1, basis],
    #          [0, 0, ciphertext]]    
    matrix = [[0, 0, 1],
              [0, 1, 0],
              [ciphertext, basis, modulus]]
    print "Starting lll"
    output = lll(matrix)
    print output
    print secret, [item for item in output if secret in item]
    
if __name__ == "__main__":
    unit_test()
    #test_lll_attack()
    