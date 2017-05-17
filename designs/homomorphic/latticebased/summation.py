# generate a large prime number P
# create ciphertext/public key by:
#   - generate large random Q
#   - compute N = P * Q
#   - compute sum(range(N)) (preferably quicksum_range(N)) 
#   - add P to the sum
# to add message to ciphertext:
#   - ciphertext + m where m < P
# to decrypt:
#   ciphertext % p

# if Q is prime, then sum(range(PQ)) == p * q + e where e == 0
# Q must not be prime
# Q should be selected such that e != 0

# P is added to the sum again, because otherwise q == e except for the least significant bit

# (1 + 2 + 3 + 4 + ... + x + ... + xr1)      
# (1 + 2 + 3 + 4 + ... + x + ... + xr2)
from crypto.utilities import random_integer, big_prime

def quicksum(p):
    """ usage: quicksum(p) => int
    
        Sums range(p) significantly faster then sum(range(p)) and with significantly less memory. """
    q, e = divmod(p, 2)
    if not e:
        q -= 1   
        e = q + 1   
    else:
        e = 0    
    print "\nP: {}".format(p)
    print "Q: {}".format(q)
    print "E: {}".format(e)
    return (p * q) + e
    
def quicksum2(p):
    """ usage: quicksum(p) => int
    
        Sums range(p) significantly faster then sum(range(p)) and with significantly less memory. """
    q, e = divmod(p, 2)
    if not e:
        q -= 1   
        e = q + 1   
    else:
        raise ValueError("Invalid e") 
    #print "\nP: {}".format(p)
    #print "Q: {}".format(q)
    #print "E: {}".format(e + p)        
    return (p * q) + e
    
def generate_secret_key(size=33):
    return big_prime(size)
    
def encrypt(m, p, q_size=32):
    while True:
        q = random_integer(q_size)
        n = p * q
        try:
            ciphertext = quicksum2(n)
        except ValueError:
            pass
        else:
            break    
    assert m < p
    ciphertext += m + p
    return ciphertext
    
def decrypt(c, p):
    return c % p
    
def test_encrypt_decrypt():
    key = generate_secret_key()
    for message in range(1024):
        message = random_integer(32)
    
        ciphertext = encrypt(message, key)
        plaintext = decrypt(ciphertext, key)
        assert plaintext == message, message
    print "summation encrypt/decrypt unit test complete"

if __name__ == "__main__":
    test_encrypt_decrypt()
    