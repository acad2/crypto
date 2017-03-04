def hamming_weight(item):
    return format(item, 'b').count('1')
    
def branch_number(function):
    branching = []
    for x in range(256):
        for y in range(256):
            output = function(y, x)
            output2 = function(y, (x + 1) % 256)
            difference = sum(hamming_weight(output[index] ^ output2[index]) for index in range(len(output)))
            difference += hamming_weight(x ^ ((x + 1) % 256))
            branching.append(difference)
    return min(branching)

def test_branch_number():
    from crypto.designs.blockcipher.standardized._aes import aes_round
    def test_function(x, y):
        state = bytearray(16)
        state[0] = x
        state[1] = y
        aes_round(state)
        aes_round(state)
        return state
    print branch_number(test_function)
    
if __name__ == "__main__":
    test_branch_number()
    