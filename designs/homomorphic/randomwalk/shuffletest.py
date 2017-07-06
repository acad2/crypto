#recipe for random walk crypto systems:
#   - a public function that offers a fast way to compute the value of the Nth iteration
#       - i.e. F(F(F(...F(starting_point))))
#       - function must offer a shortcut that allows to compute the above non-sequentially
#       - shortcut does not have to be secret, it just needs to be efficient
#   - private key: Number of times function is iterated
#   - public key: Output of iterating function private key number of times
#   - provides key agreement
#   - key agreement: Using the public key of the other party as the starting point, iterate the function private key number of times
#   
#   key generation:
#       private_key <- random integer
#       public_key <- F_n(...F_3(F_2(F_1(start)))) where n = private_key
#   key agreement:
#       shared key <- F_n(...F_3(F_2(F_1(start)))) where n = private_key
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
    