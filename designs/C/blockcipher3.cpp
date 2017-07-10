#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <windows.h>
#include "Stopwatch.hpp"

#ifndef memcpy_s

#define ROTATION_AMOUNT 5
#define BIT_WIDTH 8
#define DATA_SIZE 16

typedef unsigned char WORD_TYPE;

void memcpy_s(WORD_TYPE* s1, WORD_TYPE* s2, size_t n)
{
    int index;
    for (index = 0; index < n; index++)
    {
        s1[index] = s2[index];
    }
}
#endif

void print_data(WORD_TYPE* data)
{
    int index;
    printf("\n");
    for (index = 0; index < 16; index++)
    {
        printf("%i: %i\n", index, data[index]);
    }
} 

WORD_TYPE rotate_left(WORD_TYPE word8, int amount)
{    
    return ((word8 << amount) | (word8 >> (8 - amount)));
}

WORD_TYPE rotate_right(WORD_TYPE word8, int amount)
{              
    return ((word8 >> amount) | (word8 << (8 - amount)));
}

WORD_TYPE round_function(WORD_TYPE* state, WORD_TYPE key, int left_index, int right_index)
{
    WORD_TYPE left, right;
    left = state[left_index];
    right = state[right_index];
    
    key ^= right;               
    right = rotate_left(right + key + left_index, ROTATION_AMOUNT);
    key ^= right;
    
    key ^= left;       
    left += right >> (BIT_WIDTH / 2);                
    left ^= rotate_left(right, (left_index % BIT_WIDTH) ^ ROTATION_AMOUNT);                    
    key ^= left;
    
    state[left_index] = left;
    state[right_index] = right;
    return key;    
}
    
WORD_TYPE invert_round_function(WORD_TYPE* state, WORD_TYPE key, int left_index, int right_index)
{
    WORD_TYPE left, right;
    left = state[left_index];
    right = state[right_index];
    
    key ^= left;
    left ^= rotate_left(right, (left_index % BIT_WIDTH) ^ ROTATION_AMOUNT);
    left -= right >> (BIT_WIDTH / 2);
    key ^= left;
    
    key ^= right;
    right = rotate_right(right, ROTATION_AMOUNT) - (key + left_index);
    key ^= right;
    
    state[left_index] = left;
    state[right_index] = right;
    return key;
}
        
        
void shuffle_bytes(WORD_TYPE* _state)
{
    WORD_TYPE temp[16];
    
    temp[7]  = _state[0];
    temp[12] = _state[1];
    temp[14] = _state[2];
    temp[9]  = _state[3];
    temp[2]  = _state[4];
    temp[1]  = _state[5];
    temp[5]  = _state[6];
    temp[15] = _state[7];
    temp[11] = _state[8];
    temp[6]  = _state[9];
    temp[13] = _state[10];
    temp[0]  = _state[11];
    temp[4]  = _state[12];
    temp[8]  = _state[13];
    temp[10] = _state[14];
    temp[3]  = _state[15];
    
    memcpy_s(_state, temp, 16);       
}    


int prp(WORD_TYPE* data, WORD_TYPE key, WORD_TYPE data_size)
{
    WORD_TYPE index;
    shuffle_bytes(data);
    
    for (index = data_size - 1; index != 0; index--)
    {
        key = round_function(data, key, index - 1, index);
    }       
    
    key = round_function(data, key, data_size - 1, 0);
    return key;
}
        
void prf(WORD_TYPE* data, WORD_TYPE key, WORD_TYPE data_size)
{
    WORD_TYPE index;    
    shuffle_bytes(data);
    
    for (index = data_size - 1; index != 0; index--)
    {        
        key ^= data[index]; // remove so that the first right ^ key in round_function will reinsert it        
        key = round_function(data, key, index - 1, index);        
    }
    key = round_function(data, key, data_size - 1, 0);
}
    
