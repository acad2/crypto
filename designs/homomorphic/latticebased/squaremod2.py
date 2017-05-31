from crypto.utilities import random_integer, modular_inverse

P_SIZE = 33
K_SIZE = 32
N = 23710111381395362027096933080600602504939904360390639161814951392397815501675135948226408363608796539949074311419663041707873560427400194565090506675086697139010848065482354516909251171769380333439311423649309401275587774565957549195787574876532039146748277310832351402362191282400380432141342435451545730342459575211165685239466653907078714157870294531747627080686039884114863509687476046490836095450923255124765053512903

# m size = 32
# 
def generate_key(p_size=P_SIZE, k_size=K_SIZE, n=N):
    p = random_integer(p_size)
    k = (n - random_integer(k_size))   
    k_i = modular_inverse(k, n)       
    return ([p ** power for power in range(1, 4)], k, k_i)
    
from math import log    
def encrypt(m, key, r_size=32, n=N):
    p, k, k_i = key    
    ciphertext = ((p[0] * m) + 
                  (p[1] * random_integer(r_size)) + 
                  (p[2] * random_integer(r_size)))        
    assert ciphertext < n    
    ciphertext = (k * ciphertext) % n    
    return ciphertext
    
def decrypt(ciphertext, key, depth=1, n=N):
    p, k, k_i = key
    ciphertext = (pow(k_i, depth, n) * ciphertext) % n
    
    if depth > 1:        
        ciphertext /= p[0] 
        
    ciphertext %= p[2] 
    ciphertext %= p[1] 
    return ciphertext / p[0]
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("squaremod2", generate_key, encrypt, decrypt)
    
    k = random_integer(64)
    p = random_integer(11)    
    key = [[p, p ** 2, p ** 3], k, modular_inverse(k, N)]#generate_key()#[10, 100, 1000]
    m1 = 20#12389124981
    m2 = 3#1000129012    
    ciphertext1 = encrypt(m1, key)
    _m1 = decrypt(ciphertext1, key) 
    assert _m1 == m1 % key[0][0], (_m1, m1)
    
    ciphertext2 = encrypt(m2, key)
    test_function = lambda a, b: (a * b) #+ (a * b) + (b * b)
    ciphertext3 = test_function(ciphertext1, ciphertext2)
    plaintext = decrypt(ciphertext3, key, 2)
    assert plaintext == test_function(m1, m2) % key[0][0], (plaintext, m1, m2, test_function(m1, m2))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    