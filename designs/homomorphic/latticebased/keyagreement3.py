from crypto.utilities import random_integer, big_prime

A_SIZE = 32
B_SIZE = 32
X_SIZE = 32
Y_SIZE = 33
PRIVATE_KEY_SIZE = 32

def generate_parameters(a_size=A_SIZE, b_size=B_SIZE,
                        x_size=X_SIZE, y_size=Y_SIZE):
    a = random_integer(a_size)
    b = random_integer(b_size)
    x = random_integer(x_size)
    y = big_prime(y_size) 
    return a, b, x, y, b * y
    
PARAMETERS = A, B, X, Y, BY = generate_parameters()
    
def point_addition(x, _a, adjustment, y=Y):    
    return ((_a * x) + adjustment) % y
    
def calculate_a_adjustment(point_count):
    return (2 * point_count) + ((point_count - 1) % 2)
                
def generate_private_key(a, b, y, private_key_size=PRIVATE_KEY_SIZE):    
    point_count = random_integer(private_key_size)
    _a = pow(a, point_count, y)     
    adjustment = calculate_a_adjustment(point_count)    
    return _a, (b * y * (a + adjustment)) 
        
def generate_public_key(private_key, parameters):   
    _a, adjustment = private_key    
    a, b, x, y, by = parameters
    public_key = point_addition(x, _a, adjustment, y)
    return public_key
    
def generate_keypair(private_key_size=PRIVATE_KEY_SIZE, parameters=PARAMETERS):
    a, b, x, y, by = parameters
    private_key = generate_private_key(a, b, y, private_key_size)
    public_key = generate_public_key(private_key, parameters)
    return public_key, private_key
    
def key_agreement(public_key, private_key, y=Y):   
    _a, adjustment = private_key
    return point_addition(public_key, _a, adjustment, y)
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement3", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    