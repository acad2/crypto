#include "performancetesting.c"

#define KEY_COUNT 3
#define WORDSIZE unsigned long
#def
#define rotate_left(x, amount)(x << amount | (x >> (32 - amount)))
#define choice(a, b, c)(c ^ (a & (b ^ c)))

#define mix_4x4(a, b, c, d)\
({  a = rotate_left(a + choice(d, b, c), 0);\
    b = rotate_left(b + choice(a, c, d), 1);\
    c = rotate_left(c + choice(b, d, a), 2);\
    d = rotate_left(d + choice(c, a, b), 3);\
})

#define mix_4x32(a, b, c, d)\
({  a = rotate_left(a + (b ^ c ^ d), 24,);\
    b = rotate_left(b + (a ^ c ^ d), 16,);\
    c = rotate_left(c + (b ^ a ^ d), 8, );\
    d = rotate_left(d + (b ^ c ^ a), 0, );\
})

#define permutation(a, b, c, d)\
({  mix_4x4(a, b, c, d)\
    mix_4x32(a, b, c, d)\
})

#define add_key(a, b, c, d, keys, key_number)\
({  a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];\
})                       
    
#define store(data, a, b, c, d)\
    ({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_abcd(data)\
    ({a = data[0]; b = data[1]; c = data[2]; d=data[3];})
    
#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}\
})    
    
void key_schedule(WORDSIZE* key, WORDSIZE* round_keys)
{   int key_number;
    WORDSIZE a, b, c, d;
    load_abcd(key);
    
    for (key_number = 0; key_number < KEY_COUNT; key_number++){
        permutation(a, b, c, d);
        add_key(a, b, c, d, key, 0);
        store(round_keys, a, b, c, d);
        add_key(a, b, c, d, key, 0);
        round_keys += 4;}
}

void encrypt(WORDSIZE32* data, WORDSIZE32* key)
{       
    WORDSIZE32 round_keys[4 * KEY_COUNT], a, b, c, d, _t;
    load_abcd(data);
    key_schedule(key, round_keys);        
    
    int key_number;
    for (key_number = 0; key_number < KEY_COUNT - 1; key_number++)
    {        
        add_key(a, b, c, d, round_keys, key_number);        
        iterate(permutation, a, b, c, d, ITERATIONS);        
    }
    add_key(a, b, c, d, round_keys, (KEY_COUNT - 1));
    store(data, a, b, c, d);
}

int main()
{
    test_encrypt_performance(encrypt, 500000);
    return 0;
}
