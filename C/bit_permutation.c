#define WORDSIZE32 unsigned long
#define rotate_left(a, amount)(((a << amount) | (a >> (32 - amount))))
#define choice(a, b, c)((c ^ (a & (b ^ c))))
#define choice_swap(a, b, c)({\
    t = b ^ c;\
    t &= a;\
    _c = c;\
    c = t ^ b;\
    b = t ^ _c;})      
    
#define bit_permutation(a, b, c, d)({\
    a, b = choice_swap(c, a, b);\
    b, c = choice_swap(d, b, c);\
    c, d = choice_swap(a, c, d);\
    a = rotate_left(a, 1);\
    b = rotate_left(b, 2);\
    c = rotate_left(c, 3);\
    d = rotate_left(d, 4);})
        
#include <stdio.h>    
void test_bit_permutation(){
    WORDSIZE32 message[4], t, _c, round;
    message[0] = 1; message[1] = 2; message[2] = 128329; message[3] = 1982378;
    for (round = 0; round < 10; round++){
        bit_permutation(message[0], message[1], message[2], message[3]);}
    printf("Message: %lu %lu %lu %lu\n", message[0], message[1], message[2], message[3]);}
                                                  
int main(){
    test_bit_permutation();
    return 0;}
    