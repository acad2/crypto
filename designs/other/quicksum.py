#n = 256
#1 + 255
#2 + 254
#3 + 253
#...
#127 + 129
#128

def quicksum_range(p):
    """ usage: quicksum_range(p) => int
    
        Sums range(p) significantly faster then sum(range(p)). """    
    e = p & 1
    q = p >> 1
    if not p & 1:
        e = q
        q -= 1           
    else:
        e = 0   
        q -= 0
    return (p * q) + e

def quicksum_ordered_set(numbers):    
    """ usage: quicksum_ordered_set(iterable: numbers) => int
        
        Sums the supplied numbers.
        Requirements:
            - the supplied numbers must form a set (meaning no duplicates)
                - the data type can be a list or tuple still, as long as len(set(iterable)) == len(iterable)
            - the supplied numbers are in ascending order """            
    p = numbers[-1]
    _sum = quicksum_range(p)
    # 1       5   7   9    11    13    15 desired addends
    # 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 quicksum all of these
    #   2 3 4   6   8   10    12    14    subtract these out    
    numbers = numbers[:]  
    if numbers[0] == 0:
        a = numbers.pop(0)
    else:
        a = 0
    while numbers:        
        b = numbers.pop(0)        
        difference = sum(xrange(a + 1, b))    
        _sum -= difference
        a = b           
    return _sum + a
    
def test_quicksum_range():
    for x in range(3, 257):        
        _sum = quicksum_range(x)
        __sum = sum(xrange(x))
        assert _sum == __sum, (x, _sum, __sum)
    
    from pride.functions.timingcomparison import timing_comparison
    from crypto.utilities import random_integer
    p = random_integer(2)    
    timing_comparison((sum, (range(p), ), {}),
                      (quicksum_range, (p, ), {}), iterations=1000)
                      
def test_quicksum_ordered_set():
    from os import urandom
    from crypto.utilities import random_integer
    for count in range(256):
        test_case = sorted(list(set(bytearray(urandom(32)))))
        indices = sorted([item & 31 for item in bytearray(urandom(4))])
        del test_case[indices.pop(0):indices.pop(0)]
        del test_case[indices.pop(0):indices.pop(0)]
                
        output = quicksum_ordered_set(test_case)        
        assert output == sum(test_case), (output, sum(test_case), test_case)
    
    from pride.functions.timingcomparison import timing_comparison
    test_case = range(2 ** 24)
    slices = []
    randoms = sorted([random_integer(2) for count in range(8)])
    while randoms:
        slices.append(slice(randoms.pop(0), randoms.pop(0))) 
    for _slice in slices:
        del test_case[_slice]
        
    timing_comparison((sum, (test_case, ), {}),
                      (quicksum_ordered_set, (test_case, ), {}))
                      
if __name__ == "__main__":
    test_quicksum_range()
    #test_quicksum_ordered_set()
    