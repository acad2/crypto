#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifndef memcpy_s
void memcpy_s(unsigned int* s1, unsigned int* s2, size_t n)
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
#define WORD_SIZE 4

void print_data(unsigned int* data)
{
    int index;
    printf("\n");
    for (index = 0; index < DATA_SIZE; index++)
    {
        printf("%u: %u\n", index, data[index]);
    }
}   

unsigned int rotate_left(unsigned int word32, int amount)
{    
    return ((word32 << amount) | (word32 >> (32 - amount)));
}

unsigned int rotate_right(unsigned int word32, int amount)
{              
    return ((word32 >> amount) | (word32 << (32 - amount)));
}

int prp(unsigned int* data, unsigned int key)
{
    unsigned int index, data_byte;
    for (index = 0; index < DATA_SIZE; index++)
    {    
        data_byte = data[index];
        key ^= data_byte;                               
        data[index] = rotate_left((data_byte + key + index), 20);        
        key ^= data[index]; 
    }
    return key;
}
        
int prf(unsigned int* data, unsigned int key)
{
    unsigned int index, byte;
    for (index = 0; index < DATA_SIZE; index++)
    {    
        byte = rotate_left((data[index] + key + index), 20);  
        key ^= byte;
        data[index] = byte;           
    }
}
    
unsigned int xor_with_key(unsigned int* data, unsigned int* key)
{
    unsigned int data_xor = 0, index;
    for (index = 0; index < DATA_SIZE; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void encrypt(unsigned int* data, unsigned int* _key, int rounds)
{
    unsigned int key[DATA_SIZE];
    unsigned int round_keys[DATA_SIZE * rounds];
    unsigned int round_key[DATA_SIZE], key_xor = 0, data_xor = 0, key_byte;
    int index, index2;
    for (index = 0; index < DATA_SIZE; index++)
    {
        key_byte = _key[index];
        key[index] = key_byte;
        key_xor ^= key_byte;                
    }
        
    for (index = 0; index < rounds; index++)
    {          
        key_xor = prp(key, key_xor);        
        memcpy_s(round_key, key, DATA_SIZE);
                
        prf(round_key, key_xor);
        memcpy_s(round_keys + (index * DATA_SIZE), round_key, DATA_SIZE);                
    }
        
    for (index = 0; index < rounds; index++)
    {            
        memcpy_s(round_key, round_keys + (index * DATA_SIZE), DATA_SIZE);    
    
        data_xor = xor_with_key(data, round_key); // pre-whitening
        data_xor = prp(data, data_xor); // high diffusion prp
        xor_with_key(data, round_key); // post-whitening
    }
}

unsigned int invert_prp(unsigned int* data, unsigned int key)
{   
    unsigned int byte;
    int index;    
    for (index = DATA_SIZE - 1; index != -1; index--)
    {                    
        byte = data[index];
        key ^= byte;                
        data[index] = rotate_right(byte, 20) - key - index;       
        key ^= data[index];
    }
    return key;
}
    
void decrypt(unsigned int* data, unsigned int* _key, int rounds)
{
    unsigned int key[DATA_SIZE], round_key[DATA_SIZE];
    unsigned int round_keys[DATA_SIZE * rounds];
    unsigned int key_xor = 0, data_xor = 0, key_byte;
    int index, index2;
    for (index = 0; index < DATA_SIZE; index++)
    {
        key_byte = _key[index];
        key_xor ^= key_byte;
        key[index] = key_byte;
    }      
    
    for (index = 0; index < rounds; index++)
    {          
        key_xor = prp(key, key_xor);        
        memcpy_s(round_key, key, DATA_SIZE);
                
        prf(round_key, key_xor);
        memcpy_s(round_keys + (index * DATA_SIZE), round_key, DATA_SIZE);                
    }
        
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
    unsigned int data[DATA_SIZE], key[DATA_SIZE], null_string[DATA_SIZE], data_xor;
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