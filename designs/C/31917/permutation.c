#include <time.h>
#include <stdio.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i

#define load_register(name, state_array, offset) __m128i name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

#define mix_columns(a, b, c, d) {t = a; a = (a & b) ^ c;  c = (b | c) ^ d; d = (d & a) ^ t; b ^= c & t;}
#define rotate_left(word, bits) _mm_slli_epi32(word, bits) | _mm_srli_epi32(word, 32 - bits)
#define shift_rows(b, c, d, r1, r2, r3)({b = rotate_left(b, r1); c = rotate_left(c, r2); d = rotate_left(d, r3);})
#define shift_constants(cb, cc, cd, r1, r2, r3)({cb = (cb << r1) | (cb >> (32 - r1)); cc = (cc << r2) | (cc >> (32 - r2)); cd = (cd << r3) | (cd >> (32 - r3));})

#define shift_sections(b, c, d) {b = _mm_shuffle_epi32(b, 0b01101100); c = _mm_shuffle_epi32(c, 0b10110001); d = _mm_shuffle_epi32(d, 0b11000110);}

#define add_constant(a) ({load_register(round_constant, round_constants, 0);\
                          round_constants[0] += 4; round_constants[1] += 4; round_constants[2] += 4; round_constants[3] += 4;\
                          round_constant ^= rotate_left(round_constant, 3); round_constant ^= rotate_left(round_constant, 6);\
                          round_constant ^= rotate_left(round_constant, 17); round_constant ^= rotate_left(round_constant, 15);\
                          round_constant ^= rotate_left(round_constant, 24);\
                          a ^= round_constant;})
                           
void permutation(WORDSIZE* state){    
    WORDSIZE round_constants[4] = {1, 2, 3, 4};    
    REGISTER round_constant, t;
    int index, index2;            
    load_register(a, state, 0); load_register(b, state, 4); 
    load_register(c, state, 8); load_register(d, state, 12);           
    
    for (index = 0; index < 4; index++){                     
        add_constant(a);                
        
        for (index2 = 0; index2 < 2; index2++){              
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 1, 2, 3);
            
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 4, 8, 12);
            
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 8, 12, 16);}
        shift_sections(b, c, d);}
        
    store_register(a, state, 0); store_register(b, state, 4);
    store_register(c, state, 8); store_register(d, state, 12);}
    
int main(){    
	WORDSIZE message[16];
    unsigned long index;
    
    for (index = 0; index < 16; index++){
        message[index] = 0;}
        
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        permutation(message);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu\n", message[0]);
    return 0;}   
    