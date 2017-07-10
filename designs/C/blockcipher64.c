#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifndef memcpy_s
void memcpy_s(unsigned long long* s1, unsigned long long* s2, size_t n)
{
    int index;
    for (index = 0; index < n; index++)
    {
        s1[index] = s2[index];
    }
}
#endif

#define ROUNDS 16
#define DATA_SIZE 16
#define WORD_SIZE 8

void print_data(unsigned long long* data)
{
    int index;
    printf("\n");
    for (index = 0; index < DATA_SIZE; index++)
    {
        printf("%u: %u\n", index, data[index]);
    }
}   

unsigned long long rotate_left(unsigned long long word32, int amount)
{    
    return ((word32 << amount) | (word32 >> (32 - amount)));
}

unsigned long long rotate_right(unsigned long long word32, int amount)
{              
    return ((word32 >> amount) | (word32 << (32 - amount)));
}

unsigned long long bit_mixing(unsigned long long* data, int start, int direction, int size)
{
    int index, counter, next_index;
    unsigned long long key;
    index = start;
    key = 0;
    for (counter = 0; counter < size; counter++)
    {    
        next_index = (index + 1) % size;
        data[next_index] ^= rotate_left(data[index], ((index + index + 1) % 8)); 
        key ^= data[next_index];
        index += direction;
    }
    return key;
}

void shuffle_bytes(unsigned long long* _state)
{
    unsigned long long temp[16];
    
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
    
unsigned long long decorrelation_layer(unsigned long long* data, int data_size)
{    
    unsigned long long key;
    key = bit_mixing(data, 0, 1, data_size);
    shuffle_bytes(data);
    return key;
}

int prp(unsigned long long* data, unsigned long long key)
{
    unsigned long long index, data_byte;
    key = decorrelation_layer(data, DATA_SIZE);    
    for (index = 0; index < DATA_SIZE; index++)
    {    
        data_byte = data[index];
        key ^= data_byte;                               
        data[index] = rotate_left((data_byte + key + index), 20);        
        key ^= data[index]; 
    }
    return key;
}
        
int prf(unsigned long long* data, unsigned long long key)
{
    unsigned long long index, byte;
    for (index = 0; index < DATA_SIZE; index++)
    {    
        byte = rotate_left((data[index] + key + index), 20);  
        key ^= byte;
        data[index] = byte;           
    }
}
    
unsigned long long xor_with_key(unsigned long long* data, unsigned long long* key)
{
    unsigned long long data_xor = 0, index;
    for (index = 0; index < DATA_SIZE; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void key_schedule(unsigned long long* key, unsigned long long* round_keys, unsigned long long* round_key, unsigned long long key_xor, int rounds)
{        
    int index;    
    for (index = 0; index < rounds; index++)
    {          
        key_xor = prp(key, key_xor);        
        memcpy_s(round_key, key, DATA_SIZE);
                
        prf(round_key, key_xor);
        memcpy_s(round_keys + (index * DATA_SIZE), round_key, DATA_SIZE);                
    }
}  

void encrypt(unsigned long long* data, unsigned long long* _key, int rounds)
{
    unsigned long long key[DATA_SIZE];
    unsigned long long round_keys[DATA_SIZE * rounds];
    unsigned long long round_key[DATA_SIZE], key_xor = 0, data_xor = 0, key_byte;
    int index, index2;
    for (index = 0; index < DATA_SIZE; index++)
    {
        key_byte = _key[index];
        key[index] = key_byte;
        key_xor ^= key_byte;                
    }
      
    key_schedule(key, round_keys, round_key, key_xor, rounds);
          
    for (index = 0; index < rounds; index++)
    {            
        memcpy_s(round_key, round_keys + (index * DATA_SIZE), DATA_SIZE);    
    
        data_xor = xor_with_key(data, round_key); // pre-whitening
        data_xor = prp(data, data_xor); // high diffusion prp
        xor_with_key(data, round_key); // post-whitening
    }
}

void invert_shuffle_bytes(unsigned long long* state)
{
    unsigned long long temp[16];
    
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
        
unsigned long long invert_decorrelation_layer(unsigned long long* data, int data_size)
{
    invert_shuffle_bytes(data);
    return bit_mixing(data, data_size - 1, -1, data_size);
}

unsigned long long invert_prp(unsigned long long* data, unsigned long long key)
{   
    unsigned long long byte;
    int index;    
    for (index = DATA_SIZE - 1; index != -1; index--)
    {                    
        byte = data[index];
        key ^= byte;                
        data[index] = rotate_right(byte, 20) - key - index;       
        key ^= data[index];
    }
    return invert_decorrelation_layer(data, DATA_SIZE);
}
    
void decrypt(unsigned long long* data, unsigned long long* _key, int rounds)
{
    unsigned long long key[DATA_SIZE], round_key[DATA_SIZE];
    unsigned long long round_keys[DATA_SIZE * rounds];
    unsigned long long key_xor = 0, data_xor = 0, key_byte;
    int index, index2;
    for (index = 0; index < DATA_SIZE; index++)
    {
        key_byte = _key[index];
        key_xor ^= key_byte;
        key[index] = key_byte;
    }      
    
    key_schedule(key, round_keys, round_key, key_xor, rounds);
    
    for (index = rounds; index--;)
    {            
        memcpy_s(round_key, round_keys + (index * DATA_SIZE), DATA_SIZE);
        
        data_xor = xor_with_key(data, round_key);         
        data_xor = invert_prp(data, data_xor);
        xor_with_key(data, round_key);
    }
}
        
void test_encrypt_decrypt()
{    
    unsigned long long data[DATA_SIZE], key[DATA_SIZE], null_string[DATA_SIZE], data_xor;
    int rounds = 16, index;
    
    memset(null_string, 0, DATA_SIZE * WORD_SIZE);
    memcpy_s(data, null_string, DATA_SIZE);       
    data[15] = 1;    
    memcpy_s(key, null_string, DATA_SIZE); 
    
    encrypt(data, key, rounds);
    printf("Data:\n %s", data);
    
    decrypt(data, key, rounds);
    print_data(data);
}

void main()
{
    test_encrypt_decrypt();    
}