#include "performancetesting.c"
#define ROUNDS 20

#define rotate_left(a, amount)(((a << amount) | (a >> (32 - amount))))
#define add_choice(a, b, c)({\
    b ^= c;\
    b &= a;\
    b += c;})

#define __permutation(a, b, c, d, amount)({\
    add_choice(a, b, c);\
    b = rotate_left(b, amount);\
    d ^= b;\
    a += d;})
    
#define _permutation(a, b, c, d)({\
    __permutation(a, b, c, d, 1 );\
    __permutation(b, c, d, a, 10);\
    __permutation(c, d, a, b, 19);\
    __permutation(d, a, b, c, 28);})    
       
#define store_data(data, a, b, c, d)({\
    data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_data(data, a, b, c, d)({\
    a = data[0]; b = data[1]; c = data[2]; d=data[3];})

#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}})
        
void permutation(WORDSIZE32* data){
    WORDSIZE32 a, b, c, d;
    load_data(data, a, b, c, d);
    iterate(_permutation, a, b, c, d, ROUNDS);
    store_data(data, a, b, c, d);}
    
#define add_key(a, b, c, d, keys, key_number)({\
    a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];}) 
    
void encrypt(WORDSIZE32* data, WORDSIZE32* key){
    WORDSIZE32 a, b, c, d;
    load_data(data, a, b, c, d);
    
    add_key(a, b, c, d, key, 0);
    iterate(_permutation, a, b, c, d, ROUNDS);
    add_key(a, b, c, d, key, 1);  
    iterate(_permutation, a, b, c, d, ROUNDS);
    add_key(a, b, c, d, key, 2);
    
    store_data(data, a, b, c, d);}
    
int main(){
    test_permutation_performance_4x32(permutation, (1024 * 1024 * 1024) / 16);
    test_encrypt_performance_4x32_384(encrypt, (1024 * 1024 * 1024) / 16);
    return 0;}
    