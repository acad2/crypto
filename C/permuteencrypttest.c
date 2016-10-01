#include "performancetesting.c" // for test_encrypt_performance_4x32

#define WORDSIZE32 unsigned long
#define ITERATIONS 10
#define KEY_COUNT 3

#define rotate_left(x, amount)((x << amount | (x >> (32 - amount))))
    
#define choice(a, b, c)((c ^ (a & (b ^ c))))

#define nonlinear_mixing(a, b, c, d, rotate_amount1, rotate_amount2)\
({  a += b ^ c ^ d;\
    a = rotate_left(a, rotate_amount1);\
    a ^= choice(b, c, d);\
    a = rotate_left(a, rotate_amount2);\
})
    
#define permutation(a, b, c, d)\
({  nonlinear_mixing(a, b, c, d, 1, 11);\
    nonlinear_mixing(b, c, d, a, 2, 7);\
    nonlinear_mixing(c, d, a, b, 3, 15);\
    nonlinear_mixing(d, a, b, c, 5, 17);\
})                                                                                                
            
#define choice_swap(key, a, b)\
({  _t = a;\
    a = choice(key, a, b);\
    b = choice(key, b, _t);\
})
    
#define shuffle_words(a, b, c, d, key, key_number)\
({  choice_swap(key[(4 * key_number) + 0], a, b);\
    choice_swap(key[(4 * key_number) + 1], c, d);\
    choice_swap(key[(4 * key_number) + 2], a, c);\
    choice_swap(key[(4 * key_number) + 3], b, d);\
})   
            
#define add_key(a, b, c, d, keys, key_number)\
({  a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];\
})                       
      
#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}\
})    
    
#define store(data, a, b, c, d)\
    ({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_abcd(data)\
    ({a = data[0]; b = data[1]; c = data[2]; d=data[3];})   

void key_schedule(WORDSIZE32* key, WORDSIZE32* round_keys)
{    
    int key_number;           
    WORDSIZE32 a, b, c, d;    
    load_abcd(key);
    
    for (key_number = 0; key_number < KEY_COUNT; key_number++)
    {        
        permutation(a, b, c, d); 
        add_key(a, b, c, d, key, 0);
        store(round_keys, a, b, c, d); 
        add_key(a, b, c, d, key, 0); // remove key
        
        round_keys += 4;
    }
}
        
void encrypt(WORDSIZE32* data, WORDSIZE32* key)
{       
    WORDSIZE32 round_keys[4 * KEY_COUNT], a, b, c, d, _t;
    load_abcd(data);
    key_schedule(key, round_keys);        
    
    add_key(a, b, c, d, round_keys, 0);    
    shuffle_words(a, b, c, d, round_keys, 0);    
    
    iterate(permutation, a, b, c, d, ITERATIONS);
    add_key(a, b, c, d, round_keys, 1);
    
    iterate(permutation, a, b, c, d, ITERATIONS);    
    add_key(a, b, c, d, round_keys, 2);
    
    shuffle_words(a, b, c, d, round_keys, 2);
    
    store(data, a, b, c, d);
}
     
int main()
{
    WORDSIZE32 data[4], key[4];
    key[0] = 1;
    encrypt(data, key);
    test_encrypt_performance_4x32(encrypt, 5000000);
    return 0;
}
