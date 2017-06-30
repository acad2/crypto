# ax + by mod y
# 
# a(ax + by) + by mod y
# aax + aby + by mod y
# aax + by(a + 1) mod y
# 
# aax + by(a + 1) mod y
# a(aax + by(a + 1)) + by mod y
# aaax + aby(a + 1) + by
# aaax + by(a + 3)

from crypto.utilities import random_integer, big_prime, modular_inverse, modular_subtraction

def walk(a, b, x, y):
    return ((a * x) + (b * y)) % y
    
def follow_path2(a, b, x, y, point_count):
    _a = pow(a, point_count, y)
    adjustment = (2 * point_count) + ((point_count - 1) % 2)
    return ((_a * x) + (b * y * (a + adjustment))) % y
        
def follow_path(a, b, x, y, point_count):
    for count in range(point_count):
        x = walk(a, b, x, y)
    return x
        
def test_walk_follow_path():
    a, b, x = [random_integer(32) for count in range(3)]
    y = big_prime(33)
    
    x1 = walk(a, b, x, y)
    x2 = walk(a, b, x1, y)
    x3 = walk(a, b, x2, y)
    
    _x2 = follow_path(a, b, x, y, 2)
    assert _x2 == x2
    assert ((a * a * x) + (b * y * (a + 1))) % y == _x2
    __x2 = follow_path2(a, b, x, y, 2)
    assert __x2 == _x2
    
    _x3 = follow_path(a, b, _x2, y, 1)
    assert _x3 == x3
    assert ((a * a * a * x) + (b * y * (a + 3))) % y == _x3
    __x3 = follow_path2(a, b, _x2, y, 1)
    assert _x3 == _x3
        
    _x4 = follow_path(a, b, _x3, y, 1)    
    assert ((a * a * a * a * x) + (b * y * (a + 5))) % y == _x4
    __x4 = follow_path2(a, b, _x3, y, 1)
    assert __x4 == _x4
    
    
if __name__ == "__main__":
    test_walk_follow_path()
    