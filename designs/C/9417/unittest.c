#include <time.h>
#include <stdio.h>

#include "permutation.c"

void print128(__m128i var){
    uint32_t *val = (uint32_t*) &var;
    printf("%lx %lx %lx %lx \n", val[0], val[1], val[2], val[3]);}
    
#define print_state(a, b, c, d)({\
    print128(a);\
    print128(b);\
    print128(c);\
    print128(d);})
    
void permutation_unit_test(){    
    REGISTER a, b, c, d;
    unsigned long _index;
    
    a = _mm_set_epi32(0xa3, 0xa2, 0xa1, 0xa0);
    b = _mm_set_epi32(0xb3, 0xb2, 0xb1, 0xb0);
    c = _mm_set_epi32(0xc3, 0xc2, 0xc1, 0xc0);
    d = _mm_set_epi32(0xd3, 0xd2, 0xd1, 0xd0);
    
    printf("Permuting 3,000,000 64-byte blocks (~183MB...)\n");
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        permutation(a, b, c, d);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);    
    print_state(a, b, c, d);
    
    for (_index = 0; _index < 3000000; _index++){
        inverse_permutation(a, b, c, d);}
    print_state(a, b, c, d);}
    
int main(){    
    permutation_unit_test();   
    return 0;}