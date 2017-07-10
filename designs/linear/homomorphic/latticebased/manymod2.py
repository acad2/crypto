from crypto.utilities import random_integer, modular_inverse

P_SIZE = 33
K_SIZE = 32
N = 23710111381395362027096933080600602504939904360390639161814951392397815501675135948226408363608796539949074311419663041707873560427400194565090506675086697139010848065482354516909251171769380333439311423649309401275587774565957549195787574876532039146748277310832351402362191282400380432141342435451545730342459575211165685239466653907078714157870294531747627080686039884114863509687476046490836095450923255124765053512903

def generate_key(p_size=P_SIZE, k_size=K_SIZE, n=N):
    p_0 = random_integer(p_size)           
    p_1 = random_integer(p_size * 2)        
    p_2 = random_integer(p_size * 3)
    
    k = (n - random_integer(k_size))   
    k_i = modular_inverse(k, n)       
    return ([p_0, p_1, p_2], k, k_i)
    
def encrypt(m, key, r_size=32, n=N):
    p, k, k_i = key    
    ciphertext = ((p[0] * m) +                      # 520 bits
                  (p[1] * random_integer(r_size)) + # 528 + 256 = 784
                  (p[2] * random_integer(r_size)))  # 792 + 256 = 1048                  
    assert ciphertext < n
    ciphertext = (k * ciphertext) % n    
    return ciphertext
    
def decrypt(ciphertext, key, n=N):
    p, k, k_i = key
    ciphertext = (k_i * ciphertext) % n    
    ciphertext = (ciphertext % p[2]) % p[1]    
    return ciphertext / p[0]
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("manymod2", generate_key, encrypt, decrypt)            
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    