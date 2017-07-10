# ax + by mod P
# a(ax + by) + by
#aax + aby + by
#aax + by(a + 1)

#a(aax + by(a + 1)) + by
#aaax + aby(a + 1) + by
#


#a(aax + aby + by) + by
#aaax + aaby + aby + by
#aaax + aaby + by(a + 1)

#a(aaax + aaby + aby + by) + by
#aaaax + aaaby + aaby + aby + by
#aaaax + aaaby + by(aa) + by(a + 1)
#aaaax + aaaby + by(aa + a + 1)
#aaaax + by(aaa) + by(aa + a + 1)
#aaaax + by(aaa + aa + a + 1)
#aaaax + by(a(aa + a + 1) + 1)
#aaaax + by(a(a(1 + 1) + 1) + 1)

#al = pow(a, 4)
#ar = 


#ax + b mod P
#a(ax + b) + b
#aax + ab + b
#aax + b(a + 1)

#a(aax + b(a + 1)) + b
#a(aax + ab + b) + b
#aaax + aab + ab + b
#aaax + b(aa + a + 1)
#aaax + b(a(a + 1) + 1)

from crypto.utilities import random_integer, big_prime, modular_inverse, modular_subtraction

P = big_prime(33)

def walk(a, b, x, y):           
    return ((a * x) + b) % P
    
def sum_geometric_series(a, r, n):
    t = a * (1 - (r ** n))
    return t / (1 - r)
            
def follow_path2(a, b, x, y, point_count):
    _a = pow(a, point_count, P)        
    _b = sum_geometric_series(b, a, point_count)   
    return ((_a * x) + _b) % P
        
def follow_path(a, b, x, y, point_count):
    for count in range(point_count):
        x = walk(a, b, x, y)
    return x
        
def test_walk_follow_path():
    a, b, x = [random_integer(32) for count in range(3)]
    y = big_prime(33)
    
    for point_count in range(1, 16):
        x1 = walk(a, b, x, y)
        _x1 = follow_path(a, b, x, y, 1)
        __x1 = follow_path2(a, b, x, y, 1)
        assert _x1 == x1
        assert __x1 == x1
    
    
    
if __name__ == "__main__":
    test_walk_follow_path()
    