WORD_TYPE xor_with_key(WORD_TYPE* data, WORD_TYPE* key)
{
    WORD_TYPE data_xor = 0, index;    
    //printf("Xor with key\n");
    //print_data(key);
    for (index = 0; index < 16; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void key_schedule(WORD_TYPE* round_keys, WORD_TYPE* _key, int rounds)
{
    int index;
    WORD_TYPE key_byte, key_xor = 0;
    WORD_TYPE key[16], round_key[16];
            
    for (index = 0; index < 16; index++) // create working copy of the key
    {
        key_byte = _key[index];
        key[index] = key_byte;
        key_xor ^= key_byte;                                        
    }
    
    for (index = 0; index < rounds + 1; index++) // key schedule
    {          
        key_xor = prp(key, key_xor, 16);        
        memcpy_s(round_key, key, 16);                
        
        prf(round_key, key_xor, 16);
        memcpy_s(round_keys + (index * 16), round_key, 16);                         
    }
}
    
void encrypt(WORD_TYPE* data, WORD_TYPE* key, int rounds)
{    
    WORD_TYPE round_keys[16 * (rounds + 1)];
    WORD_TYPE round_key[16], data_xor = 0;
    int index;
    
    key_schedule(round_keys, key, rounds);
    
    for (index = 0; index < rounds; index++) // iterated even-mansour construction
    {                            
        memcpy_s(round_key, round_keys + (index * 16), 16);    
                
        data_xor = xor_with_key(data, round_key);        
        prp(data, data_xor, 16);
    }    
    memcpy_s(round_key, round_keys + (rounds * 16), 16);    
    xor_with_key(data, round_key);
    
}

void encrypt_cached_keyschedule(WORD_TYPE* data, WORD_TYPE* round_keys, int rounds)
{        
    WORD_TYPE round_key[16], data_xor = 0;
    int index;
            
    for (index = 0; index < rounds; index++) // iterated even-mansour construction
    {                            
        memcpy_s(round_key, round_keys + (index * 16), 16);    
                
        data_xor = xor_with_key(data, round_key);        
        prp(data, data_xor, 16);
    }    
    memcpy_s(round_key, round_keys + (rounds * 16), 16);    
    xor_with_key(data, round_key);    
}


void invert_shuffle_bytes(WORD_TYPE* state)
{
    unsigned char temp[16];
    
    temp[11] = state[0];
    temp[5]  = state[1];
    temp[4]  = state[2];
    temp[15] = state[3];
    temp[12] = state[4];
    temp[6]  = state[5];
    temp[9]  = state[6];
    temp[0]  = state[7];
    temp[13] = state[8];
    temp[3]  = state[9];
    temp[14] = state[10];
    temp[8]  = state[11];
    temp[1]  = state[12];
    temp[10] = state[13];
    temp[2]  = state[14];
    temp[7]  = state[15];
    
    memcpy_s(state, temp, 16);    
}
            
unsigned char invert_prp(unsigned char* data, unsigned char key, int data_size)
{       
    int index;    
    
    key = invert_round_function(data, key, data_size - 1, 0);
    
    for (index = 1; index < data_size; index++)
    {
        key = invert_round_function(data, key, index - 1, index);
    }
    invert_shuffle_bytes(data);
    return key;
}
    
void decrypt(unsigned char* data, unsigned char* key, int rounds)
{
    unsigned char round_key[16];
    unsigned char round_keys[16 * (rounds + 1)];
    unsigned char data_xor = 0;
    int index;
    
    key_schedule(round_keys, key, rounds);    
    
    memcpy_s(round_key, round_keys + (rounds * 16), 16);    
    data_xor = xor_with_key(data, round_key);         
    
    for (index = rounds; index--;)
    {           
        invert_prp(data, data_xor, 16);
        
        memcpy_s(round_key, round_keys + (index * 16), 16);                    
        data_xor = xor_with_key(data, round_key);
    }
}
  
void test_encrypt_decrypt()
{    
    unsigned char data[16], key[16], null_string[16];
    int rounds = 2;
    
    memset(null_string, 0, 16);
    memcpy_s(data, null_string, 16);       
    data[15] = 1;    
    memcpy_s(key, null_string, 16); 
    
    printf("Encrypting...\n");
    encrypt(data, key, rounds);
    
    printf("Data:\n %s\n", data);    
    print_data(data);
 //       
    decrypt(data, key, rounds);
    print_data(data);
    
    unsigned char round_keys[(rounds + 1) * 16];
    key_schedule(round_keys, key, rounds);
    
    encrypt_cached_keyschedule(data, round_keys, rounds);
    printf("Data: %s\n", data);
    print_data(data);
    
}


void test_encrypt_performance()
{        
    int rounds = 32, blocks = 65536, index, index2, test_count=1000000;    
    unsigned char key[16], data[16], round_keys[(rounds + 1) * 16];	
		
	key_schedule(round_keys, key, rounds);    
    
    Stopwatch s;    
    double timee = 0;
    for (index2 = 0; index2 < test_count; index2++)
    {
        encrypt_cached_keyschedule(data, round_keys, rounds);     
        timee += s.Lap();
    }

    
   // timee /= test_count;
    printf("\nBytes enciphered: %i bytes (%iKB) (%iMB)", test_count * 16, (test_count * 16) / 1024, ((test_count * 16) / (1024 * 1024)));
    printf("\nTime taken: %5.2f", timee);
    double bps = (test_count * 16) / timee;
	printf("\n%5.2f Bytes/second (%5.2f KB//second) (%5.2f MB/second)\n", bps, bps / 1024, bps / (1024 * 1024));
    
}   


        
        
        
        
        
    
int main()
{
   // test_encrypt_decrypt();
    test_encrypt_performance();
    return 0;
}