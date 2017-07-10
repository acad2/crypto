#include "constructions.c"
#include "metrics.c"

#define WORDSIZE32 unsigned long
#define ROUNDS 2

inline WORDSIZE32 rotl32(WORDSIZE32 x, unsigned int amount){return x << amount | (x >> (32 - amount));}
inline WORDSIZE32 choice(WORDSIZE32 a, WORDSIZE32 b, WORDSIZE32 c){return c ^ (a & (b ^ c));}
    
void permutation(WORDSIZE32* state)
{
    WORDSIZE32 a=state[0], b= state[1], c=state[2], d=state[3], t;
     
    int round;    
    for (round = 0; round < ROUNDS; round++)
    {
        //a = rotl32(a + (b ^ c ^ d), 1);
        //b = rotl32(b + (a ^ c ^ d), 3);
        //c = rotl32(c + (a ^ b ^ d), 5);
        //d = rotl32(d + (a ^ b ^ c), 7);
        //
        //a = rotl32(a ^ choice(b, c, d), 11);
        //b = rotl32(a ^ choice(c, d, a), 17);
        //c = rotl32(a ^ choice(d, a, b), 23);
        //d = rotl32(a ^ choice(a, b, c), 29);                        
        
        
        t = b ^ c ^ d;
        a ^= t;
        a ^= (a & t) << 1;                
        a = (a << 1) | (a >> 31); // rotl32
                
        t = a ^ c ^ d;
        b ^= t;
        b ^= (b & t) << 1;                        
        b = (b << 3) | (b >> (29));
        
        t = a ^ b ^ d;
        c ^= t;
        c ^= (c & t) << 1;        
        c = (c << 5) | (c >> (27));
        
        t = a ^ b ^ c;
        d ^= t;
        d ^= (d & t) << 1;
        d = (d << 7) | (d >> (25));                    
                        
        
        
        a ^= d ^ (b & (c ^ d)); // choice(b, c, d)
        a = (a << 11) | (a >> (21));
            
        b ^= a ^ (c & (d ^ a)); 
        b = (b << 17) | (b >> (15));
            
        c ^= b ^ (d & (a ^ b)); 
        c = (c << 23) | (c >> (9));
            
        d ^= c ^ (a & (b ^ c)); 
        d = (d << 29) | (d >> (3));     
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