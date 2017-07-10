import collections

from crypto.utilities import rotate_left

def mixRow(a):
    b = a & 0x80808080;
    
    # b |= b >> 1; # without multiply instruction
    # b |= b >> 3;
    # b >>= 3;
        
    b = (b >> 7) * 0x1B; # with multiply instruction

    b ^= (a << 1) & 0xFEFEFEFE;
    c = a ^ b;
    b ^= (c >>  8) | ((c << 24) & 0xFFFFFFFF);
    b ^= ((a <<  8) & 0xFFFFFFFF) | (a >> 24);
    return b ^ (a >> 16) ^ ((a << 16) & 0xFFFFFFFF);
    
def choice(b, c, d):
    return d ^ (b & (c ^ d))  
    
def nonlinear_mixing(t, y, t2, y2):
    #t ^= rotate_left(choice(y, t2, y2), 1, bit_width=32) # has problems related to hamming weight
    #y ^= rotate_left(choice(t2, y2, t), 3, bit_width=32)
    #t2 ^= rotate_left(choice(y2, t, y), 5, bit_width=32)
    #y2 ^= rotate_left(choice(t, y, t2), 7, bit_width=32)
    
    t ^= mixRow(rotate_left(choice(y, t2, y2), 1, bit_width=32)) # fills out the fastest
    y ^= mixRow(rotate_left(choice(t2, y2, t), 3, bit_width=32))
    t2 ^= mixRow(rotate_left(choice(y2, t, y), 5, bit_width=32))
    y2 ^= mixRow(rotate_left(choice(t, y, t2), 7, bit_width=32))
    
    #t ^= rotate_left(mixRow(choice(y, t2, y2)), 1, bit_width=32)
    #y ^= rotate_left(mixRow(choice(t2, y2, t)), 3, bit_width=32)
    #t2 ^= rotate_left(mixRow(choice(y2, t, y)), 5, bit_width=32)
    #y2 ^= rotate_left(mixRow(choice(t, y, t2)), 7, bit_width=32)       
    
    #t ^= rotate_left(choice(y, t2, y2), 1, bit_width=32)
    #t = mixRow(t)
    #y ^= rotate_left(choice(t2, y2, t), 3, bit_width=32)
    #y = mixRow(y)
    #t2 ^= rotate_left(choice(y2, t, y), 5, bit_width=32)
    #t2 = mixRow(t2)
    #y2 ^= rotate_left(choice(t, y, t2), 7, bit_width=32)
    #y2 = mixRow(y2)
    
    #t ^= mixRow(choice(y, t2, y2))
    #y ^= mixRow(choice(t2, y2, t))
    #t2 ^= mixRow(choice(y2, t, y))
    #y2 ^= mixRow(choice(t, y, t2))
    
    return t, y, t2, y2
    
class Average(object):
    """ usage: Average([name=''], [size=20], 
                       [values=tuple()], [meta_average=False]) => average_object
                       
        Average objects keep a running average via the add method.
        The size option specifies the maximum number of samples. When
        this limit is reached, additional samples will result in the
        oldest sample being removed.
        
        values may be used to seed the average.
        
        The meta_average boolean flag is used to determine whether or not
        to keep an average of the average - This is implemented by an
        additional Average object."""
        
    def _get_meta_average(self):
        average = self._meta_average.average
        if not average:
            average = self.average
        return average
    meta_average = property(_get_meta_average)

    def _get_range(self):
        values = self.values
        return (min(values), self.average, max(values))
    range = property(_get_range)
        
    def __init__(self, size=20, values=tuple(), meta_average=True):
        value = meta_average
        if meta_average:
            value = Average(30, meta_average=False)
        self._meta_average = value
        
        size = len(values) if values else size
        self.values = collections.deque(values, size)
        self.max_size = size
        self.size = float(len(self.values))
        if self.size:
            self.average = sum(self.values) / self.size
        else:
            self.average = 0
        self.add = self._partial_add

    def _partial_add(self, value):
        self.size += 1
        self.values.append(value)
        self.average = sum(self.values) / self.size
        if self.size == self.max_size:
            self.add = self._full_add

    def _full_add(self, value):
        old_value = self.values[0]
        adjustment = (value - old_value) / self.size
        self.values.append(value)
        self.average += adjustment
        if self._meta_average:
            self._meta_average.add(self.average)
            
def test_nonlinear_mixing():
    from crypto.utilities import print_state_4x4, integer_to_bytes
    def to_bytes(t, y, t2, y2):
        return integer_to_bytes(t, 4) + integer_to_bytes(y, 4) + integer_to_bytes(t2, 4) + integer_to_bytes(y2, 4)
    t, y, t2, y2 = (0, 0, 0, 1)
    output = nonlinear_mixing(t, y, t2, y2)
#    from pride.components.datastructures import Average
    hamming_weight = Average(size=2 ** 16)
    for sample in range(2 ** 8):
        for chunk in range(2 ** 8):        
            hamming_weight.add(sum(format(word, 'b').zfill(32).count('1') for word in output))
            output = nonlinear_mixing(*output)
            
            #print sample, chunk, max(hamming_weight.values)
        message = "Hamming weight (min/avg/max): {}".format(hamming_weight.range)
        print message
        #print_state_4x4(to_bytes(*output), message)
        #if raw_input("Enter any character+enter to end, enter to continue: "):
        #    break
        #else:
        #    output = nonlinear_mixing(*output)
        
    
if __name__ == "__main__":
    test_nonlinear_mixing()
    