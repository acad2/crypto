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

void memcpy_s(unsigned char* s1, unsigned char* s2, size_t n)
{
    int index;
    for (index = 0; index < n; index++)
    {
        s1[index] = s2[index];
    }
}
#endif

void print_data(unsigned char* data)
{
    int index;
    printf("\n");
    for (index = 0; index < 16; index++)
    {
        printf("%i: %i\n", index, data[index]);
    }
} 

unsigned char rotate_left(unsigned char word8, int amount)
{    
    return ((word8 << amount) | (word8 >> (8 - amount)));
}

unsigned char rotate_right(unsigned char word8, int amount)
{              
    return ((word8 >> amount) | (word8 << (8 - amount)));
}

unsigned char round_function(unsigned char* state, unsigned char key, int left_index, int right_index)
{
    unsigned char left, right;
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
    
unsigned char invert_round_function(unsigned char* state, unsigned char key, int left_index, int right_index)
{
    unsigned char left, right;
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
        
        
void shuffle_bytes(unsigned char* _state)
{
    unsigned char temp[16];
    
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


int prp(unsigned char* data, unsigned char key, unsigned char data_size)
{
    unsigned char index;
    shuffle_bytes(data);
    
    for (index = data_size - 1; index != 0; index--)
    {
        key = round_function(data, key, index - 1, index);
    }       
    
    key = round_function(data, key, data_size - 1, 0);
    return key;
}
        
void prf(unsigned char* data, unsigned char key, unsigned char data_size)
{
    unsigned char index;    
    shuffle_bytes(data);
    
    for (index = data_size - 1; index != 0; index--)
    {        
        key ^= data[index]; // remove so that the first right ^ key in round_function will reinsert it        
        key = round_function(data, key, index - 1, index);        
    }
    key = round_function(data, key, data_size - 1, 0);
}
    
unsigned char xor_with_key(unsigned char* data, unsigned char* key)
{
    unsigned char data_xor = 0, index;    
    //printf("Xor with key\n");
    //print_data(key);
    for (index = 0; index < 16; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void key_schedule(unsigned char* round_keys, unsigned char* _key, int rounds)
{
    int index;
    unsigned char key_byte, key_xor = 0;
    unsigned char key[16], round_key[16];
            
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
    
void encrypt(unsigned char* data, unsigned char* key, int rounds)
{    
    unsigned char round_keys[16 * (rounds + 1)];
    unsigned char round_key[16], data_xor = 0;
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

void encrypt_cached_keyschedule(unsigned char* data, unsigned char* round_keys, int rounds)
{        
    unsigned char round_key[16], data_xor = 0;
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


void invert_shuffle_bytes(unsigned char* state)
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
    int rounds = 8, blocks = 65536, index, index2;    
    unsigned char key[16], round_keys[(rounds + 1) * 16];
    
	WORD_TYPE* data = (WORD_TYPE*)malloc(DATA_SIZE * blocks * sizeof(WORD_TYPE));
	WORD_TYPE* plaintext = (WORD_TYPE*)malloc(DATA_SIZE * blocks * sizeof(WORD_TYPE));

	// setup test data
	memset(data, 16, DATA_SIZE * blocks * sizeof(WORD_TYPE));
	memcpy(plaintext, data, sizeof(data));
	memset(key, 1, sizeof(key));
	
	key_schedule(round_keys, key, rounds);    
    
    Stopwatch s;    
    double timee = 0;
    for (index2 = 0; index2 < 10; index2++)
    {
        for (index = 0; (index * 16) < DATA_SIZE * blocks * sizeof(WORD_TYPE); index++)
        {        
            encrypt_cached_keyschedule(data + (index * 16), round_keys, rounds);
        }
        timee += s.Lap();
                    
    }
    timee /= 10;
    printf("Time taken: %5.2f\n", timee);
    //double bps = (16.0 * 65536.0) / timee;
    //printf("mbps: %5.2f\n", bps / 1024.0 / 1024.0);
    double mbps = 1.0 / timee;
	printf("mbps: %5.2f\n", mbps);
    
}   


        
        
        
        
        
    
int main()
{
   // test_encrypt_decrypt();
    test_encrypt_performance();
    return 0;
}