from crypto.utilities import random_integer

ERROR_SIZE = 32
SHIFT = ((ERROR_SIZE * 2) - 1) * 8
A = random_integer(ERROR_SIZE + 5)

def generate_point(n, a=A, error_size=ERROR_SIZE):
    return n * (a + random_integer(error_size))

def generate_modulus(k, a=A):
    return k * a
        
def value(point, shift=SHIFT, extra=0):
    return point >> (shift + extra)
    
def divide(n, k, shift=SHIFT, a=A, error_size=ERROR_SIZE):      
    n = value(n, shift) / value(k, shift)        
    return generate_point(n, a, error_size)

def test_divide():    
    k = random_integer(32)
    modulus = generate_point(k)    
    for x in range(1, 16):
        for y in range(1, 16):
            x, y = [random_integer(32) for count in range(2)]
            point_x = generate_point(x)
            point_y = generate_point(y)
                        
            point_xy = (y * point_x)# generate_point(x * y)
            point_xy2 = (x * point_y)
            extra = 270
            assert value(point_xy, extra=extra)
            assert value(point_xy, extra=extra) == value(point_xy2, extra=extra), (value(point_xy, extra=extra), value(point_xy2, extra=extra))
            point_xy3 = generate_point(x * y)
            assert value(point_xy, extra=extra) == value(point_xy3, extra=extra), (value(point_xy, extra=extra), value(point_xy3, extra=extra))
            
            point_xy_mod_k = divide(point_xy, modulus)
            point_xy_mod_k2 = generate_point((x * y) / k)
            extra = 32
            assert value(point_xy_mod_k, extra=extra)
            assert value(point_xy_mod_k, extra=extra) == value(point_xy_mod_k2, extra=extra), (value(point_xy_mod_k, extra=extra), value(point_xy_mod_k2, extra=extra))
            
if __name__ == "__main__":
    test_divide()
            
    
    
    
    