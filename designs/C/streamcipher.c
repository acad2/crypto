#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define WORDSIZE unsigned long long
#define WORDSIZE_BITS 64
#define ROTATIONS 40
#define PRINT_STRING "%i: %016llX\n"

#ifndef memcpy_s
void memcpy_s(WORDSIZE* s1, WORDSIZE* s2, size_t n)
{
    unsigned int index;
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

WORDSIZE shuffle_bytes(WORDSIZE* _state)
{
    WORDSIZE temp[16];
    WORDSIZE key = 0, index, data_byte;
    
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
    
    for (index = 0; index < 16; index++)
    {
        data_byte = temp[index];
        key ^= data_byte;
        _state[index] = data_byte;
    }
    //memcpy_s(_state, temp, 16);   
    return key;    
    
}    
    
int prp(WORDSIZE* data, WORDSIZE data_size)
{
    WORDSIZE index, _index, left, right, key;    
    key = shuffle_bytes(data);
    
    key ^= data[0];
    data[0] = data[0] + key;
    key ^= data[0];
    
    for (index = 0; index < data_size; index++)
    {    
        _index = (index + 1) % 16;
        
        right = data[_index];
        
        key ^= right;
        right = rotate_left((right + key + index), ROTATIONS);
        key ^= right;
        
        data[_index] = right;        
        left = data[index];
        
        key ^= left;
        left = (left + (right >> (WORDSIZE_BITS / 2)));
        left ^= rotate_left(right, ROTATIONS);
        key ^= left;
        data[index] = left;
    }
    return key;
}
        
void prf(WORDSIZE* data, WORDSIZE key, WORDSIZE data_size)
{
    WORDSIZE index, byte;
    for (index = 0; index < data_size; index++)
    {    
        byte = rotate_left((data[index] + key + index), ROTATIONS);  
        key ^= byte;
        data[index] = byte;           
    }
}
    
void xor_with_key(WORDSIZE* data, WORDSIZE* key)
{
    WORDSIZE index;
    for (index = 0; index < 16; index++)
    {           
        data[index] ^= key[index];        
    }        
}

void stream_cipher(WORDSIZE* data, WORDSIZE* _seed, WORDSIZE* _key, unsigned long blocks)
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
            
        xor_with_key(seed, round_key);                      
        data_xor = prp(seed, 16); 
        prf(seed, data_xor, 16);
        xor_with_key(seed, round_key);
               
        
        xor_with_key(data + (index * 16), seed);
    }
}
  
void encrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* seed, unsigned long data_size)
{    
    unsigned long blocks, extra;    
    blocks = data_size / 16;
    extra = data_size % 16;
    if (extra)
    {
        blocks += 1;
    }
    stream_cipher(data, seed, key, blocks);
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
    //data[15] = 1;
    memcpy_s(plaintext, data, 16);
    memcpy_s(key, null_string, 16); 
    memcpy_s(seed, null_string, 16);
    
    //WORDSIZE xor;
    //xor = prp(data, 16);
    //prf(data, xor, 16);
    //printf("Data:%u \n%s\n", xor, data);
    //print_data(data);
    encrypt(data, key, seed, 16);
    
    printf("Ciphertext:\n %s\n", data);    
    print_data(data);
        
    decrypt(data, key, seed, 16);
    printf("Decrypted:\n");
    print_data(data);
}

int main()
{
    test_encrypt_decrypt();    
    return 0;
}