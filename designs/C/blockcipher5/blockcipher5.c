#include "128_32x4_functions.c"

#define WORDSIZE unsigned long
#define ROUNDS 10
#define rotate_left(a, amount)({(a << amount) | (a >> (32 - amount));})
#define choice(a, b, c)({c ^ (a & (b ^ c));})

#define _permutation(a, b, c, d, rotation_amount)({\
    a ^= b + c + d;\
    a = rotate_left(a, (7 + rotation_amount));\
    a += (b ^ c ^ d);\
    a = rotate_left(a, (9 + rotation_amount));})           
    
#define choice_shuffle(a, b, k)({\
    t = a;\
    a = choice(k, a, b);\
    b = choice(k, b, t);})        
    
#define bit_permutation(a, b, c, d, key, key_number)({\
    k0 = key[(4 * key_number) + 0]; k1 = key[(4 * key_number) + 1]; k2 = key[(4 * key_number) + 2]; k3 = key[(4 * key_number) + 3];\
    choice_shuffle(a, b, k0);\
    choice_shuffle(c, d, k1);\
    a = rotate_left(a, 1);\
    b = rotate_left(b, 2);\
    c = rotate_left(c, 3);\
    d = rotate_left(d, 5);\
    choice_shuffle(a, c, k2);\
    choice_shuffle(b, d, k3);\
    a = rotate_left(a, 8 );\
    b = rotate_left(b, 16);\
    c = rotate_left(c, 24);\
    d = rotate_left(d, 4);})
    
#define permutation(a, b, c, d)({\
    _permutation(a, b, c, d, 1);\
    _permutation(b, c, d, a, 2);\
    _permutation(c, d, a, b, 5);\
    _permutation(d, a, b, c, 7);})    
            
void encrypt(WORDSIZE* data_128, WORDSIZE* key_384){
    WORDSIZE a, b, c, d, k0, k1, k2, k3, t;
    load_abcd(data_128);
    
    add_key(a, b, c, d, key_384, 0);
    bit_permutation(a, b, c, d, key_384, 0);
    iterate(permutation, a, b, c, d, ROUNDS);
    
    add_key(a, b, c, d, key_384, 1);
    bit_permutation(a, b, c, d, key_384, 1);
    iterate(permutation, a, b, c, d, ROUNDS);
    
    add_key(a, b, c, d, key_384, 2);
    store_abcd(data_128, a, b, c, d);}
                 
#include "performancetesting.c"    

int main(){
    test_encrypt_performance_4x32(encrypt, 5000000);    
    return 0;}
    