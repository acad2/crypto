#include <stdio.h>
#include <stdint.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long

void printv128(__m128i var)
{
    uint32_t *val = (uint32_t*) &var;
    printf("Numerical: %lu %lu %lu %lu\n", val[0], val[1], val[2], val[3]);
           
}

#define load_register(name, state_array, offset) __m128i name = _mm_loadu_si128((void *) (state_array + offset))
#define mix_columns(a, b, c, d) {a += b; c += d; b ^= c; d ^= a;}
#define mix_sections(a, b, c, d) {a = _mm_shuffle_epi32(a, 0b
#define rotate_left(word, bits) word = _mm_slli_epi32(word, bits) | _mm_srli_epi32(word, 32 - bits)
#define shift_rows(b, c, d, r1, r2, r3)({rotate_left(b, r1); rotate_left(c, r2); rotate_left(d, r3);})


void test(){
    WORDSIZE state[16];
    
    int index, index2;
    //for (index = 0; index < 16; index++){
    //    state[index] = index;}
    state[0] = 1;
    load_register(a, state, 0);
    load_register(b, state, 4);
    load_register(c, state, 8);
    load_register(d, state, 12);
    
    printf("\nRegisters loaded");
    for (index = 0; index < 4; index++){
        for (index2 = 0; index2 < 4; index2++){
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 1, 2, 3);
            
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 4, 8, 12);
        
            mix_columns(a, b, c, d);
            shift_rows(b, c, d, 8, 12, 16);}
        b = _mm_shuffle_epi32(b, 0b01101100);
        c = _mm_shuffle_epi32(c, 0b10110001);
        d = _mm_shuffle_epi32(d, 0b11000110);}
    
    printf("\n");
    printv128(a); printv128(b); printv128(c); printv128(d);}

    
int main(int argc, char** argv){
    test();
    return 0;
}