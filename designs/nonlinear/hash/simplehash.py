def simplehash(data, key=11):
    output = key
    for index, byte in enumerate(data):    
        #value = (byte + output)
       # key += output
       # key &= 0xFFFF
        #output += ((key + output) * (value)) + output
        output *= byte + key
        output += (byte + output)                
        output &= 0xFFFFFFFFFFFFFFFF
        print format(output, 'b').zfill(64)
 #   print chr(output >> 8) + chr(output & 255)
    return output
    
    
def test_simplehash():
    import itertools
    outputs = set()
    for inputs in itertools.product(range(256), range(256)):
        outputs.add(simplehash(inputs))    
    print "Output count: ", len(outputs)
    
if __name__ == "__main__":
    test_simplehash()
    