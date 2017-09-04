#include <time.h>
#include <stdio.h>
#include <stdint.h>
#include <x86intrin.h>

#define WORDSIZE unsigned long
#define REGISTER __m128i
#define ROUNDS 32
#define SHUFFLE_CONFIG 3, 10, 8, 4, 0, 13, 6, 11, 15, 5, 1, 2, 9, 14, 12, 7
#define INVERSE_SHUFFLE_CONFIG 7, 2, 10, 1, 8, 14, 3, 13, 0, 9, 6, 12, 15, 4, 5, 11

#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  
 
void encrypt(WORDSIZE* data, WORDSIZE* key){
    unsigned long index;
    REGISTER a, k; load_register(a, data, 0); load_register(k, key, 0);
    WORDSIZE initial_constants[4] = {1, 1, 1, 1};
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);
    REGISTER shuf_mask =  _mm_set_epi8(SHUFFLE_CONFIG);
    for (index = 1; index < ROUNDS + 1; index++){
        a ^= round_constants;
        a = _mm_shuffle_epi8(a, shuf_mask);
        a += k; round_constants = _mm_slli_epi32(round_constants, 1);}
    store_register(a, data, 0);}
                                                             
void decrypt(WORDSIZE* data, WORDSIZE* key){
    unsigned long index;
    REGISTER a, k; load_register(a, data, 0); load_register(k, key, 0);
    WORDSIZE initial_constants[4] = {1 << 31, 1 << 31, 1 << 31, 1 << 31};
    REGISTER round_constants; load_register(round_constants, initial_constants, 0);
    REGISTER inverse_shuf_mask = _mm_set_epi8(INVERSE_SHUFFLE_CONFIG);
    for (index = 1; index < ROUNDS + 1; index++){
        a -= k;
        a = _mm_shuffle_epi8(a, inverse_shuf_mask);        
        a ^= round_constants; round_constants = _mm_srli_epi32(round_constants, 1);}
    store_register(a, data, 0);}
    
void test_encrypt_decrypt_time(){    
    WORDSIZE data[4], key[4];
    unsigned long _index;
    //a = _mm_set_epi32(0xa3, 0xa2, 0xa1, 0xa0);
    //k = _mm_set_epi32(0xb3, 0xb2, 0xb1, 0xb0);
    data[0] = 0; data[1] = 1; data[2] = 2; data[3] = 3;
    key[0] = 1; key[1] = 0; key[2] = 0; key[3] = 0;
    printf("Data before: %lu %lu %lu %lu\n", data[0], data[1], data[2], data[3]);
    
    clock_t begin = clock();
    for (_index = 0; _index < 3000000; _index++){            
        encrypt(data, key);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);    
    printf("Data after: %lu %lu %lu %lu\n", data[0], data[1], data[2], data[3]);
    
    for (_index = 0; _index < 3000000; _index++){
        decrypt(data, key);}
    printf("Data decrypted: %lu %lu %lu %lu\n", data[0], data[1], data[2], data[3]);;}
    
int main(){    
    test_encrypt_decrypt_time();   
    return 0;}
    