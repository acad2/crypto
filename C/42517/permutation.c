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
  
#define copy(array1, array2, amount, offset1, offset2)({\
    for (index = 0; index < amount; index++){\
        array1[offset1 + index] = array2[offset2 + index];}})
        
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

void invert_permutation(WORDSIZE* state){
    REGISTER t, a, b, c, d;    
    load_register(a, state, 0); load_register(b, state, 4); 
    load_register(c, state, 8); load_register(d, state, 12);           
    
    int index;                
    WORDSIZE round_constants[4] = {ROUNDS, 0, 0, 0};    
    
    for (index = ROUNDS; index > 0; index--){        
        unshift_sections(b, c, d);        
        unmix_slice(a, b, c, d);
        remove_constant(a);}
                
    store_register(a, state, 0); store_register(b, state, 4);
    store_register(c, state, 8); store_register(d, state, 12);}  
                
void test_invert_permutation(){
    WORDSIZE message[16];
    unsigned long index;
    for (index = 0; index < 16; index++){
        message[index] = index;}    
    permutation(message);
    
    invert_permutation(message);    
    for (index = 0; index < 16; index++){
        if (message[index] != index){
            printf("Unit test failed\n");}}}            
    
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

/*int main(){
    test_invert_permutation();
    test_permutation();   
    return 0;}*/
    