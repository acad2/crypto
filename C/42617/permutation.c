#include <time.h>
#include <stdio.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 12

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

#define mix_columns(a, b, c, d) {a += b; c += d; b ^= c; d ^= a;}
#define rotate_left(word, bits) _mm_slli_epi32(word, bits) | _mm_srli_epi32(word, 32 - bits)
#define shift_rows(b, c, d, r1, r2, r3)({b = rotate_left(b, r1); c = rotate_left(c, r2); d = rotate_left(d, r3);})
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d); shift_rows(b, c, d, 1, 2 ,  3);\
                               mix_columns(a, b, c, d); shift_rows(b, c, d, 4, 8 , 12);\
                               mix_columns(a, b, c, d); shift_rows(b, c, d, 8, 12, 16);})                               
#define shift_sections(b, c, d) {b = _mm_shuffle_epi32(b, 0b01101100); c = _mm_shuffle_epi32(c, 0b10110001); d = _mm_shuffle_epi32(d, 0b11000110);}
#define add_constant(a) ({load_register(t, round_constants, 0);\
                          round_constants[0] += 1;\
                          a ^= t;})
                                                    
#define permutation(a, b, c, d, t, rounds)({\
    WORDSIZE round_constants[4] = {1, 0, 0, 0};\
    for (index = 1; index < rounds + 1; index++){\
        add_constant(a);\
        mix_slice(a, b, c, d);\
        shift_sections(b, c, d);}})   
        
        
#define unmix_columns(a, b, c, d)({d ^= a; b ^= c; c -= d; a -= b;})
#define rotate_right(word, bits) _mm_srli_epi32(word, bits) | _mm_slli_epi32(word, 32 - bits)
#define unshift_rows(b, c, d, r1, r2, r3)({b = rotate_right(b, r1); c = rotate_right(c, r2); d = rotate_right(d, r3);})
#define unmix_slice(a, b, c, d)({unshift_rows(b, c, d, 8, 12, 16); unmix_columns(a, b, c, d);\
                                 unshift_rows(b, c, d, 4,  8, 12); unmix_columns(a, b, c, d);\
                                 unshift_rows(b, c, d, 1,  2,  3); unmix_columns(a, b, c, d);})                                 
#define unshift_sections(b, c, d) shift_sections(b, c, d)                                 
#define remove_constant(a) ({load_register(t, round_constants, 0);\
                             round_constants[0] -= 1;\
                             a ^= t;})

#define invert_permutation(a, b, c, d, t, rounds)({\
    WORDSIZE round_constants[4] = {ROUNDS, 0, 0, 0};\
    for (index = ROUNDS; index > 0; index--){\
        unshift_sections(b, c, d);\
        unmix_slice(a, b, c, d);\
        remove_constant(a);}})
        