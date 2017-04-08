from crypto.utilities import prime_generator, slide

# packed integer/primes format
# stores the factorization of an integer
#
# bit_string = b''
# factors, exponents = factor(N)
# for prime in prime_generator:
#     if prime in factors:
#          bit_string += ('1' * exponents[prime])
#     else:
#          bit_string += '0'

# output = 1
# for bit in bit_string:
#   prime = next(prime_generator)
#   while bit == '1':
#       output *= prime

def pack_factors(factors):
    bit_string = b''
    generator = prime_generator()
    factors = list(factors)
    while factors:
        prime = next(generator)        
        if prime in factors:
            bit_string += '1'
            del factors[0]
        else:
            bit_string += '0'
    return bit_string
    
def pack_exponents(exponents):    
    bit_string = b''
    generator = prime_generator()
    for prime in sorted(exponents.keys()):
        exponent = exponents.pop(prime)
        if exponent < 8:
            bit_string += '0' + format(exponent, 'b').zfill(3)
        else:
            segments = exponent / 8
            bit_string += ('1' + '111') * segments
            
            remainder = exponent % 8
            if remainder:
                bit_string += ('0' + format(remainder, 'b').zfill(3))            
    return bit_string
    
def pack(factors, exponents):
    return pack_factors(factors), pack_exponents(exponents)    

def unpack_factors(factor_string):
    generator = prime_generator()
    output = []
    for bit in factor_string:
        prime = next(generator)
        if bit == '1':
            output.append(prime)
    return output        
    
def unpack_exponents(exponent_string):
    output = []
    generator = (half_byte for half_byte in slide(exponent_string, 4))    
    while True:
        try:
            half_byte = next(generator)
        except StopIteration:
            break
        else:
            if not half_byte & 8:
                output.append(accumulator)                
            else:
                accumulator += half_byte & 7
        
    for half_byte in slide(exponent_string, 4):
        if half_byte & 8:
            
    return [int(half_byte, 2) for half_byte in slide(exponent_string, 4)]
            
def unpack(factor_string, exponent_string):    
    factors = unpack_factors(factor_string)
    exponents = unpack_exponents(exponent_string)      
    exponents = dict((factors[index], exponents[index]) for index in range(len(factors)))
    return compose(factors, exponents)
    
def compose(factors, exponents):
    number = 1
    for factor in factors:        
        number *= (factor ** exponents[factor])
    return number
    
def test_pack_unpack():
    tests = [((2, ), {2: 1}), ((3, 5), {3 : 2, 5 : 1})]
    for factors, exponents in tests:
        number = compose(factors, exponents)
        bit_string = pack(factors, exponents)
        print bit_string
        unpacked = unpack(*bit_string)
        assert unpacked == number, (unpacked, number)
        
if __name__ == "__main__":
    test_pack_unpack()
    