def addKey(state, key, mask=255):
    for index, byte in enumerate(state):
        state[index] = (byte + key[index]) & mask
        
def mixColumns(state):
     # iterate over the 4 columns
     for i in range(4):
         # construct one column by slicing over the 4 rows
         column = state[i:i+16:4]
         # apply the mixColumn on one column
         column = mixColumn(column)
         # put the values back into the state
         state[i:i+16:4] = column
     return state

 # multiplication of 1 column of the 4x4 matrix
def mixColumn(column, mask=255):
    mult = [2, 1, 1, 3]
    cpy = list(column)
    g = lambda a, b: int.__mul__(a, b) & mask

    column[0] = (g(cpy[0], mult[0]) + g(cpy[3], mult[1]) +
                 g(cpy[2], mult[2]) + g(cpy[1], mult[3])) & mask
                
    column[1] = (g(cpy[1], mult[0]) + g(cpy[0], mult[1]) + 
                 g(cpy[3], mult[2]) + g(cpy[2], mult[3])) & mask
                
    column[2] = (g(cpy[2], mult[0]) + g(cpy[1], mult[1]) + 
                 g(cpy[0], mult[2]) + g(cpy[3], mult[3])) & mask
                
    column[3] = (g(cpy[3], mult[0]) + g(cpy[2], mult[1]) + 
                 g(cpy[1], mult[2]) + g(cpy[0], mult[3])) & mask
    return column
    
def subBytes(state, modulus=256):
    for index, byte in enumerate(state):
      #  assert pow(byte, modulus - 2, modulus) != byte, byte
        state[index] = pow(byte, modulus - 2, modulus)
        
def shiftRows(state):
    # 4 5 6 7
    # 5 6 7 4
    state[4:8] = state[5:8] + bytearray([state[4]])
    
    # 8 9 10 11
    # 10 11 8 9
    state[8:12] = state[10:12] + state[8:10]
    
    # 12 13 14 15
    # 15 12 13 14
    state[12:16] = bytearray([state[15]]) + state[12:15]
          
def permutation(state):
    subBytes(state)
    shiftRows(state)
    mixColumns(state)
    
def encrypt(data, key, rounds=1):
    addKey(data, key)
    for round in range(rounds):
        permutation(data)
        addKey(data, key)
    #subBytes(data)
    #shiftRows(data)
    #addKey(data, key)
    return data[:]
    
    