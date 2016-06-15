#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define WORDSIZE unsigned char
#define WORDSIZE_BITS 8
#define ROTATIONS 5
#define PRINT_STRING "%i: %i\n"

#ifndef memcpy_s
void memcpy_s(WORDSIZE* s1, WORDSIZE* s2, size_t n)
{
    int index;
    for (index = 0; index < n; index++)
    {
        s1[index] = s2[index];
    }
}
#endif

void print_data(WORDSIZE* data)
{
    int index;
    printf("\n");
    for (index = 0; index < 16; index++)
    {
        printf(PRINT_STRING, index, data[index]);
    }
} 

WORDSIZE rotate_left(WORDSIZE word, int amount)
{    
    return ((word << amount) | (word >> (WORDSIZE_BITS - amount)));
}

WORDSIZE bit_mixing(WORDSIZE* data, int start, int direction, int size)
{
    int index, counter, next_index;
    WORDSIZE key;
    index = start;
    key = 0;
    for (counter = 0; counter < size; counter++)
    {    
        next_index = (index + 1) % size;
        data[next_index] ^= rotate_left(data[index], ((index + index + 1) % WORDSIZE_BITS)); 
        key ^= data[next_index];
        index += direction;
    }
    return key;
}

void shuffle_bytes(WORDSIZE* _state)
{
    WORDSIZE temp[16];
    
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
    
WORDSIZE decorrelation_layer(WORDSIZE* data, int data_size)
{    
    WORDSIZE key;
    key = bit_mixing(data, 0, 1, data_size);
    shuffle_bytes(data);
    return key;
}

int prp(WORDSIZE* data, WORDSIZE data_size)
{
    WORDSIZE index, data_byte, key;
    key = decorrelation_layer(data, data_size);
    
    for (index = 0; index < data_size; index++)
    {    
        data_byte = data[index];
        key ^= data_byte;                       
        data[index] = rotate_left((data_byte + key + index), ROTATIONS);        
        key ^= data[index]; 
    }
    return key;
}
        
int prf(WORDSIZE* data, WORDSIZE key, WORDSIZE data_size)
{
    WORDSIZE index, byte;
    for (index = 0; index < data_size; index++)
    {    
        byte = rotate_left((data[index] + key + index), ROTATIONS);  
        key ^= byte;
        data[index] = byte;           
    }
}
    
WORDSIZE xor_with_key(WORDSIZE* data, WORDSIZE* key)
{
    WORDSIZE data_xor = 0, index;
    for (index = 0; index < 16; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void stream_cipher(WORDSIZE* data, WORDSIZE* _seed, WORDSIZE* _key, WORDSIZE* output, unsigned long blocks)
{
    WORDSIZE key[16], round_key[16], seed[16];    
    WORDSIZE key_xor = 0, data_xor = 0;
    unsigned long index;
    for (index = 0; index < 16; index++) // create working copy of the key/seed
    {        
        key[index] = _key[index];
        seed[index] = _seed[index];             
    }                 
    
    for (index = 0; index < blocks; index++)
    {            
        key_xor = prp(key, 16); 
        memcpy_s(round_key, key, 16);
        prf(round_key, key_xor, 16);        
            
        data_xor = xor_with_key(seed, round_key);                      
        prf(seed, data_xor, 16); 
        xor_with_key(seed, round_key);
               
        
        xor_with_key(data + (index * 16), seed);
    }
}
  
void encrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* seed, unsigned long data_size)
{
    WORDSIZE* key_material;
    unsigned long blocks, extra;
    key_material = malloc(data_size);
    blocks = data_size / 16;
    extra = data_size % 16;
    if (extra)
    {
        blocks += 1;
    }
    stream_cipher(data, seed, key, key_material, blocks);
}

void decrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* seed, unsigned long data_size)
{
    encrypt(data, key, seed, data_size);
}

void test_encrypt_decrypt()
{    
    WORDSIZE data[16], key[16], plaintext[16], null_string[16], seed[16];    
    
    memset(null_string, 0, 16);
    memcpy_s(data, null_string, 16);       
    data[15] = 1;
    memcpy_s(plaintext, data, 16);
    memcpy_s(key, null_string, 16); 
    memcpy_s(seed, null_string, 16);
    
    printf("Plaintext:\n");
    print_data(data);
    encrypt(data, key, seed, 16);
    
    printf("Ciphertext:\n %s\n", data);    
    print_data(data);
        
    decrypt(data, key, seed, 16);
    printf("Decrypted:\n");
    print_data(data);
}

void main()
{
    test_encrypt_decrypt();    
}