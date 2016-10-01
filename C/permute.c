#include <stdint.h>
#include <stdio.h>

int permute(unsigned char* data, unsigned char * key, unsigned int index, unsigned int index2)
{
    // increment, potentially overflowing low order byte
    // add any bits in high order byte to next byte
    // zero the high order byte and store the low order byte
    // xor the next byte with a rotation of the current (aids nonlinearity)
    uint16_t right_byte;
    right_byte = data[index];
    right_byte += key[index] | 1; 
    data[index2] = (data[index2] + (right_byte >> 8)) & 255; 
    
    right_byte &= 255; 
    data[index] = right_byte;                    
    
    data[index2] ^= ((right_byte >> 3) | (right_byte << (8 - 3)));
}

int permute2(unsigned char* data, unsigned char * key, unsigned int index, unsigned int index2)
{
    // increment, potentially overflowing low order byte
    // add any bits in high order byte to next byte
    // zero the high order byte and store the low order byte
    // xor the next byte with a rotation of the current (aids nonlinearity)
    uint16_t right_byte;
    right_byte = data[index];
    right_byte += (key[index - 1] << 8 | key[index]) | 1; 
    data[index2] = (data[index2] + (right_byte >> 8)) & 255; 
    
    right_byte &= 255; 
    data[index] = right_byte;                    
    
    data[index2] ^= ((right_byte >> 3) | (right_byte << (8 - 3)));
}

int permute4(unsigned char* data, unsigned char * key, unsigned int index, unsigned int index2)
{
    // increment, potentially overflowing low order byte
    // add any bits in high order byte to next byte
    // zero the high order byte and store the low order byte
    // xor the next byte with a rotation of the current (aids nonlinearity)
    uint32_t right_byte;
    right_byte = data[index];
    printf("Key: %s\n", key);
    right_byte += ((key[index - 3] << 24 | key[index - 2] << 16 | key[index - 1] << 8 | key[index]) | 1); 
    data[index2] = ((((((data[index2] + (right_byte >> 8)) & 255) + right_byte >> 16) & 255) + right_byte >> 24) & 255); 
    
    right_byte &= 255; 
    data[index] = right_byte;                    
    
    data[index2] ^= ((right_byte >> 3) | (right_byte << (8 - 3)));
}


int permutation(unsigned char* data, unsigned char* key, unsigned int size)
{        
    unsigned int index;
    
    for (index = size - 1; index > 0; index -= 1)
    {        
        permute4(data, key, index, index - 1);
    }
    // wrap the first byte around to the last byte    
    permute4(data, key, 0, size - 1);
}

int main()
{
    unsigned char data[8] = "Testing!";
    unsigned char key[8] = "Randomer";
    
    unsigned int round;
    for (round = 0; round < 16; round += 1)
    {
        permutation(data, key, 8);
        printf("Data: %s\n", data);
    }
}