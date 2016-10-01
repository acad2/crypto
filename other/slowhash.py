from pride.crypto.utilities import rotate, null_pad, slide

def shuffle_extract(data, key, state):    
    """ State update and round key extraction function. """
    for i in reversed(range(1, 256)):
        # Fisher-Yates shuffle
        j = state & (i - 1)                
        data[i], data[j] = data[j], data[i]           

        key[i] ^= data[j] ^ data[i] ^ i # randomize key value   
        state ^= key[i] ^ key[j] # randomize value with output feedback
        
    key[0] ^= data[j] ^ data[i] 
    state ^= key[0] ^ key[j]
    return state
    
def slow_hash(seed, tweak, rounds=1, output_size=32, tables=256):
    seed = bytearray(null_pad(seed, 256))
    state = seed[0]
    _rows = [rotate(tweak, amount) for amount in xrange(tables)]
    
    for round in range(rounds):    
        for i in reversed(range(1, 256)):    
            for rows in slide(_rows, 256):
                for row in rows:                
                    j = state & (i - 1)                
                    row[i], row[j] = row[j], row[i]           
                    random_row = rows[j]
                    row[j], random_row[j] = random_row[j], row[j]
                    
                    seed[i] ^= random_row[row[j]] ^ row[random_row[j]]
                    state ^= seed[i] ^ seed[j] ^ row[i] ^ random_row[i]
        i = 0
        for rows in slide(_rows, 256):
            for row in rows:        
                seed[i] ^= random_row[row[j]] ^ row[random_row[j]]
                state ^= seed[i] ^ seed[j] ^ row[i] ^ random_row[i]
    
    output = []
    for index in range(output_size):
        output.append(seed[rows[index][index]])    
    return bytearray(output)
    
def test_slow_hash():
    _input = "Bad password lol"
    tweak = range(256)
    print slow_hash(_input, tweak, rounds=1, tables=4096)
    
if __name__ == "__main__":
    test_slow_hash()
    