def two_bit_adder(bit0, bit1):
    result = bit0 ^ bit1
    carry = (bit0 & bit1)    
    return carry, result
    
def two_bit_adder_int(int0, int1):
    output = int0 ^ int1
    carry = (int0 & int1) << 1    
    if carry:
        return two_bit_adder_int(carry, output)
    else:
        return output
       
def bit_adder_2(int0, int1):
    output = int0 ^ int1
    carry = (int0 & int1) << 1        
    while carry:
        output = carry ^ output
        carry = carry & output
    return output
        
def test_two_bit_adder():
    for function in (two_bit_adder_int, bit_adder_2):        
        for bit0 in range(256):
            for bit1 in range(256):                
                output = function(bit0, bit1)                   
                assert output == bit0 + bit1, ("Failure with: ", function)
        
      
if __name__ == "__main__":
    test_two_bit_adder()
    