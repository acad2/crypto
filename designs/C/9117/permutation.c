#include <time.h>
#include <stdio.h>
#include <x86intrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 32

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

[[3278735159921, 5305104928862, 3278735159921, 5305104928861], 
 [5305104928861, 8583840088782, 5305104928862, 8583840088783],
 [3278735159921, 5305104928861, 3278735159921, 5305104928862], 
 [5305104928862, 8583840088783, 5305104928861, 8583840088782]]
 
#define mix_columns(a, b, c, d)({\
    a = (3278735159921 * a) + (5305104928862 * b) + (3278735159921 * c) + (5305104928861 * d);\
    c = (3278735159921 * a) + (5305104928861 * b) + (3278735159921 * c) + (5305104928862 * d);\
    b = (5305104928861
#define little_swap(a, shuf_mask) {a = _mm_shuffle_epi8(a, shuf_mask);}
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d);\
                               mix_columns(a, b, c, d);})
                               
#define add_constant(a, t, shuf_mask)({a += t; t += shuf_mask;})                
#define permutation(a, b, c, d, rounds)({\
    unsigned long index;\
    WORDSIZE round_constants[4] = {1, 1, 1, 1};\
    REGISTER t;\
    load_register(t, round_constants, 0);\
    REGISTER shuf_mask =  _mm_set_epi8(13,12, 15,14,  9,8, 11,10,  5,4, 7,6,  1,0, 3,2);\
    for (index = 1; index < rounds + 1; index++){\
        add_constant(a, t, shuf_mask);\
        mix_slice(a, b, c, d);\
        little_swap(a, shuf_mask);}})   
                       
void test_permutation(){    
    REGISTER a, b, c, d;
    unsigned long _index;
    
	/*WORDSIZE message[16] __attribute__((aligned(16))); 
    
    for (index = 0; index < 16; index++){
        message[index] = 1;}*/
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        permutation(a, b, c, d, ROUNDS);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu\n", a[0], a[1], a[2], a[3]);}

int main(){    
    test_permutation();   
    return 0;}
    