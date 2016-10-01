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
        data[index] = rotate_left((data_byte + key + index), 5);        
        key ^= data[index]; 
    }
    return key;
}

unsigned int invert_prp(unsigned int* data, unsigned int key)
{   
    unsigned int byte;
    int index;    
    for (index = DATA_SIZE - 1; index != -1; index--)
    {                    
        byte = data[index];
        key ^= byte;                
        data[index] = rotate_right(byte, 5) - key - index;       
        key ^= data[index];
    }
    return key;
}

void main()
{
    unsigned int data[DATA_SIZE], key[DATA_SIZE], null_string[DATA_SIZE];
    memset(null_string, 0, DATA_SIZE * WORD_SIZE);
    
    memcpy_s(data, null_string, DATA_SIZE);
    
    int index, data_xor = 0;
    for (index = 0; index < DATA_SIZE; index++)
    {
        data_xor ^= data[index];
    }
   
   printf("Before:\n");
   print_data(data);
   data_xor = prp(data, data_xor);
   data_xor = prp(data, data_xor);
   printf("After:\n");
   print_data(data);
   
   data_xor = invert_prp(data, data_xor);
   data_xor = invert_prp(data, data_xor);
   printf("Back:\n");
   print_data(data);
}
   