#A := g ^ a mod p
#B := g ^ b mod p
#O == B ^ a mod p == A ^ b mod p
#
#g ^ a mod p == (g * (g ^ (a-1)) mod p;
#y := g ^ (a - 1);
#
#g ^ b mod p == g * (g ^ (b - 1)) mod p;
#z := g ^ (b - 1)
#
#_A := g * y
#_B := g * z
#_O := (g * z) * y mod p == (g * y) * z mod p
#
#g * y == (p * qa) + ea 
#g * z == (p * qb) + eb 
#(p * qa) + ea mod p == ea
#(p * qb) + eb mod p == eb
#
#__A := ea
#__B := eb
#__O := eb ^ a mod p == ea ^ b mod p
#    == eb * (eb ^ (a - 1)) == ea * (ea ^ (b - 1))
#    == eb * m == ea * n

    
    
    
# pick a random q, e such that (p * q) + e mod g == 0, with e smaller then p by an appropriate margin
# set private_key := (pq + e) / g == k
# set public_key := (pq + e) mod p == e
# set shared_secret := other_public_key * private_key
from secretkey import random_integer

def random_key(p, q_size, e_size):
    q = random_integer(q_size)
    e = random_integer(e_size)
    return (p * q) + e
    
def generate_keypair(g, p, q_size, e_size):
    key = random_key(p, q_size, e_size)
    while key % g:
        key = random_key(p, q_size, e_size)
    private_key = key / g
    public_key = key % p
    return public_key, private_key
        
def derive_shared_secret(p, others_public_key, private_key):
    return (others_public_key * private_key) % p
            
def test_derive_shared_secret():
    g, p = 3, 257
    pub1, priv1 = generate_keypair(g, p, 1, 1)
    pub2, priv2 = generate_keypair(g, p, 1, 1)
    _secret1 = derive_shared_secret(p, pub2, priv1)
    _secret2 = derive_shared_secret(p, pub1, priv2)
    assert _secret1 == _secret2, (_secret1, _secret2)
    print "Wow!", _secret1
    
if __name__ == "__main__":
    test_derive_shared_secret()
    
    
    
                
                