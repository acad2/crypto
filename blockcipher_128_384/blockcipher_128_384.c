/* Straightforward C implementation of the following design:
    
    - 384 bit master key
        - No key schedule algorithm
        - Master key is divided into 3 128-bit keys (key0, key1, key2)
    - Add key0, iterate permutation, add key1, iterate permutation, add key2
        - Deviates from key alternating cipher pattern of add key, permute, add key permute ...
        - permutation can stick to registers and avoid memory accesses
    - Add key consists of two stages
        - linear combination of the key with the message via xor
        - nonlinear usage of the key, by shuffling bits with the boolean choice function (the choice_swap and shuffle_words functions)
    - permutation operates on 4 32-bit words
        - The target word has added to it the xor sum of the other 3 words
            - Incorporates maximum number of terms into the addition operation
            - Increases number of active bits
        - The target word is rotated by rotate_amount1
            - a XOR b only operates on 2 1-bit registers at a time (vectorized in a 32-bit register)
            - A bit at index I in word a only influences a bit at index I in word b
            - a + b mostly operates the same way, with the possibility to spill over into the register on the left
            - rotations increase number of active bits
        - The target word (a) has added to it the result of choice(b, c, d)
            - The choice function: "if b: then return c; else return d;"
            - Selects bits from c or d based on b
            - increases number of active bits
        - The target word is rotated by rotate_amount2
            - increases number of active bits        
        - minimum number of active bits after 1 round was found to be 12 
        - minimum number of active bits after 2 rounds was found to be 40
            - Non exhaustive testing, limited by low computing power
    - choice_swap function uses the key to partition two words, a and b, into two new words, _a and _b, using the boolean choice function
        - _a and _b will consist of approximately 16 bits (50%) from both a and b if the key used to select is random
        - Is an involution
    - shuffle words uses choice_swap to mix each of the 4 input words together, based on the current key        
        - choice_swap on (a, b) and choice_swap on (c, d) could conceivably be done in parallel
        - Each output word should consist of about 1/4 of the bits from each input word, if the key is random          
        
    Gets about 40MB/s on an Intel Celeron N2830 2.16GHz
*/  
#define WORDSIZE unsigned long
#define ITERATIONS 12
#define KEY_COUNT 3

#define rotate_left(x, amount)((x << amount | (x >> (32 - amount))))
    
#define choice(a, b, c)((c ^ (a & (b ^ c))))

#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}\
})    
    
#define store(data, a, b, c, d)\
    ({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load(data, a, b, c, d)\
    ({a = data[0]; b = data[1]; c = data[2]; d=data[3];}) 
    
#define nonlinear_mixing(a, b, c, d, rotate_amount1, rotate_amount2)({\
    a += b ^ c ^ d;\
    a = rotate_left(a, rotate_amount1);\
    a ^= choice(b, c, d);\
    a = rotate_left(a, rotate_amount2);})
    
#define permutation(a, b, c, d)({\
    nonlinear_mixing(a, b, c, d, 1, 11);\
    nonlinear_mixing(b, c, d, a, 2, 7);\
    nonlinear_mixing(c, d, a, b, 3, 15);\
    nonlinear_mixing(d, a, b, c, 5, 17);})                                                                                                
            
#define choice_swap(key, a, b)({\
    _t = a;\
    a = choice(key, a, b);\
    b = choice(key, b, _t);})
    
#define shuffle_words(a, b, c, d, key, key_number)({\
    choice_swap(key[(4 * key_number) + 0], a, b);\
    choice_swap(key[(4 * key_number) + 1], c, d);\
    choice_swap(key[(4 * key_number) + 2], a, c);\
    choice_swap(key[(4 * key_number) + 3], b, d);})   
            
#define add_key(a, b, c, d, keys, key_number)({\
    a ^= keys[(4 * key_number) + 0];\
    b ^= keys[(4 * key_number) + 1];\
    c ^= keys[(4 * key_number) + 2];\
    d ^= keys[(4 * key_number) + 3];})       
        
void encrypt(WORDSIZE* data, WORDSIZE* key)
{           
    WORDSIZE a, b, c, d, _t;
    load(data, a, b, c, d);        
    
    add_key(a, b, c, d, key, 0);    
    shuffle_words(a, b, c, d, key, 0);    
    
    iterate(permutation, a, b, c, d, ITERATIONS);
    add_key(a, b, c, d, key, 1);
    
    iterate(permutation, a, b, c, d, ITERATIONS);    
    add_key(a, b, c, d, key, 2);
    
    shuffle_words(a, b, c, d, key, 2);
    
    store(data, a, b, c, d);
}