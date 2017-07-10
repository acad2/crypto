#include <time.h>
#include <stdio.h>
#include <emmintrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 12

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  

#define sub_bytes(a, b, c, d) {t = a; a = (a & b) ^ c; c = (b | c) ^ d; d = (d & a) ^ t; b ^= c & t;}
#define mix_columns(a, b, c, d) {a ^= b; c ^= d; b ^= c; d ^= a;}
#define rotate_left(word, bits) _mm_slli_epi32(word, bits) | _mm_srli_epi32(word, 32 - bits)
#define shift_rows(b, c, d, r1, r2, r3)({b = rotate_left(b, r1); c = rotate_left(c, r2); d = rotate_left(d, r3);})
#define mix_slice(a, b, c, d)({mix_columns(a, b, c, d); shift_rows(b, c, d, 1, 2, 3)  ; sub_bytes(a, b, c, d);\
                               mix_columns(a, b, c, d); shift_rows(b, c, d, 4, 8, 12) ; sub_bytes(a, b, c, d);\
                               mix_columns(a, b, c, d); shift_rows(b, c, d, 8, 12, 16); sub_bytes(a, b, c, d);})
                               
#define shift_sections(b, c, d) {b = _mm_shuffle_epi32(b, 0b01101100); c = _mm_shuffle_epi32(c, 0b10110001); d = _mm_shuffle_epi32(d, 0b11000110);}
#define add_constant(a) ({load_register(t, round_constants, 0);\
                          round_constants[0] += 1;\
                          a ^= t;})

#define unshift_sections(b, c, d) {b = _mm_shuffle_epi32(b, 0b11000110); c = _mm_shuffle_epi32(c, 0b10110001); d = _mm_shuffle_epi32(d, 0b01101100);}
#define unsub_bytes(a, b, c, d)({b ^= c; d ^= t;})
#define unmix_slice(a, b, c, d)({unsub_bytes(a, b, c, d); shift_rows(b, c, d, 32 - 8, 32 - 12, 32 - 3); unmix_columns(a, b, c, d);\
                                 unsub_bytes(a, b, c, d); shift_rows(b, c, d, 32 - 4, 32 - 8, 32 - 12); unmix_columns(a, b, c, d);\
                                 unsub_bytes(a, b, c, d); shift_rows(b, c, d, 32 - 1, 32 - 2, 32 - 16); unmix_columns(a, b, c, d);})

                          
void permutation(WORDSIZE* state){        
    REGISTER t, a, b, c, d;    
    load_register(a, state, 0); load_register(b, state, 4); 
    load_register(c, state, 8); load_register(d, state, 12);           
    
    int index;                
    WORDSIZE round_constants[4] = {1, 0, 0, 0};    
    
    for (index = 1; index < ROUNDS + 1; index++){
        add_constant(a);
        mix_slice(a, b, c, d);
        shift_sections(b, c, d);}    
        
    store_register(a, state, 0); store_register(b, state, 4);
    store_register(c, state, 8); store_register(d, state, 12);}                

void test_permutation(){    
	WORDSIZE message[16] __attribute__((aligned(16))); 
    unsigned long index;
    for (index = 0; index < 16; index++){
        message[index] = 1;}
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        permutation(message);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", message[0], message[1], message[2], message[3], message[4], message[5], message[6], message[7]);}

int main(){
    test_permutation();   
    return 0;}
    