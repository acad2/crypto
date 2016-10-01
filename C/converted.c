#include <stdio.h>

int xor_sum(char* data, int end_of_data)
{
    int index;
    int result = 0;    
    for (index = 0; index < end_of_data; index = index + 1){        
        result ^= data[index];
        }
    return result;
}
    
// from http://stackoverflow.com/questions/213042/how-do-you-do-exponentiation-in-c    
// long modular_exponentiation(long x, unsigned n, int modulus)
// {
//     long  p;
//     long  r;
//     long backup = n;
//     
//     p = x;
//     r = 1.0;
//     while (n > 0)
//     {
//         if (n % 2 == 1)
//             r *= p;
//         p *= p;
//         n /= 2;
//     }
//     printf("%d ** %d = %d\n", x, backup, r);
//     return(r % modulus);
// }
// 
// char* generate_s_box()
// {
//     int index, value;
//     char S_BOX[256];
//     char* result = NULL;
//     result = S_BOX;
//     for (index=0; index < 256; index ++)
//     {
//         value = modular_exponentiation(251, index, 257) % 256;
//         S_BOX[index] = value;        
//     }
//     return result;
// }
  
void swap_bytes(char* data, int index, int random_byte, int required_bits)
{
    int random_place;
    random_place = random_byte >> (8 - required_bits);   
    data[index], data[random_place] = data[random_place], data[index];
}
    
void substitution(char* data, char* key, char* times, char* space, char* S_BOX, int size_of_data, char* counter, int required_bits)
{
    int state, data_xor, key_xor, time, place, random_place;
    int size_minus_one, _index, index, swap_place, present_modifier;
    int time_constant, place_constant;
    
    size_minus_one = size_of_data - 1;
    data_xor = xor_sum(data, sizeof(data));
    key_xor = xor_sum(key, sizeof(key));
    state = data_xor ^ key_xor;
        
    for (_index = 0; _index < size_of_data; _index ++)
    {
        index = counter[_index];
        
        swap_place = ((size_minus_one - index) ^ state) >> (8 - required_bits);            
        swap_bytes(data, swap_place, key[swap_place], required_bits);
        
        time = times[index];
        place = space[index];
        time_constant = S_BOX[time];                          
        place_constant = S_BOX[place ^ time_constant];
        present_modifier = time_constant ^ place_constant;

        //# Find a random location based off of the entropy in this location at this time
        random_place = S_BOX[key[place] ^ time_constant] >> 8 - required_bits;         
        
        state ^= data[place];
        data[place] ^= S_BOX[state ^ present_modifier];
        state ^= data[place];                                     

        //# Manipulate the state at the random place       
        state ^= data[random_place];
        data[random_place] ^= S_BOX[state ^ random_place];
        state ^= data[random_place];                
       
        //# manipulate the current location again
        state ^= data[place];
        data[place] ^= S_BOX[state ^ present_modifier];
        state ^= data[place];  
        
        swap_place = ((size_minus_one - index) ^ state) >> (8 - required_bits);
        swap_bytes(data, swap_place, key[swap_place], required_bits);
        
        //////////////
       // time = times[index];
       // place = space[index];
       // time_constant = S_BOX[time];
       // 
       // random_place = S_BOX[key[place] ^ time_constant] >> 8 - required_bits;     
       //                 
       // state ^= data[random_place];
       // data[random_place] ^= S_BOX[state ^ random_place];
       // state ^= data[random_place];
       //         
       // state ^= data[place];
       // data[place] ^= S_BOX[state ^ S_BOX[place] ^ time_constant];
       // state ^= data[place];
       //                 
       // state ^= data[random_place];
       // data[random_place] ^= S_BOX[state ^ random_place];
       // state ^= data[random_place];
    }
}
    
int main () {
    char data[8] = "Testing ";
    char key[8] = "Testing ";
    int output;    
    output = xor_sum(data, sizeof(data));
    printf("Data: %s\n", data);
    printf("xor sum of data: %d\n", output);
 
    unsigned char S_BOX[256] = 
    {
        0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
        0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
        0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
        0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
        0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
        0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
        0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
        0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
        0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
        0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
        0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
        0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
        0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
        0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
        0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
        0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
    };
 
    int index;
    for (index = 0; index < 256; index++)
    {
        printf("Sbox %d = %c\n", index, S_BOX[index]);
    }        
        
    char times[8], space[8];
    for (index = 0; index < 8; index ++)
    {
        times[index] = index;
        space[index] = index;
    }
    
    char counter[8] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07};
    int required_bits;
    required_bits = 3; // = 2 ** 3 = 2 * 2 * 2 = 8 = sizeof(data)
    printf("Data before: %s\n", data);
    substitution(data, key, times, space, S_BOX, sizeof(data), counter, required_bits);
    printf("Data after : %s\n", data);
    
    return 0;
}        