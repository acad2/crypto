from pride.crypto.utilities import rotate_left
from differential import find_best_differential
from linear import calculate_linearity

def shuffle_bytes(_state, section, temp=list(range(16))):          
    temp[7] = _state[0] 
    temp[12] = _state[1]
    temp[14] = _state[2]
    temp[9] = _state[3]
    temp[2] = _state[4]
    temp[1] = _state[5]
    temp[5] = _state[6]
    temp[15] = _state[7]
    temp[11] = _state[8]
    temp[6] = _state[9]
    temp[13] = _state[10]
    temp[0] = _state[11]
    temp[4] = _state[12]
    temp[8] = _state[13]
    temp[10] = _state[14]
    temp[3] = _state[15]
            
    _state[section] = temp[:]
           
def prp(data, key, mask=255, rotation_amount=5, bit_width=8, key_slice=slice(16, 32), data_slice=slice(0, 16), transpose=True):     
    shuffle_bytes(data, slice(0, 16))      
    
    new_key = 0
    _key = key
    for index in reversed(range(len(data) - 1)):  
        key = _key
        
        left, right = data[index], data[index + 1]                
        
        key ^= right                 
        right = rotate_left((right + key + index) & mask, rotation_amount, bit_width)                
        key ^= right
        
        key ^= left        
        left = (left + (right >> (bit_width / 2))) & mask                
        left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)                    
        key ^= left
        
        data[index], data[index + 1] = left, right                 

        new_key ^= key
     
    key = _key
    
    key ^= data[0]
    data[0] = (data[0] + key) & mask
    key ^= data[0]
    
    new_key ^= key
    return new_key
    
def prf(data, key, mask=255, rotations=5, bit_width=8):      
    for index in range(len(data)):         
        new_byte = rotate_left((data[index] + key + index) & mask, rotations, bit_width)
        key ^= new_byte               
        data[index] = new_byte  
        
def generate_key(data, _key=0):   
    __key = 0    
    for index, byte in enumerate(data):
        key = _key # can do each byte in parallel
        
        key ^= (byte + index) & 255
        key = (key + (byte ^ index)) & 255
        key ^= (byte + index) & 255
        
        __key = (__key + key) & 255 # facilitates parallelism   
    return __key
   
def test_generate_key():
   # sbox = []
   # for byte in range(256):
   #     data = bytearray(16)
   #     data[-2] = byte
   #     sbox.append(generate_key(data))
   # print bytearray(sbox)
   # print find_best_differential(sbox)
    
    sbox = []
    for byte in range(256):
        data = bytearray(16)
        data[-1] = byte
        prf(data, generate_key(data))        
        sbox.append(data[-1])
    
    print find_best_differential(sbox)
    print calculate_linearity(sbox)
    
def generate_random_data(data, key):    
    while True:
        for index, byte in enumerate(data):
            key = (key + (byte ^ index)) & 255
            key ^= (byte + index) & 255
            key = (key + (byte ^ index)) & 255
            data[index] = key ^ byte
        yield bytes(data)
    #return key
    
def test_prf():
    data = bytearray(range(16))
    key = generate_key(data)
    prf(data, key)
    #print [byte for byte in data]
    print data
    
    #data2 = bytearray(range(16))
    #data2[0] = 1
    #data2[1] = 0
    #prf(data2, generate_key(data2))
    #print [byte for byte in data2]
    
    data3 = bytearray(range(16))
    data3[-1] = 14
    data3[-2] = 15
    prf(data3, generate_key(data3))
    #print [byte for byte in data3]
    print data3
    
    data = bytearray(16)
    data[15] = 1
    prf(data, generate_key(data))
    print data
    
    data = bytearray(16)
    data[14] = 1
    prf(data, generate_key(data))
    print data
    
def test_prp():
    data = bytearray(16)
    prp(data, 0)
    
    data2 = bytearray(16)
    data2[-1] = 1
    prp(data2, 1)
    
    data3 = bytearray(16)
    data3[-2] = 1
    prp(data3, 1)
    print data
    print
    print data2
    print
    print data3
        
if __name__ == "__main__":
    #test_prf()
    #test_generate_key()
    test_prp()
    