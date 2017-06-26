from crypto.utilities import random_integer

G = random_integer(32)

def generate_private_key(q_size=32, e_size=32):
    q = random_integer(q_size)
    e = random_integer(e_size)
    return q, e
    
def generate_public_key(private_key, g=G):
    q, e = private_key
    point1 = (g * q) + e
    return (point1 * q) + e
    
def generate_keypair(q_size=32, e_size=32, g=G):
    private_key = generate_private_key(q_size, e_size)
    public_key = generate_public_key(private_key, g)
    return public_key, private_key
       
def key_agreement(public_key, private_key):
    q, e = private_key    
    point1 = ((public_key * q) + e) #>> 640 
    return int(format(((point1 * q) + e), 'b')[:200], 2)
    
    # pq1 + e1 * pq2 + e2
    # pq1(pq2 + e2) + e1(pq2 + e2)
    #ppq1q1 + pq1e2 + pq2e1 + e1e2
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement", generate_keypair, key_agreement, iterations=10000)
    
    #for count in range(65536):
    #    public1, private1 = generate_keypair()
    #    public2, private2 = generate_keypair()
    #    
    #    key1 = key_agreement(public2, private1)
    #    key2 = key_agreement(public1, private2)
    #            
    #    assert key1 == key2, '\n\n'.join(('\n', format(key1, 'b'), format(key2, 'b')))
    #print "key agreement unit test passed"
    
if __name__ == "__main__":
    test_key_agreement()
    