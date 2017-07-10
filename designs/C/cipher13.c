#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int xor_subroutine(unsigned char* state, unsigned char* state2)
{
    unsigned int index;
    for (index = 0; index < 16; index++)
    {
        state[index] ^= state2[index];
    }
}

int xor_sum(unsigned char* state)
{
    unsigned int output = 0;
    unsigned int index;
    for (index = 0; index < 16; index++)
    {
        output ^= state[index];        
    }
    return output;
}
    
unsigned char rotate_left(unsigned char x, unsigned char r)
{        
    return ((x << r) | (x >> (8 - r))) & 255;  
}

unsigned char rotate_right(unsigned char x, unsigned char r)
{        
    return ((x >> r) | (x << (8 - r))) & 255;  
}

int shuffle_bytes(unsigned char* state)   
{
    unsigned char temp[16];
    int index;
    
    temp[7]  = state[0];
    temp[12] = state[1];
    temp[14] = state[2];
    temp[9]  = state[3];
    temp[2]  = state[4];
    temp[1]  = state[5];
    temp[5]  = state[6];
    temp[15] = state[7];
    temp[11] = state[8];
    temp[6]  = state[9];
    temp[13] = state[10];
    temp[0]  = state[11];
    temp[4]  = state[12];
    temp[8]  = state[13];
    temp[10] = state[14];
    temp[3]  = state[15];
    
    memcpy(state, temp, 16);
}
        
int p_box(unsigned char* state, unsigned char decryption_flag)
{
    unsigned char output[16], byte;
    int index, index2;
        
    for (index = 0; index < 8; index++)
    {
        output[index] = 0;
        for (index2 = 0; index2 < 8; index2++)
        {
            byte = state[index2];                      
            output[index] |= ((byte & 1) << index2) & 255;                 
            state[index2] = rotate_right(byte, 1);               
        }   
        if (decryption_flag == 0)
        {
            output[index + 8] = rotate_right(state[index + 8], 1);
        }
        else
        {
            output[index + 8] = rotate_left(state[index + 8], 1);
        }
    }
    memcpy(state, output, 16);     
}    
                
int test_p_box()
{
    unsigned char state[16], index;
    for (index = 0; index < 16; index++)
    {
        state[index] = index;
    }
    
    print_state(state);
    p_box(state, 0);
    print_state(state);
    p_box(state, 1);
    print_state(state);
}

unsigned char permute(unsigned char* state, unsigned char round_key, unsigned char key_byte, unsigned char left_index, unsigned char right_index)
{
    unsigned char left, right;
    left = state[left_index];
    right = state[right_index];
    
    round_key ^= left ^ right;
    
    right = (right + round_key + key_byte) & 255;
    left = (left + (right >> 4)) & 255;
    left ^= rotate_left(right, 5);
    
    round_key ^= left ^ right;
    state[left_index] = left;
    state[right_index] = right;
    return round_key;
}
                
int encrypt(unsigned char* state, unsigned char* key, unsigned int rounds)
{
    unsigned int round, index, left, right, round_key;
    
    xor_subroutine(state, key);           
    for (round=0; round < rounds; round++)
    {
        p_box(state, 0);                
        shuffle_bytes(state);                
        round_key = xor_sum(state);      
        for (index=15; index > 0; index--)
        {
            round_key = permute(state, round_key, key[index], index - 1, index);            
        }
        permute(state, round_key, key[0], 15, 0);
    }
    xor_subroutine(state, key); 
}  

unsigned char invert_permute(unsigned char* state, unsigned char round_key, unsigned char key_byte, unsigned int left_index, unsigned int right_index)
{   
    unsigned char left, right;
    left = state[left_index];
    right = state[right_index];
    round_key ^= left ^ right;
    
    left ^= rotate_left(right, 5);
    left = (256 + (left - (right >> 4))) % 256;
    right = (256 + (right - round_key - key_byte)) % 256;
    
    round_key ^= left ^ right;
    state[left_index] = left;
    state[right_index] = right;
    return round_key;
}
 
int invert_shuffle_bytes(unsigned char* state)
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
        
    memcpy(state, temp, 16);
}   
    
int decrypt(unsigned char* state, unsigned char* key, unsigned int rounds)
{
    unsigned int round, index, left, right, round_key;
    xor_subroutine(state, key);
    for (round=0; round < rounds; round++)
    {    
        round_key = xor_sum(state);
        round_key = invert_permute(state, round_key, key[0], 15, 0);    
        for (index=1; index < 16; index++)
        {
            round_key = invert_permute(state, round_key, key[index], index - 1, index);
        }
        
        invert_shuffle_bytes(state);        
        p_box(state, 1);         
    }        
    xor_subroutine(state, key);
}

int print_state(unsigned char* state)
{
    int index;
    for (index = 0; index < 16; index++)
    {
        printf("%i: %i\n", index, state[index]);
    }
}

int main()
{
    unsigned char data[16] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    unsigned char key[16] = {0xe9, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01};
    int rounds = 10;
        
    //test_p_box();
    
    printf("Before: %s\n", data);
    print_state(data);
    encrypt(data, key, rounds);
    printf("After: %s\n", data);
    print_state(data);
    
    decrypt(data, key, rounds);
    printf("After decryption: %s\n", data);
    print_state(data); 
    
        clock_t start, end;
    double cpu_time_used;
    int index;
    
    while(1){
        start = clock();    
        for (index = 0; index < 64; index++)
        {
            encrypt(data, key, rounds);   
        }
        end = clock();
        cpu_time_used =  ((double) (end - start)) / CLOCKS_PER_SEC;
        printf("Time taken: %f\n", cpu_time_used);}    
}