from crypto.utilities import is_prime, big_prime, modular_inverse, random_integer

def test_break():
    N = 65537#big_prime(3)
    assert is_prime(N)    
    p_i = 256
    p = modular_inverse(p_i, N)
    
    q = random_integer(1)
    e = random_integer(1)
    c = ((p * q) + e) % N
    print q, e, p_i * e < N
    _q, _e = break_qtpie(p, c, N)
    assert (q, e) == (_q, _e), ((q, e), (_q, _e))
    assert _e == e, (e, _e)
    
def break_qtpie(p, c, n):    
    x = n - p
    q, e = divmod(c, x)
    _c = (((x * q) + e) % n)
    assert _c == c, (_c, c)
    
    e -= 1
    _c = c - e
    q = (_c * modular_inverse(p, n)) % n    
    return q, e
    
if __name__ == "__main__":
    test_break()
    