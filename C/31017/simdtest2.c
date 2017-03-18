#include <stdio.h>
#include <stdint.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long

void printv128(__m128i var)
{
    uint16_t *val = (uint16_t*) &var;
    printf("Numerical: %i %i %i %i %i %i %i %i \n", 
           val[0], val[1], val[2], val[3], val[4], val[5], 
           val[6], val[7]);
}

//#define allocate_register(name, a, b, c, d) v128 name; name.value = _mm_set_epi32(a, b, c, d);
//#define mix_columns(a, b, c, d)(a.value = a.value + b.value; c.value = c.value + d.value;\
//                                b.value = b.value ^ c.value; d.value = d.value ^ a.value;)
                                


#define rotate_left(word, bits) word = _mm_slli_epi32(word, bits) | _mm_srli_epi32(word, 32 - bits)
#define shift_rows(b, c, d, r1, r2, r3)({rotate_left(b, r1); rotate_left(c, r2); rotate_left(d, r3);})

#define load_register(name, state_array, offset) __m128i name = _mm_loadu_si128((void *) (state_array + offset))
#define mix_columns(a, b, c, d) {a += b; c += d; b ^= c; d ^= a;}
#define mix_sections(a, b, c, d) {a = _mm_shuffle_epi32(a, 0b
void test()
{
    //allocate_register(a, 0, 0, 0, 1)
    //allocate_register(b, 0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC, 0xDDDDDDDD)
    //allocate_register(c, 0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC, 0xDDDDDDDD)
    //allocate_register(d, 0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC, 0xDDDDDDDD)
    WORDSIZE state[16];
    int index;
    for (index = 0; index < 16; index++){
        state[index] = index;}
   
    load_register(a, state, 0);
    load_register(b, state, 4);
    load_register(c, state, 8);
    load_register(d, state, 12);
    
    printf("\nRegisters loaded");
    
    for (index = 0; index < 16; index++){
        mix_columns(a, b, c, d);
        shift_rows(b, c, d, 1, 2, 3);
        
        mix_columns(a, b, c, d);
        shift_rows(b, c, d, 4, 8, 12);
    
        mix_columns(a, b, c, d);
        shift_rows(b, c, d, 8, 12, 16);}
    
    printv128(a);
    printf("\n");
    a = _mm_shuffle_epi32(a, 0b00011011);
    //a.value = _mm_shuffle_epi32(a.value, 0b00011011);
    //a.value = _mm_shuffle_epi32(a.value, 0b00011011);
    printv128(a);}
    
int main(int argc, char** argv){
    test();
    return 0;
}