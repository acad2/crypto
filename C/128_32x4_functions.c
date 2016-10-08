
#define add_key(a, b, c, d, keys, key_number)\
({  a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];\
})                       
    
#define store_abcd(data, a, b, c, d)\
    ({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_abcd(data)\
    ({a = data[0]; b = data[1]; c = data[2]; d=data[3];})
    
#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}\
})    
