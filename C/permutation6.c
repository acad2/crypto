#include "performancetesting.c"    

#define rotate_left(a, amount)((a << amount) | (a >> (32 - amount)))

#define __permutation(a, b, c, d)({\
    a += b;\
    c += d;\
    a = rotate_left(a, 2);\
    b = rotate_left(b, 2);\
    b ^= c;\
    d ^= a;\
    c = rotate_left(c, 8);\
    d = rotate_left(d, 8);})          
    
#define _permutation(a, b, c, d)({\
    __permutation(a, b, c, d);\
    __permutation(b, c, d, a);\
    __permutation(c, d, a, b);\
    __permutation(d, a, b, c);})
    
#define store_data(data, a, b, c, d)\
    ({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})   
        
#define load_data(data, a, b, c, d)\
    ({a = data[0]; b = data[1]; c = data[2]; d=data[3];})
    
#define iterate(permutation, a, b, c, d, iterations)\
({  unsigned int iteration;\
    for (iteration = 0; iteration < iterations; iteration++){\
        permutation(a, b, c, d);}\
})    
    
void permutation(WORDSIZE32* data){
    WORDSIZE32 a, b, c, d;
    load_data(data, a, b, c, d);
    iterate(_permutation, a, b, c, d, 10);
    store_data(data, a, b, c, d);}
    

int main(){    
    WORDSIZE32 message[4];
    test_permutation_performance_4x32(permutation, (1024 * 1024 * 1024) / 16);    
    return 0;}
        