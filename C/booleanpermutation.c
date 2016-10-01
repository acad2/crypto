#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "constructions.c"

#define WORDSIZE16 unsigned short
#define WORDSIZE64 unsigned long long
#define ROUNDS 16

inline WORDSIZE16 rotl16(WORDSIZE16 word, unsigned char amount){return (word << amount) | (word >> (16 - amount));}
inline WORDSIZE64 choice(WORDSIZE64 a, WORDSIZE64 b, WORDSIZE64 c){return c ^ (a & (b ^ c));} 
           
void permutation(WORDSIZE64* _state)
{           
    WORDSIZE64 a, b, c, d;
    a = _state[0];
    b = _state[1];
    c = _state[2];
    d = _state[3];
        
    a ^= choice(b, c, d);
    b ^= choice(c, d, a);
    c ^= choice(d, a, b);
    d ^= choice(a, b, c);   
    
    _state[0] = a;
    _state[1] = b;
    _state[2] = c;
    _state[3] = d;

    WORDSIZE16 * state = (WORDSIZE16*)_state;
    
    WORDSIZE16 temp = 0;
    temp = state[0];

    state[0]  = rotl16(state[11], 11);
    state[11] = rotl16(state[8] , 8 );
    state[8]  = rotl16(state[13], 13);
    state[13] = rotl16(state[10], 10);
    state[10] = rotl16(state[14], 14);
    state[14] = rotl16(state[2] , 2 );
    state[2]  = rotl16(state[4] , 4 );
    state[4]  = rotl16(state[12], 12);
    state[12] = rotl16(state[1] , 1 );
    state[1]  = rotl16(state[5] , 5 );
    state[5]  = rotl16(state[6] , 6 );
    state[6]  = rotl16(state[9] , 9 );
    state[9]  = rotl16(state[3] , 3 );
    state[3]  = rotl16(state[15], 15);
    state[15] = rotl16(state[7] , 7 );
    state[7]  = rotl16(temp     , 0 );          
}            

void cipher_encrypt(WORDSIZE64* message, WORDSIZE64* key)
{
    int size = 4;
    WORDSIZE64 round_keys[size * ROUNDS];    
    
    key_schedule(&permutation, key, round_keys, ROUNDS, size);        
    key_alternating_cipher(&permutation, round_keys, message, ROUNDS, size);
}    

// end of cipher code. begin testing + visualization stuff  
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c"
#define WORD_TO_BINARY(byte)  \
  (byte & 0x8000 ? '1' : '0'), \
  (byte & 0x4000 ? '1' : '0'), \
  (byte & 0x2000 ? '1' : '0'), \
  (byte & 0x1000 ? '1' : '0'), \
  (byte & 0x0800 ? '1' : '0'), \
  (byte & 0x0400 ? '1' : '0'), \
  (byte & 0x0200 ? '1' : '0'), \
  (byte & 0x0100 ? '1' : '0'), \
  (byte & 0x0080 ? '1' : '0'), \
  (byte & 0x0040 ? '1' : '0'), \
  (byte & 0x0020 ? '1' : '0'), \
  (byte & 0x0010 ? '1' : '0'), \
  (byte & 0x0008 ? '1' : '0'), \
  (byte & 0x0004 ? '1' : '0'), \
  (byte & 0x0002 ? '1' : '0'), \
  (byte & 0x0001 ? '1' : '0') 
  
void print_state_16x16(WORDSIZE16* state)
{       
    unsigned short* _shorts = (unsigned short*)state;
    int index;
    for (index = 0; index < 16; index++)
    {
        printf(BYTE_TO_BINARY_PATTERN "\n", WORD_TO_BINARY(_shorts[index]));
    }
}

void test_shuffle_and_shift()
{    
    WORDSIZE16 inputs[16];    
    inputs[0]  = 1;
    inputs[1]  = 0;
    inputs[2]  = 0;
    inputs[3]  = 0;
              
    inputs[4]  = 0;
    inputs[5]  = 0;
    inputs[6]  = 0;
    inputs[7]  = 0;
              
    inputs[8]  = 0;
    inputs[9]  = 0;
    inputs[10] = 0;
    inputs[11] = 0;
    
    inputs[12] = 0;
    inputs[13] = 0;
    inputs[14] = 0;
    inputs[15] = 0;
    
    printf("Testing round function diffusion:\n");
    print_state_16x16(inputs);
    printf("\n");
    int round;    
    for (round = 0; round < 16; round++)
    {        
        unsigned long long* _inputs = (unsigned long long*)inputs;
        permutation(_inputs);
        print_state_16x16(inputs);
        printf("\nEnd of Round: %i\n", round);
    }   
}        

void test_encrypt_performance() {
	WORDSIZE64 message[4], key[4];
    memset(message, 0, 4);
    memset(key, 0, 4);
    key[0] = 1;
  		
    WORDSIZE64 index, measurements = (1024 * 1024 * 1024) / 256;
    clock_t begin = clock();
	for (index = 0; index < measurements; index++) 
    {
	    cipher_encrypt(message, key);    
        //permutation(message);
	}        	    
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
}

int main()
{
    //test_shuffle_and_shift();
    test_encrypt_performance();
    return 0;
}
