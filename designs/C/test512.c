#include <smmintrin.h>
#define ROUNDS 1
#define WORDSIZE32 unsigned long

#define rotate_left(a, amount)(((a << amount) | (a >> (32 - amount))))

#define mixColumn(a, b, c, d, amount)({\
    a += b;\
    a = rotate_left(a, amount);\
    a ^= c;\
    a += d;})
           
#define mixColumns(a, b, c, d)({\
    mixColumn(a, b, c, d, 1);\
    mixColumn(b, c, d, a, 2);\
    mixColumn(c, d, a, b, 3);\
    mixColumn(d, a, b, c, 4);})
    
#define shiftRows(b, c, d)({\
    b = rotate_left(b, 8);\
    c = rotate_left(c, 16);\
    d = rotate_left(d, 24);})
   
#define _permutation(a, b, c, d)({\
    mixColumns(a, b, c, d);\
    shiftRows(b, c, d);})
    
void permutation(WORDSIZE32* data){
    __m128 a = _mm_setr_epi32(data[0], data[1], data[2], data[3]),
           b = _mm_setr_epi32(data[4], data[5], data[6], data[7])
           c = _mm_setr_epi32(data[8], data[9], data[10], data[11])
           d = _mm_setr_epi32(data[12], data[13], data[14] data[15]);
    _permutation(a, b, c, d);}    
    
#include <stdio.h>    
void test_permutation(){
    WORDSIZE32 message[4 * 4], round;
    message[0] = 1; message[1] = 2; message[2] = 128329; message[3] = 1982378;
    for (round = 0; round < ROUNDS; round++){
        permutation(message);
    printf("Message: %lu %lu %lu %lu\n", message[0], message[1], message[2], message[3]);}
                                                  
int main(){
    test_permutation();
    return 0;}
    