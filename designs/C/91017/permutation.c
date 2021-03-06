#include "simd.h"
#include "common.h"
#include "permutation.h"

#define ROUNDS 16
#define INITIAL_CONSTANTS 3, 160, 9216, 49152
#define INVERSE_INITIAL_CONSTANTS 98304, 5242880, 301989888, 1610612736
                                                        
#define mix_columns(a, b, c, d)({a += b; c ^= d; b ^= c; d ^= a ^ b;})
#define mix_slices(a, b, c, d)({mix_columns(a, b, c, d); rotate8(a, a_mask);\
                                mix_columns(a, b, c, d); rotate8(b, b_mask); rotate8(c, c_mask); rotate8(d, d_mask);})
#define add_constant(a, round_constants)({a ^= round_constants; round_constants = _mm_slli_epi32(round_constants, 1);})

#define unmix_columns(a, b, c, d)({d ^= a ^ b; b ^= c; c ^= d; a -= b;})
#define unmix_slices(a, b, c, d)({rotate8(d, d_mask); rotate8(c, c_mask); rotate8(b, b_mask); unmix_columns(a, b, c, d);\
                                 rotate8(a, a_mask); unmix_columns(a, b, c, d);})                               
#define remove_constant(a, t)({a ^= t; t = _mm_srli_epi32(t, 1);})   

#define initialize_constants(initial_values)\
    WORDSIZE initial_constants[4] = {initial_values};\
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);   
    
#define initialize_rotation_masks(a_rot, b_rot, c_rot, d_rot)\
    REGISTER a_mask =  _mm_set_epi8(a_rot); REGISTER b_mask =  _mm_set_epi8(b_rot);\
    REGISTER c_mask =  _mm_set_epi8(c_rot); REGISTER d_mask =  _mm_set_epi8(d_rot);
    
#define initialize_state(state)\
    REGISTER a, b, c, d; load_state(state, a, b, c, d);
    
void crypto_prp_permutation(WORDSIZE* state){
    unsigned long index;
    initialize_state(state);    
    initialize_constants(INITIAL_CONSTANTS);
    initialize_rotation_masks(ROT_DOWN, ROL_8, ROL_16, ROL_24);      
    for (index = 0; index < ROUNDS; index++){
        add_constant(a, round_constants);
        mix_slices(a, b, c, d);}
    store_state(state, a, b, c, d);}      
                                                         
void crypto_prp_inverse_permutation(WORDSIZE* state){
    unsigned long index;
    initialize_state(state);
    initialize_constants(INVERSE_INITIAL_CONSTANTS);
    initialize_rotation_masks(ROT_UP, ROR_8, ROR_16, ROR_24);
    for (index = 0; index < ROUNDS; index++){
        unmix_slices(a, b, c, d);
        remove_constant(a, round_constants);}
    store_state(state, a, b, c, d);}

/* a function requires store_register at the end, a macro does not
   the below requires the caller to declare prp_round_counter and initialize the rotation masks */
#define crypto_prp_permutation_inline(a, b, c, d)\
    initialize_constants(INITIAL_CONSTANTS);\
    for (prp_round_counter = 0; prp_round_counter < ROUNDS; prp_round_counter++){\
        add_constant(a, round_constants);\
        mix_slices(a, b, c, d);}
                                                         
#define crypto_prp_inverse_permutation_inline(a, b, c, d)\
    initialize_constants(INITIAL_CONSTANTS);\
    for (prp_round_counter = 0; prp_round_counter < ROUNDS; prp_round_counter++){\
        unmix_slices(a, b, c, d);\
        remove_constant(a, round_constants);}
        