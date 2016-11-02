def primitive_permutation(words, key, mask=0xFFFFFFFFFFFFFFFF, shift_amount=32):        
    for round in range(1):
        for index in reversed(range(1, len(words))):
            left, right = words[index - 1], words[index]
            keyl, keyr = key[index - 1], key[index]
            right = (right + keyr) 
            left = (left + (right >> shift_amount)) & mask
            left = (left + keyl) & mask
            
            words[index - 1], words[index] = left, right & mask
        
def test_primitive_permutation():
    from crypto.utilities import find_long_cycle_length_subroutine
    words = [0, 1]
    key = [3, 17]
    
    for progress in find_long_cycle_length_subroutine(2 ** 24, 256, primitive_permutation, words, key, 0xFF, 4):
        if isinstance(progress, int):
            print("progress: {}".format(progress))
    print("Result: {}".format(len(progress)))
    
if __name__ == "__main__":
    test_primitive_permutation()
    