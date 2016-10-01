def permute(left_byte, right_byte, key_byte):        
    right_byte = (right_byte + key_byte) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte
    
def invert_permute(left_byte, right_byte, key_byte):    
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535   
    left_byte = (65536 + (left_byte - (right_byte >> 8))) & 65535       
    right_byte = (65536 + (right_byte - key_byte)) & 65535   
    return left_byte, right_byte
    
def attack_permute(left_byte, right_byte, correct_right_byte):
    possible_keys = []
    for key_guess in range(65536):
        _left, _right = invert_permute(left_byte, right_byte, key_guess)
        if _right == correct_right_byte:
            possible_keys.append(key_guess)#, _left, _right))
    return possible_keys
        
def test_attack_permute_one_byte():
    left = right = 0
    key = 1337
    
    left, right = permute(left, right, key)   
    _left, _right = invert_permute(left, right, key)
    assert _left == 0 and _right == 0
    
    recovered_keys = attack_permute(left, right, 0)
    assert key in recovered_keys, (recovered_keys, key)
    print recovered_keys
    
def test_attack_permute_two_bytes():
    left = right = 0
    key = 1337
    
    left, right = permute(left, right, key)
    right, left = permute(right, left, key)
    
    key_values = [x for x in xrange(65536)]
    for left_byte_guess in range(65536):
        possible_keys = attack_permute(right, left, left_byte_guess)
        for key_guess in range(65536):
            
        for key_guess in possible_keys:
            _right, _left = invert_permute(right, left, key_guess)
            _left, _right = invert_permute(_left, _right, key_guess)
            if _left == 0 and _right == 0:
                key_values.append(key_guess)
    print key_values
    
if __name__ == "__main__":
    #test_attack_permute_one_byte()
    test_attack_permute_two_bytes()