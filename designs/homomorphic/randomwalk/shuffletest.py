
from crypto.utilities import shuffle, random_integer, random_bytes

SIZE = 32
ARRAY = range(SIZE)
SHUFFLE_KEY = bytearray(random_bytes(SIZE))

def generate_private_key(size=32):
    return random_integer(size)
    
def generate_public_key(shuffle_count, _array=ARRAY, _key=SHUFFLE_KEY):
    state = _array[:]
    for count in range(shuffle_count):
        shuffle(state, _key)
    return state
    
def generate_keypair(size=32):
    shuffle_count = generate_private_key(size)
    public_key = generate_public_key(shuffle_count)
    return public_key, shuffle_count
    
def key_agreement(public_key, private_key, _key=SHUFFLE_KEY):
    state = public_key[:]
    for count in range(private_key):
        shuffle(state, _key)
    return state
    
def test_key_agreement():
    public1, private1 = generate_keypair(1)
    public2, private2 = generate_keypair(1)
    
    s = key_agreement(public1, private2)
    s2 = key_agreement(public2, private1)
    assert s == s2
    print s
    print "shuffletest unit test pass"
    
if __name__ == "__main__":
    test_key_agreement()
    