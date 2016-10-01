#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
    r %= 8;
    return ((x << r) | (x >> (8 - r))) & 255;  
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
        
int p_box(unsigned char* state)
{
    unsigned char temp[8];
    int index;
    
    temp[0] = ((state[0] & 1) | ((state[1] & 1) << 1) | ((state[2] & 1) << 2) | ((state[3] & 1) << 3) |
              ((state[4] & 1) << 4) | ((state[5] & 1) << 5) | ((state[6] & 1) << 6) | ((state[7] & 1) << 7));
    
    temp[1] = (((state[0] & 2) >> 1) | (state[1] & 2) | ((state[2] & 2) << 1) | ((state[3] & 2) << 2) |
               ((state[4] & 2) << 3) | ((state[5] & 2) << 4) | ((state[6] & 2) << 5) | ((state[7] & 2) << 6));
              
    temp[2] = (((state[0] & 4) >> 2) | ((state[1] & 4) >> 1) | (state[2] & 4) | ((state[3] & 4) << 1) |
               ((state[4] & 4) << 2) | ((state[5] & 4) << 3) | ((state[6] & 4) << 4) | ((state[7] & 4) << 5));             
    
    temp[3] = (((state[0] & 8) >> 3)| ((state[1] & 8) >> 2) | ((state[2] & 8) >> 1) | (state[3] & 8) |
               ((state[4] & 8) << 1) | ((state[5] & 8) << 2) | ((state[6] & 8) << 3) | ((state[7] & 8) << 4));

    temp[4] = (((state[0] & 16) >> 4) | ((state[1] & 16) >> 3) | ((state[2] & 16) >> 2) | ((state[3] & 16) >> 1) |
                (state[4] & 16) | ((state[5] & 16) << 1) | ((state[6] & 16) << 2) | ((state[7] & 16) << 3));

    temp[5] = (((state[0] & 32) >> 5) | ((state[1] & 32) >> 4) | ((state[2] & 32) >> 3) | ((state[3] & 32) >> 2) |
               ((state[4] & 32) >> 1) | (state[5] & 32) | ((state[6] & 32) << 1) | ((state[7] & 32) << 2));

    temp[6] = (((state[0] & 64) >> 6) | ((state[1] & 64) >> 5) | ((state[2] & 64) >> 4) | ((state[3] & 64) >> 3) |
               ((state[4] & 64) >> 2) | ((state[5] & 64) >> 1) | (state[6] & 64) | ((state[7] & 64) << 1));
              
    temp[7] = (((state[0] & 128) >> 7) | ((state[1] & 128) >> 6) | ((state[2] & 128) >> 5) | ((state[3] & 128) >> 4) |
               ((state[4] & 128) >> 3) | ((state[5] & 128) >> 2) | ((state[6] & 128) >> 1) | (state[7] & 128));  
    
    memcpy(state, temp, 8);     
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
    p_box(state); // makes halves orthogonal - 8 bytes vertical, 8 bytes horizontal  
    
    for (round=0; round < rounds; round++)
    {
        p_box(state);        
        p_box(state + 8);
        shuffle_bytes(state);                
        round_key = xor_sum(state);      
        for (index=15; index > 0; index--)
        {
            round_key = permute(state, round_key, key[index], index - 1, index);            
        }
        permute(state, round_key, key[0], 15, 0);
    }
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
    for (round=0; round < rounds; round++)
    {    
        round_key = xor_sum(state);
        round_key = invert_permute(state, round_key, key[0], 15, 0);    
        for (index=1; index < 16; index++)
        {
            round_key = invert_permute(state, round_key, key[index], index - 1, index);
        }
        
        invert_shuffle_bytes(state);        
        p_box(state); 
        p_box(state + 8);
    }    
    p_box(state);
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
 
int test_pbox()
{
    unsigned char state[16];
    unsigned char state_copy[16];
    int index;
    for (index = 0; index < 16; index++)
    {
        state_copy[index] = index;
        state[index] = index;
    }
    p_box(state);    
    printf("State 1/2:\n %s\n", state);
    print_state(state);
    
    p_box(state + 8);
    printf("State 1/1: %s\n", state);
    print_state(state);
    
    p_box(state + 8);
    printf("State:\n %s\n", state);
    print_state(state);
    
    p_box(state);
    printf("State:\n %s\n", state);
    print_state(state);
}

int test_permute_invert_permute()
{
    unsigned char state[16], key[16], index, round_key;
    for (index = 0; index < 16; index ++)
    {
        state[index] = 0;
        key[index] = 0;
    }
    key[15] = 1;
    xor_subroutine(state, key);
    
    round_key = xor_sum(state);
    for (index = 15; index > 0; index--)
    {
        round_key = permute(state, round_key, key[index], index - 1, index);
    }
    round_key = permute(state, round_key, key[0], 15, 0);
    
    printf("State after permute: %s\n", state);
    print_state(state);
    
    round_key = xor_sum(state);
    round_key = invert_permute(state, round_key, key[0], 15, 0);
    for (index = 1; index < 16; index++)
    {
        round_key = invert_permute(state, round_key, key[index], index - 1, index);
    }
    xor_subroutine(state, key);
    printf("State after invert permute: %s\n", state);
    print_state(state);
}

int test_shuffle_invert_shuffle()
{
    unsigned char temp[16];
    unsigned char temp_copy[16];
    int index;
    for (index = 0; index < 16; index++)
    {
        temp[index] = index;
        temp_copy[index] = index;
    }
    
    printf("Before shuffle: %s\n", temp);
    print_state(temp);
    shuffle_bytes(temp);
    printf("After shuffle: %s\n", temp);
    print_state(temp);
    invert_shuffle_bytes(temp);
    printf("After invert shuffle: %s\n", temp);
    print_state(temp);
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
    int rounds = 1;
    int index;
    
    //test_permute_invert_permute();
    //test_pbox();
    //test_shuffle_invert_shuffle();
    //printf("Before: %s\n", data);
    //print_state(data);
    encrypt(data, key, rounds);
    //printf("After: %s\n", data);
    //print_state(data);
    
    //decrypt(data, key, rounds);
    //printf("After decryption: %s\n", data);
    //print_state(data); 
}