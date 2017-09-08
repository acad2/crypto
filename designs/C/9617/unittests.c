#include <time.h>
#include <stdio.h>

#include "common.h"
#include "simd.h"
#include "permutation.h"
#include "unittests.h"

void print128(__m128i var){
    WORDSIZE *val = (WORDSIZE*) &var;
    printf("%lx %lx %lx %lx \n", val[0], val[1], val[2], val[3]);}
    
#define print_state(a, b, c, d) print128(a); print128(b); print128(c); print128(d);
    
void _permutation_unit_test(){    
    printf("Beginning permutation unit test\n");
    REGISTER a, b, c, d;
    unsigned long _index;    
    a = _mm_set_epi32(0xa3, 0xa2, 0xa1, 0xa0);
    b = _mm_set_epi32(0xb3, 0xb2, 0xb1, 0xb0);
    c = _mm_set_epi32(0xc3, 0xc2, 0xc1, 0xc0);
    d = _mm_set_epi32(0xd3, 0xd2, 0xd1, 0xd0);
    WORDSIZE state[16]; store_state(state, a, b, c, d);
    printf("Initial state:\n");
    print_state(a, b, c, d);
    printf("Permuting 3,000,000 64-byte blocks (~183MB...)\n");
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        permutation.permutation(state);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);    
    print_state(a, b, c, d);
    
    printf("Inverting...\n");
    for (_index = 0; _index < 3000000; _index++){
        permutation.inverse_permutation(state);}
    printf("Final state:\n");
    print_state(a, b, c, d);}
    
const struct _unittests_library unittests = {
    .permutation_unit_test = _permutation_unit_test};
        