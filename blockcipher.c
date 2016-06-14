#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifndef memcpy_s
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

unsigned char bit_mixing(unsigned char* data, int start, int direction, int size)
{
    int index, counter, next_index;
    unsigned char key;
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
    
unsigned char decorrelation_layer(unsigned char* data, int data_size)
{    
    unsigned char key;
    key = bit_mixing(data, 0, 1, data_size);
    shuffle_bytes(data);
    return key;
}

int prp(unsigned char* data, unsigned char key, unsigned char data_size)
{
    unsigned char index, data_byte;
    key = decorrelation_layer(data, data_size);
    
    for (index = 0; index < data_size; index++)
    {    
        data_byte = data[index];
        key ^= data_byte;                       
        data[index] = rotate_left((data_byte + key + index), 5);        
        key ^= data[index]; 
    }
    return key;
}
        
int prf(unsigned char* data, unsigned char key, unsigned char data_size)
{
    unsigned char index, byte;
    for (index = 0; index < data_size; index++)
    {    
        byte = rotate_left((data[index] + key + index), 5);  
        key ^= byte;
        data[index] = byte;           
    }
}
    
unsigned char xor_with_key(unsigned char* data, unsigned char* key)
{
    unsigned char data_xor = 0, index;
    for (index = 0; index < 16; index++)
    {           
        data[index] ^= key[index];
        data_xor ^= data[index];
    }    
    return data_xor;
}

void encrypt(unsigned char* data, unsigned char* _key, int rounds)
{
    unsigned char key[16];
    unsigned char round_keys[16 * rounds];
    unsigned char round_key[16], key_xor = 0, data_xor = 0, key_byte;
    int index;
    for (index = 0; index < 16; index++) // create working copy of the key
    {
        key_byte = _key[index];
        key[index] = key_byte;
        key_xor ^= key_byte;                                        
    }
        
    for (index = 0; index < rounds; index++) // key schedule
    {          
        key_xor = prp(key, key_xor, 16);        
        memcpy_s(round_key, key, 16);        
        
        prf(round_key, key_xor, 16);
        memcpy_s(round_keys + (index * 16), round_key, 16);                
    }
        
    for (index = 0; index < rounds; index++)
    {            
        memcpy_s(round_key, round_keys + (index * 16), 16);    
    
        data_xor = xor_with_key(data, round_key); // pre-whitening
        data_xor = prp(data, data_xor, 16); // high diffusion prp
        xor_with_key(data, round_key); // post-whitening
    }
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
        
unsigned char invert_decorrelation_layer(unsigned char* data, int data_size)
{
    invert_shuffle_bytes(data);
    return bit_mixing(data, data_size - 1, -1, data_size);
}
    
unsigned char invert_prp(unsigned char* data, unsigned char key, int data_size)
{   
    unsigned char data_byte;
    int index;    
    for (index = data_size - 1; index != -1; index--)
    {                    
        data_byte = data[index];
        key ^= data_byte;                
        data[index] = rotate_right(data_byte, 5) - key - index;       
        key ^= data[index];
    }
    return invert_decorrelation_layer(data, data_size);    
}
    
void decrypt(unsigned char* data, unsigned char* _key, int rounds)
{
    unsigned char key[16], round_key[16];
    unsigned char round_keys[16 * rounds];
    unsigned char key_xor = 0, data_xor = 0, key_byte;
    int index;
    for (index = 0; index < 16; index++)
    {
        key_byte = _key[index];
        key_xor ^= key_byte;
        key[index] = key_byte;                
    }      
    
    for (index = 0; index < rounds; index++)
    {          
        key_xor = prp(key, key_xor, 16);        
        memcpy_s(round_key, key, 16);
                
        prf(round_key, key_xor, 16);
        memcpy_s(round_keys + (index * 16), round_key, 16);                
    }
        
    for (index = rounds; index--;)
    {            
        memcpy_s(round_key, round_keys + (index * 16), 16);
        
        data_xor = xor_with_key(data, round_key);         
        data_xor = invert_prp(data, data_xor, 16);
        xor_with_key(data, round_key);
    }
}
  
void test_encrypt_decrypt()
{    
    unsigned char data[16], key[16], plaintext[16], null_string[16];
    int rounds = 16, index;
    
    memset(null_string, 0, 16);
    memcpy_s(data, null_string, 16);       
    data[15] = 1;
    memcpy_s(plaintext, data, 16);
    memcpy_s(key, null_string, 16); 
    
    encrypt(data, key, rounds);
    
    printf("Data:\n %s\n", data);    
    print_data(data);
 //       
    decrypt(data, key, rounds);
    print_data(data);
}

void main()
{
    test_encrypt_decrypt();    
}