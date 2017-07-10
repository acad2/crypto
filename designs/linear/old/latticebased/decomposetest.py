from math import log, sqrt
from os import urandom

def _bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def random_integer(size_in_bytes):
    """ usage: random_integer(size_in_bytes) => random integer
    
        Returns a random integer of the size specified, in bytes. """
    return _bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
def _decompose_pq(pq):    
    size = (((int(log(pq, 2)) + 1) / 2) / 8) or 1        
    for test_count in range(1024):        
        p1 = random_integer(size)             
        if p1 in (0, 1) or p1 >= pq or pq % p1:        
            continue
        else:
            break    
    else:
        raise ValueError(pq)
    return p1
    
def decompose(integer):
    big_size = .75
    small_size = .25
    while True:
        p1q1 = int(integer * big_size)
        p2q2 = int(integer * small_size)
        difference = integer - (p1q1 + p2q2)    
        p1q1 += difference
        assert p1q1 + p2q2 == integer
        p1_size = log(sqrt(p1q1), 2)
        p2_size = log(sqrt(p2q2), 2)
        print log(integer, 2), p1_size, p2_size
        
        p1 = int(2 ** p1_size) + 1  
        #remainder = p1q1 % p1
        #p1 += remainder
        assert not p1q1 % p1, (p1, p1q1, p1q1 % p1, (p1q1 % (p1 + 1)), (p1q1 % (p1 - 2)))
        
        while p1q1 % p1:
            p1_size += .01
            #p2_size -= .01
            
            p1 = int(2 ** p1_size)
            
        p2 = int(2 ** p2_size)
        while p2q2 % p2:
            p2_size -= .01
            p2 = int(2 ** p2_size)
                
        if (integer % p1) % p2 != 0:
            big_size += .01
            small_size -= .01
        else:               
            return p1, p2
    
    
    #p1 = p2 = -1
    #while (integer % p1) % p2 != 0 or not p1 % p2:    
    #    p1 = _decompose_pq(p1q1)
    #    p2 = _decompose_pq(p2q2)     
    #    
    #q1 = p1q1 / p1
    #q2 = p2q2 / p2
    #assert (p1 * q1) + (p2 * q2) == integer, (p1, q1, p2, q2, integer)
    #assert (integer % p1) % p2 == 0, (integer % p1) % p2
    #return p1, p2
    
def test_decompose():
    integer = 1403
    p1, p2 = decompose(integer)
    
    print("P1: {}".format(p1))
    print("P2: {}".format(p2))
    print (integer % p1) % p2
    print ((integer + 1) % p1) % p2
    print ((integer + 2) % p1) % p2
    
if __name__ == "__main__":
    test_decompose()
    