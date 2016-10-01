#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void pack_bytes_to_state(char* state, unsigned long top, unsigned long second, unsigned long third, unsigned long bottom)
{    
    unsigned long mask32 = 0xFFFFFFFFL;
    unsigned long mask24 = 0xFFFFFF;
    unsigned long mask16 = 0xFFFF;
    unsigned long mask8 = 0xFF;
    
    state[0] = (top >> 24) & mask32;
    state[1] = (top >> 16) & mask24;
    state[2] = (top >> 8) & mask16;
    state[3] = top & mask8;
    
    state[4] = (second >> 24) & mask32;
    state[5] = (second >> 16) & mask24;
    state[6] = (second >> 8) & mask16;
    state[7] = second & mask8;
    
    state[8] = (third >> 24) & mask32;
    state[9] = (third >> 16) & mask24;
    state[10] = (third >> 8) & mask16;
    state[11] = third & mask8;
    
    state[12] = (bottom >> 24) & mask32;
    state[13] = (bottom >> 16) & mask24;
    state[14] = (bottom >> 8) & mask16;
    state[15] = bottom & mask8;       
 }
                                
void shuffle(char* state)
{
    char *temp = (char *)malloc((strlen(state) + 1) * sizeof(char));
    
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
    
    memcpy(state, temp, strlen(state));    
}
    
void shuffle_and_mix_rows(char* state)
{
    unsigned long top, second, third, bottom, temp;
    top = (state[11] << 24) | state[5] << 16 | (state[4] << 8) | state[15];
    second = (state[12] << 24) | (state[6] << 16) | (state[9] << 8) | state[0];
    third = (state[13] << 24) | (state[3] << 16) | (state[14] << 8) | state[8];
    bottom = (state[1] << 24) | (state[10] << 16) | (state[2] << 8) | state[7];
        
    second = (second + (third ^ bottom) + 1);
    top = (top + (second >> 16));
    top ^= ((second >> 5) | (second << (32 - 5))) & 0xFFFFFFFFL;
    
    temp = top;
    top = second;
    second = temp;
    
    third = (third + bottom + top + 1);
    second = (second + (third >> 16));
    second ^= ((third >> 5) | (third << (32 - 5))) & 0xFFFFFFFFL;
    
    temp = second;
    second = third;
    third = temp;
    
    bottom = (bottom + (top ^ second) + 1);
    third = (third + (bottom >> 16));
    third ^= ((bottom >> 5) | (bottom << (32 - 5))) & 0xFFFFFFFFL;

    temp = third;
    third = bottom;
    bottom = temp;
    
    top = (top + second + third + 1);
    bottom = (bottom + (top >> 16));
    bottom ^= ((top >> 5) | (top << (32 - 5))) & 0xFFFFFFFFL;    
    
    temp = bottom;
    bottom = top;
    top = temp;              
    
    top ^= second;
    second += third;
    third ^= bottom;
    bottom += top;

    pack_bytes_to_state(state, top, second, third, bottom); 
}
    
void mix_rows(char* state)
{
    int half_size = 32;
    unsigned long mask = 0xFFFFFFFFL;
    unsigned long top, second, third, bottom, temp;
            
    top = (state[0] << 24) | state[1] << 16 | (state[2] << 8) | state[3];
    second = (state[4] << 24) | (state[5] << 16) | (state[6] << 8) | state[7];
    third = (state[8] << 24) | (state[9] << 16) | (state[10] << 8) | state[11];
    bottom = (state[12] << 24) | (state[13] << 16) | (state[14] << 8) | state[15];

    second = (second + (third ^ bottom) + 1);
    top = (top + (second >> 16));
    top ^= ((second >> 5) | (second << (32 - 5))) & 0xFFFFFFFFL;
    
    temp = top;
    top = second;
    second = temp;
    
    third = (third + bottom + top + 1);
    second = (second + (third >> 16));
    second ^= ((third >> 5) | (third << (32 - 5))) & 0xFFFFFFFFL;
    
    temp = second;
    second = third;
    third = temp;
    
    bottom = (bottom + (top ^ second) + 1);
    third = (third + (bottom >> 16));
    third ^= ((bottom >> 5) | (bottom << (32 - 5))) & 0xFFFFFFFFL;

    temp = third;
    third = bottom;
    bottom = temp;
    
    top = (top + second + third + 1);
    bottom = (bottom + (top >> 16));
    bottom ^= ((top >> 5) | (top << (32 - 5))) & 0xFFFFFFFFL;    
    
    temp = bottom;
    bottom = top;
    top = temp;              
    
    top ^= second;
    second += third;
    third ^= bottom;
    bottom += top;

    pack_bytes_to_state(state, top, second, third, bottom);     
}
                               
int _encrypt(char* state, unsigned long long key, unsigned int rounds)
{    
    unsigned int bits = 64;           
    unsigned int round;
    unsigned long long left, right;
    unsigned long long mask64 = 0xFFFFFFFFFFFFFFFFL;
    unsigned long mask32 = 0xFFFFFFFFL;
        
    for (round = 0; round < rounds; round++)
    {
        printf("State before shuffle: %s\n", state);
        shuffle(state);
        printf("State before mix: %s\n", state);
        mix_rows(state);       
        
        left   = (state[0] << 24) | (state[1] << 16) | (state[2] << 8) | state[3]; 
        printf("Left (32): %llu\n", left);
        left <<= 32;
        left  |= (state[4] << 24) | (state[5] << 16) | (state[6] << 8) | state[7];
        printf("Left (64): %llu\n", left);
        right   = (state[8] << 24) | (state[9] << 16) | (state[10] << 8) | state[11];
        right <<= 32;
        right  |= (state[12] << 24) | (state[13] << 16) | (state[14] << 8) | state[15];

        right = (right + key + 1);
        left = (left + (right >> 32));
        left ^= ((right >> 5) | (right << (64 - 5))) & 0xFFFFFFFFFFFFFFFFL;
        printf("Left (after): %llu\n", (left & mask32));   
        printf("State before packing: %s\n", state);
        pack_bytes_to_state(state, (right & mask64) >> 32, right & 0xFFFFFFFFL,
                                   (left & mask64) >> 32, left & 0xFFFFFFFFL); // swaps the bytes
        printf("State after packing: %s\n", state);   
    }
}

int main()
{
    char data[16] = "Test Message!  !";
    unsigned long long key = 1;// = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01};
    printf("Data before: %s\n", data);
    _encrypt(data, key, 1);
    printf("Data after: %s\n", data);
    return 0;
}