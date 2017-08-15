#include <time.h>
#include <stdio.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 12

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

#define mix_columns(a, b, c, d) {a += b; c += d; b ^= c; d ^= a;}
#define shift_left(word, bits) {word = _mm_slli_epi32(word, bits);}

#define big_swap(a)({\
    byteswap_index = _mm_set_epi32(0, 1, 2, 3);\
    a = _mm_shuffle_epi32(a, 0b11100100);})
    
#define shift_rows(b, c, d) {b = _mm_shuffle_epi32(b, 0b01101100); c = _mm_shuffle_epi32(c, 0b10110001); d = _mm_shuffle_epi32(d, 0b11000110);}
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d); shift_left(a, 1);\
                               mix_columns(a, b, c, d); big_swap(a);})
                               
#define add_constant(a) ({load_register(t, round_constants, 0);\
                          round_constants[0] += 1;\
                          a ^= t;})
                                                    
#define permutation(a, b, c, d, t, rounds)({\
    WORDSIZE round_constants[4] = {1, 0, 0, 0};\
    unsigned long index;\
    for (index = 1; index < rounds + 1; index++){\
        add_constant(a);\
        mix_slice(a, b, c, d);\
        shift_rows(b, c, d);}})   
                       
void test_permutation(){    
    REGISTER a, b, c, d, t, byteswap_index;
    unsigned long _index;
    
	/*WORDSIZE message[16] __attribute__((aligned(16))); 
    
    for (index = 0; index < 16; index++){
        message[index] = 1;}*/
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        permutation(a, b, c, d, t, 20);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu\n", a[0], a[1], a[2], a[3]);}

int main(){    
    test_permutation();   
    return 0;}
    