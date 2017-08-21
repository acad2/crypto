#include <time.h>
#include <stdio.h>
#include <stdint.h>
#include <x86intrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 32
#define SHUFFLE_CONFIG 3, 10, 8, 4, 0, 13, 6, 11, 15, 5, 1, 2, 9, 14, 12, 7
#define INVERSE_SHUFFLE_CONFIG 7, 2, 10, 1, 8, 14, 3, 13, 0, 9, 6, 12, 15, 4, 5, 11

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

void print128(__m128i var){
    uint32_t *val = (uint32_t*) &var;
    printf("%lx %lx %lx %lx \n", val[0], val[1], val[2], val[3]);}
    
#define print_state(a, b, c, d)({\
    print128(a);\
    print128(b);\
    print128(c);\
    print128(d);})
    
#define mix_columns(a, b, c, d) {a += b; c += d; b += c; d += a;}    
#define little_swap(c, shuf_mask) {c = _mm_shuffle_epi8(c, shuf_mask);}
#define shift_row(b) {b = _mm_shuffle_epi32(b, 0b10010011);}
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d);\
                               mix_columns(a, b, c, d);})                               
#define add_constant(a, t)({a += t; t = _mm_slli_epi32(t, 1);})

#define permutation(a, b, c, d)({\
    unsigned long index;\
    WORDSIZE initial_constants[4] = {1, 1, 1, 1};\
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);\
    REGISTER shuf_mask =  _mm_set_epi8(SHUFFLE_CONFIG);\
    for (index = 1; index < (ROUNDS / 2) + 1; index++){\
        add_constant(a, round_constants);\
        mix_slice(a, b, c, d);\
        little_swap(a, shuf_mask);\
        shift_row(b);\
        add_constant(a, round_constants);\
        mix_slice(a, b, c, d);\
        little_swap(a, shuf_mask);\
        shift_row(b);}})        
       
#define unshift_row(b) {b = _mm_shuffle_epi32(b, 0b00111001);}                                                       
#define unswap(a, shuf_mask) {a = _mm_shuffle_epi8(a, shuf_mask);}
#define unmix_columns(a, b, c, d) {d -= a; b -= c; c -= d; a -= b;} 
#define unmix_slice(a, b, c, d)({unmix_columns(a, b, c, d);\
                                 unmix_columns(a, b, c, d);})                               
#define remove_constant(a, t)({a -= t; t = _mm_srli_epi32(t, 1);})   
       
#define inverse_permutation(a, b, c, d)({\
    unsigned long index;\
    WORDSIZE initial_constants[4] = {1 << 31, 1 << 31, 1 << 31, 1 << 31};\
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);\
    REGISTER shuf_mask = _mm_set_epi8(INVERSE_SHUFFLE_CONFIG);\
    for (index = 1; index < ROUNDS + 1; index++){\
        unshift_row(b);\
        unswap(a, shuf_mask);\
        unmix_slice(a, b, c, d);\
        remove_constant(a, round_constants);}})
            
    
    
void test_permutation(){    
    REGISTER a, b, c, d;
    unsigned long _index;
    
	/*WORDSIZE message[16] __attribute__((aligned(16))); 
    
    for (index = 0; index < 16; index++){
        message[index] = 1;}*/
    a = _mm_set_epi32(0xa3, 0xa2, 0xa1, 0xa0);
    b = _mm_set_epi32(0xb3, 0xb2, 0xb1, 0xb0);
    c = _mm_set_epi32(0xc3, 0xc2, 0xc1, 0xc0);
    d = _mm_set_epi32(0xd3, 0xd2, 0xd1, 0xd0);
    //print_state(a, b, c, d);    
    
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        permutation(a, b, c, d);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);    
    //print_state(a, b, c, d);
    
    for (_index = 0; _index < 3000000; _index++){
        inverse_permutation(a, b, c, d);}
    print_state(a, b, c, d);}
    
/*int main(){    
    test_permutation();   
    return 0;}*/
    