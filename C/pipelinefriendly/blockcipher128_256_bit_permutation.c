#define WORDSIZE32 unsigned long
#define ROUNDS 5

#define rotate_left(a, amount)(((a << amount) | (a >> (32 - amount))))

#define mixColumn(a, b, c, d, amount)({\
    a += b;\
    a = rotate_left(a, amount);\
    a ^= c;\
    a += d;})
           
#define mixColumns(a, b, c, d)({\
    mixColumn(a, b, c, d, 1);\
    mixColumn(b, c, d, a, 2);\
    mixColumn(c, d, a, b, 3);\
    mixColumn(d, a, b, c, 4);})
    
#define shiftRows(b, c, d)({\
    b = rotate_left(b, 8);\
    c = rotate_left(c, 16);\
    d = rotate_left(d, 24);})
   
#define permutation(a, b, c, d)({\
    mixColumns(a, b, c, d);\
    shiftRows(b, c, d);})
    
#define choice_swap(a, b, c)({\
    t = b ^ c;\
    t &= a;\
    b = t ^ b;\
    c = t ^ c;})
    
#define shuffleBits(a, b, c, d)({\
   b, a = choice_swap(c, b, a);\
   d, c = choice_swap(a, d, c);\
   a, d = choice_swap(b, a, d);\
   c, b = choice_swap(d, c, b);})
   
#define add_key(a, b, c, d, keys, key_number)({\
    a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];}) 
       
#define round_function256(a, b, c, d, round_keys, round_number)({\
    add_key(a, b, c, d, round_keys, round_number);\
    shuffleBits(a, b, c, d);\
    permutation(a, b, c, d);\
    permutation(a, b, c, d);})
    
#define round_function128(a, b, c, d, round_keys, round_number)({\
    add_key(a, b, c, d, round_keys, round_number);\
    shuffleBits(a, b, c, d);\
    permutation(a, b, c, d);\
    permutation(a, b, c, d);})
    
#define store_data(data, a, b, c, d)({\
    data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_data(data, a, b, c, d)({\
    a = data[0]; b = data[1]; c = data[2]; d=data[3];})

#define iterate(round_function, a, b, c, d, round_keys, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        round_function(a, b, c, d, round_keys, iteration);}})

#define preprocess_key_schedule(round_keys, key, rounds)({\
    load_data(key, a, b, c, d);\
    iterate(derive_round_key, a, b, c, d, round_keys, rounds);})
    
#define derive_round_key(a, b, c, d, round_keys, round_number)({\
    permutation(a, b, c, d);\
    t = (a ^ b) + (c ^ d);\
    round_keys[0 + (4 * round_number)] = (a + t);\
    round_keys[1 + (4 * round_number)] = (b + t);\
    round_keys[2 + (4 * round_number)] = (c + t);\
    round_keys[3 + (4 * round_number)] = (d + t);})
                           
void blockcipher128_256_encrypt(WORDSIZE32* data, WORDSIZE32* key){
    WORDSIZE32 a, b, c, d, t, round_keys[8 * ROUNDS];    
    preprocess_key_schedule(round_keys, key, (ROUNDS * 2));        
    load_data(data, a, b, c, d);    
    iterate(round_function256, a, b, c, d, round_keys, ROUNDS);        
    store_data(data, a, b, c, d);}

void blockcipher128_128_encrypt(WORDSIZE32* data, WORDSIZE32* key){
    WORDSIZE32 a, b, c, d, t, round_keys[4 * ROUNDS];
    preprocess_key_schedule(round_keys, key, ROUNDS);    
    load_data(data, a, b, c, d);    
    iterate(round_function128, a, b, c, d, round_keys, ROUNDS);        
    store_data(data, a, b, c, d);}
                    
#include "../performancetesting.c"    
int main(){    
    test_encrypt_performance_4x32_256(blockcipher128_256_encrypt, (1024 * 1024 * 1024) / 16);
    test_encrypt_performance_4x32_128(blockcipher128_128_encrypt, (1024 * 1024 * 1024) / 16);
    return 0;}
        