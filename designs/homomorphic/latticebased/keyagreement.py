from os import urandom as random_bytes

__all__ = ["random_walk", "generate_private_key", "generate_public_key", "generate_keypair", "key_agreement",
           "X", "Y"]

# utilities    
def bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(random_bytes(size_in_bytes)))
# end utilities        
        
X = random_integer(32)
Y = random_integer(33)
POINT_COUNT = 2
A_SIZE = 32
B_SIZE = 32

def random_walk(x, y, directions, point_count):
    a, b = directions       
    for count in range(point_count):                
        x = ((a * x) + (b * y)) % y
    return x
    
def generate_private_key(a_size=A_SIZE, b_size=B_SIZE):
    a = random_integer(a_size)
    b = random_integer(b_size)
    return a, b
    
def generate_public_key(private_key, x=X, y=Y, point_count=POINT_COUNT):
    return random_walk(x, y, private_key, point_count)
        
def generate_keypair(a_size=A_SIZE, b_size=B_SIZE, x=X, y=Y, point_count=POINT_COUNT):
    private_key = generate_private_key(a_size, b_size)
    public_key = generate_public_key(private_key, x, y, point_count)
    return public_key, private_key
       
def key_agreement(public_key, private_key, y=Y, point_count=POINT_COUNT):
    return random_walk(public_key, y, private_key, point_count)

def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    