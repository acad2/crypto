from crypto.utilities import random_integer, modular_inverse, big_prime

# s1(ax + b) + s2(ay + c)
# s1ax + s1b + s2ay + s2c
# a(s1x + s2y) + s1b + s2c
# s1x + s2y + ai(s1b + s2c)         # 32 32  32 32     98 32 32    98 + 64
# s1x + s2y
#                                   # 32 16  32 49     82  48   = 130
#                                   # 16 8   16 25     41  24  =  65
P = big_prime(65)#15624554725589300108028359420813649421358687587335913932516791047818722590040554599807493933062956667312163710471909420935282181282705895744425684147635747355088535662464428923668351746572873233876824347271520785884923390213864707521193624103726993925639378366518319658181903836973013201204557500590779473711073416857030483827553309270379961411727642118205474395101535197662351883169453

def generate_private_key(ai_size=41, y_size=25):
    ai = random_integer(ai_size) 
    y = random_integer(y_size)
    return ai, y
    
def generate_public_key(private_key, b_size=8, c_size=8, x_size=8, p=P):
    ai, y = private_key
    a = modular_inverse(ai, p)
    x = random_integer(x_size)
    b = random_integer(b_size)    
    c = random_integer(c_size)            
    public_key = (((a * x) + b) % p, 
                  ((a * y) + c) % p)
    return public_key
    
def generate_keypair(ai_size=41, b_size=8, c_size=8, x_size=8, p=P):
    private_key = generate_private_key(ai_size)
    public_key = generate_public_key(private_key, b_size, c_size, x_size, p)
    return public_key, private_key
    
def exchange_key(public_key, s_size=16, p=P):
    s1 = random_integer(s_size)
    s2 = random_integer(s_size)    
    p1, p2 = public_key    
    ciphertext = ((p1 * s1) % p) + ((p2 * s2) % p)
    return ciphertext, s2
    
# ax + b
# s1ax + s1b    
# s1x + ais1b
# s1x    

# s1x + s2y
# s1 + xis2y      33 32 32 == 97
# s1x + s2y    32 32  32 65 
def recover_key(ciphertext, private_key, p=P):    
    ai, y = private_key
    s1x_s2y = ((ciphertext * ai) % p) % ai      
    return s1x_s2y / y
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpie2pointma", generate_keypair, exchange_key, recover_key, iterations=10000, key_size=16)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    