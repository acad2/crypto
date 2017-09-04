from crypto.utilities import random_integer, big_prime, modular_inverse, modular_subtraction

SIZE = 32
P = big_prime(SIZE + 1)

def generate_key(size=SIZE, p=P):
    a = random_integer(size)
    b = random_integer(size)
    d = modular_inverse(modular_subtraction(b ** 2, a ** 2, p), p)
    return a, b, d
    
def generate_points(key, size=SIZE, p=P):
    a, b, d = key
    x, y = random_integer(size), random_integer(size)
    point1 = ((a * x) + (b * y)) % p
    point2 = ((a * y) + (b * x)) % p
    return point1, point2, x, y
    
def recover_xy(p1, p2, key, p=P):    
    a, b, d = key    
    x = (((b * p2) - (a * p1)) * d) % p 
    y = (((b * p1) - (a * p2)) * d) % p
    
    # b(ay + bx) - a(ax + by)
    # aby + bbx - aax - aby
    # bbx - aax
    # x(aa - bb)
    
    # b(ray + rbx) - a(zax + zby)
    # bray + brbx - azax - azby
    
    # b(ray + rbx) - a(ax + by)
    # bray + brbx - aax - aby
    
    # b(ay + b(x + y)) - a(ax + by)
    # bay + bb(x + y) - aax + aby
    # bb(x + y) - aax
    # bby - aa
    
    # b(ay + bxy) - a(ax + by)
    # bay + bbxy - aax + aby
    # bbxy - aax
    # x(bby - aa)
    # x(y - bibiaa)
    # xy - xbibiaa
    
    
    # ax + by, ay + bx
    # rax + rby + tay + tbx
    # a(xr + ty) + b(ry + tx)
    # xr + ty + aib(ry + tx)
    
    
    # ax + e, ay + s
    # rax + re + tay + ts
    # a(rx + ty) + re + ts
    # rx + ty + ai(re + ts)
    # r + xity 
    
    # ax + xe, ay + ys
    # rax + rxe, tay + tys
    # x(ra + re) + y(at + st)
    # xr(a + e) + yt(a + s)
    
    return x, y
    
def test_recover_xy():
    key = generate_key()
    point1, point2, x, y = generate_points(key)
    _x, _y = recover_xy(point1, point2, key)
    assert _x == x, (_x, x)
    assert _y == y, (_y, y)
    
    r, z = random_integer(2), random_integer(2)
    point1 *= r
    point2 *= r
    ciphertext = (point1 + point2) % P
    
    x2, y2 = recover_xy(point1, point2, key)
    print r
    print z
    print ((r * x) + (y * z)) % P
    print ((r * y) + (x * z)) % P
    print x2
    print y2
    print 
    
    #point1 *= 3
    #point2 *= 2
    #x3, y3 = recover_xy(point1, point2, key)
    #
    # rax + rby + zay + zbx
    # r(ax + by) + z(ay + bx)
    # x(ar + bz) + y(az + br)
    # a(rx + yz) + b(ry + zx)
    # 
    
if __name__ == "__main__":
    test_recover_xy()
    
    