#include "performancetesting.c"

#define rotate_left(a, amount)((a << amount) | (a >> (32 - amount)))
#define choice(a, b, c)((c ^ (a & (b ^ c))))

#define _permutation(a, b, c, d)({\
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
        
#define store_data(data, a, b, c, d)({\
    data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_data(data, a, b, c, d)({\
    a = data[0]; b = data[1]; c = data[2]; d=data[3];})

#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}})
 
#define add_key(a, b, c, d, keys, key_number)({\
    a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];})  
 
void permutation(WORDSIZE32* data){
    WORDSIZE32 a, b, c, d, _t;
    load_data(data, a, b, c, d);
    iterate(_permutation, a, b, c, d, 10);
    store_data(data, a, b, c, d);}
    
void encrypt(WORDSIZE32* data, WORDSIZE32* key){
    WORDSIZE32 a, b, c, d, _t;
    load_data(data, a, b, c, d);
    
    add_key(a, b, c, d, key, 0);
    iterate(_permutation, a, b, c, d, 10);
    add_key(a, b, c, d, key, 1);
    iterate(_permutation, a, b, c, d, 10);
    add_key(a, b, c, d, key, 2);
    
    store_data(data, a, b, c, d);}
    
int main(){    
    WORDSIZE32 message[4];
    test_permutation_performance_4x32(permutation, (1024 * 1024 * 1024) / 16); 
    test_encrypt_performance_4x32_384(encrypt, (1024 * 1024 * 1024) / 16);
    return 0;}
    