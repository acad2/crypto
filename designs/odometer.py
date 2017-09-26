# "odometer" function
# y       x
#      sx + e
#      q, r = divmod(sx + e, p)
# y + q  x + r

def function(x, y, k1, k2, p=257):
    t = (x * k1) + k2
    q, r = divmod(t, p)
    x += r
    y += q
    return x % p, y % p
    
def test_function_period():
    from crypto.utilities import find_cycle_length
    x = 2
    y = 5
    k1 = 30
    k2 = 4
    _input = [x, y, k1, k2]    
    def test_function(inputs):
        x, y, k1, k2 = inputs
        return function(x, y, k1, k2) + (k1, k2)
    for count in range(16):
        _input = test_function(_input)
        print '\n'.join(format(item, 'b').zfill(9) for item in _input[:2])
        raw_input()
    #print len(find_cycle_length(test_function, _input))
        
    
if __name__ == "__main__":
    test_function_period()
    