#include <stdint.h>
#include <x86intrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

#define ROUNDS 16
#define INITIAL_CONSTANTS 3, 160, 9216, 49152
#define INVERSE_INITIAL_CONSTANTS 98304, 5242880, 301989888, 1610612736

#define rotate(word, shuf_mask) {word = _mm_shuffle_epi8(word, shuf_mask);}    
#define ROT_DOWN 11, 6, 1, 12, 7, 2, 13, 8, 3, 14, 9, 4, 15, 10, 5, 0              
#define ROL_8 12, 15, 14, 13, 8, 11, 10, 9, 4, 7, 6, 5, 0, 3, 2, 1              
#define ROL_16 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2
#define ROL_24 14, 13, 12, 15, 10, 9, 8, 11, 6, 5, 4, 7, 2, 1, 0, 3        

#define ROT_UP 3, 6, 9, 12, 15, 2, 5, 8, 11, 14, 1, 4, 7, 10, 13, 0
#define ROR_8 ROL_24
#define ROR_16 ROL_16
#define ROR_24 ROL_8 
                                                        
#define mix_columns(a, b, c, d)({a += b; c ^= d; b ^= c; d ^= a ^ b;})
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d); rotate(a, a_mask);\
                               mix_columns(a, b, c, d); rotate(b, b_mask); rotate(c, c_mask); rotate(d, d_mask);})
#define add_constant(a, t)({a ^= t; t = _mm_slli_epi32(t, 1);})

#define permutation(a, b, c, d)({\
    unsigned long index;\
    WORDSIZE initial_constants[4] = {INITIAL_CONSTANTS};\
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);\
    REGISTER a_mask =  _mm_set_epi8(ROT_DOWN);\
    REGISTER b_mask =  _mm_set_epi8(ROL_8);\
    REGISTER c_mask =  _mm_set_epi8(ROL_16);\
    REGISTER d_mask =  _mm_set_epi8(ROL_24);\
    for (index = 1; index < ROUNDS + 1; index++){\
        add_constant(a, round_constants);\
        mix_slice(a, b, c, d);}})        
       
                                                  
#define unmix_columns(a, b, c, d)({d ^= a ^ b; b ^= c; c ^= d; a -= b;})
#define unmix_slice(a, b, c, d)({rotate(d, d_mask); rotate(c, c_mask); rotate(b, b_mask); unmix_columns(a, b, c, d);\
                                 rotate(a, a_mask); unmix_columns(a, b, c, d);})                               
#define remove_constant(a, t)({a ^= t; t = _mm_srli_epi32(t, 1);})   
       
#define inverse_permutation(a, b, c, d)({\
    unsigned long index;\
    WORDSIZE initial_constants[4] = {INVERSE_INITIAL_CONSTANTS};\
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);\
    REGISTER a_mask =  _mm_set_epi8(ROT_UP);\
    REGISTER b_mask =  _mm_set_epi8(ROR_8);\
    REGISTER c_mask =  _mm_set_epi8(ROR_16);\
    REGISTER d_mask =  _mm_set_epi8(ROR_24);\
    for (index = 1; index < ROUNDS + 1; index++){\
        unmix_slice(a, b, c, d);\
        remove_constant(a, round_constants);}})
               