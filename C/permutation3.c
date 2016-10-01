#include "constructions.c"
#include "metrics.c"

#define WORDSIZE32 unsigned long
#define ROUNDS 2

#define rotl32(x, amount)(x << amount | (x >> (32 - amount)))
#define choice(a, b, c)(c ^ (a & (b ^ c)))
#define horizontal_mixing(a, b, c, d, rotate_amount)({a += b ^ c ^ d; a = rotl32(a, rotate_amount);})   
#define vertical_mixing(a, b, c, d, rotate_amount)({a ^= choice(b, c, d); a = rotl32(a, rotate_amount);})

#define round_function(a, b, c, d)({horizontal_mixing(a, b, c, d, 1 ); \
                                    horizontal_mixing(b, a, c, d, 2 ); \
                                    horizontal_mixing(c, a, b, d, 5 ); \
                                    horizontal_mixing(d, a, b, c, 7 ); \
                                    vertical_mixing(a, b, c, d, 11); \
                                    vertical_mixing(b, a, c, d, 13); \
                                    vertical_mixing(c, a, b, d, 17); \
                                    vertical_mixing(d, a, b, c, 19);});
                                      
    
void permutation(WORDSIZE32* state)
{
    WORDSIZE32 a=state[0], b= state[1], c=state[2], d=state[3], t;
     
    int round;    
    for (round = 0; round < ROUNDS; round++)
    {                                
        round_function(a, b, c, d);  
    }
    
    state[0] = a; state[1] = b; state[2] = c; state[3] = d;
}
 
void encrypt(WORDSIZE* data, WORDSIZE* key)
{
    WORDSIZE round_keys[ROUNDS * 4];
    key_schedule(permutation, round_keys, key, ROUNDS, 4);
    key_alternating_cipher(permutation, round_keys, data, ROUNDS, 4);
}    
 
void _test_encrypt_performance()
{   
    double time_taken;
    unsigned long byte_count = 1024 * 1024 * 1024;
    unsigned int block_size = 16;
    
    test_encrypt_performance(encrypt, 4, byte_count, block_size);
}
    
void _test_permutation_performance()
{
    double time_taken;
    unsigned long byte_count = 1024 * 1024 * 1024;
    unsigned int block_size = 16;
    test_permutation_performance(permutation, 4, byte_count, block_size);
}    
   
   
int main()
{
    //_test_encrypt_performance();
    _test_permutation_performance();
}