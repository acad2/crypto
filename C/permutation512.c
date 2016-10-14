#include "performancetesting.c"

#define rotate_left(a, amount)((a << amount) | (a >> (32 - amount)))

#define __permutation(a, b, c, d)({\
    a += b;\
    a ^= d;\
    c += d;\
    c ^= b;\
    a = rotate_left(a, 2);\
    c = rotate_left(c, 4);\
    b += c;\
    b ^= a;\
    d += a;\
    d ^= c;\
    b = rotate_left(b, 8);\
    d = rotate_left(d, 16);})
        
#define _permutation(a, b, c, d)({\
    __permutation(a, b, c, d);\
    __permutation(d, b, c, a);\
    __permutation(a, c, d, b);})
    
#define transpose_words(data)({\
    temp = data[0];\
    data[0 ] = data[11]; data[11] = data[8 ]; data[8 ] = data[13]; data[13] = data[10];\
    data[10] = data[14]; data[14] = data[2 ]; data[2 ] = data[4 ]; data[4 ] = data[12];\
    data[12] = data[1 ]; data[1 ] = data[5 ]; data[5 ] = data[6 ]; data[6 ] = data[9 ];\
    data[9 ] = data[3 ]; data[3 ] = data[15]; data[15] = data[7 ]; data[7 ] = temp;}) 
        
#define store_data(data, a, b, c, d, block_number)({\
    data[(4 * block_number) + 0] = a;\
    data[(4 * block_number) + 1] = b;\
    data[(4 * block_number) + 2] = c;\
    data[(4 * block_number) + 3] = d;})   
        
#define load_data(data, a, b, c, d, block_number)({\
    a = data[(4 * block_number) + 0];\
    b = data[(4 * block_number) + 1];\
    c = data[(4 * block_number) + 2];\
    d = data[(4 * block_number) + 3];})

#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}})
 
#define add_key(a, b, c, d, keys, key_number)({\
    a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];})  
    
#define load_permute_store(block_number)({\
    load_data(data, a, b, c, d, block_number);\
    _permutation(a, b, c, d);\
    store_data(data, a, b, c, d, block_number);})
    
void permutation(WORDSIZE32* data){
    WORDSIZE32 a, b, c, d, temp;
    load_permute_store(0);
    load_permute_store(1);
    load_permute_store(2);
    load_permute_store(3);
    transpose_words(data);}
    
int main(){
    test_permutation_performance_16x32(permutation, (1024 * 1024 * 1024) / 64);
    return 0;}
    
        
        