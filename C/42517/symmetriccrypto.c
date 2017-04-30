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

#define zero_out(array, size)({for (index = 0; index < size; index++){array[index] = 0;}})
        
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

    
/* end permutation/begin hash */

#define absorb(state, hash_input, amount, offset, modifier)({\
    for (index = 0; index < amount; index++){\
        state[index] ^= hash_input[offset + index] ^ modifier;}\
    permutation(state);})
    
void hash_function(WORDSIZE* hash_input, WORDSIZE input_length, WORDSIZE* output){
    WORDSIZE state[16] __attribute__((aligned(16)));
    unsigned long index, block_number = 0, number_of_blocks;
    
    zero_out(state, 16);
                
    number_of_blocks = input_length / 8;      
    if (input_length % 8 == 0){
        if (number_of_blocks >= 1){
            number_of_blocks -= 1;}}
    if (number_of_blocks > 0){        
        for (block_number = 0; block_number < number_of_blocks; block_number++){        
            absorb(state, hash_input, 8, (block_number * 8), block_number);}}
        
    int amount = input_length % 8;
    if (amount == 0){
        amount = 8;}
    
    absorb(state, hash_input, amount, (block_number * 8), (0xFFFFFFFF ^ block_number));    
    copy(output, state, 8, 0, 0);}
    
    
/* end hash/begin encrypt */
    
#define initialize_state(state, iv, key, extra_data, extra_data_size)({\
    hash_function(extra_data, extra_data_size, state);\
    for (index = 0; index < 8; index++){\
        state[index] ^= iv[index];\
        state[index + 8] = key[index];}\
    permutation(state);})
        
#define constant_time_comparison(flag, array1, array2, array_size, offset1, offset2)({\
    for (index = 0; index < array_size; index++){\
        flag = (state[index + offset1] ^ tag[index + offset2] ^ 1) & flag;}})        
            
void encrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* iv, WORDSIZE* extra_data, WORDSIZE* tag,
             unsigned long data_size, unsigned long extra_data_size){
    WORDSIZE state[16];
    unsigned long index;
    initialize_state(state, iv, key, extra_data, extra_data_size);
        
    unsigned long block_number;    
    for (block_number = 0; block_number < data_size / 8; block_number++){    
        copy(state, data, 8, 0, (block_number * 8));                       
        permutation(state);
        copy(data, state, 8, (block_number * 8), 0);}        
         
    for (index = 0; index < 8; index++){
        tag[index] = state[index + 8] ^ key[index];}}
        
int decrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* iv, WORDSIZE* extra_data, WORDSIZE* tag,
             unsigned long data_size, unsigned long extra_data_size){
    WORDSIZE state[16];
    unsigned long index;
    for (index = 0; index < 8; index++){
        state[index + 8] = tag[index] ^ key[index];}
    
    unsigned long block_number = data_size / 8;    
    while (block_number-- > 0){        
        copy(state, data, 8, 0, (block_number * 8));               
        invert_permutation(state);
        copy(data, state, 8, (block_number * 8), 0);}        
            
    copy(tag, state, 8, 0, 8);          
    initialize_state(state, iv, key, extra_data, extra_data_size);  
    
    int valid = 1;
    constant_time_comparison(valid, state, tag, 8, 8, 0);
    return valid;}  
    
    
/* end encrypt/begin unit tests */
    
void test_invert_permutation(){
    WORDSIZE message[16];
    unsigned long index;
    for (index = 0; index < 16; index++){
        message[index] = index;}    
    permutation(message);
    
    invert_permutation(message);    
    for (index = 0; index < 16; index++){
        if (message[index] != index){
            printf("Invert permutation unit test failed\n");}}}            
    
void test_permutation(){    
	WORDSIZE message[16] __attribute__((aligned(16))); 
    unsigned long index;
    for (index = 0; index < 16; index++){
        message[index] = 1;}
    printf("Time testing permutation...\n");
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        permutation(message);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", message[0], message[1], message[2], message[3], message[4], message[5], message[6], message[7]);}

void test_hash(){    
    #define message_size 8
	WORDSIZE message[message_size];
    WORDSIZE hash_result[8];
    unsigned long index;
    
    zero_out(message, message_size);
    printf("Time testing hash...\n");
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        hash_function(message, message_size, hash_result);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", hash_result[0], hash_result[1], hash_result[2], hash_result[3], hash_result[4], hash_result[5], hash_result[6], hash_result[7]);}
    

void test_encrypt_decrypt(){
    WORDSIZE data[8], key[8], iv[8], extra_data[8], tag[8];
    unsigned long index;
    
    for (index = 0; index < 8; index++){
        data[index] = 0;
        key[index] = 0;
        iv[index] = 0;
        extra_data[index] = 0;}
    data[0] = 1;
    key[0] = 1;
    iv[0] = 1;
    extra_data[0] = 1;
    
    encrypt(data, key, iv, extra_data, tag, 8, 8);  
    //iv[0] = 0;    
    //tag[0] = 0;
    //extra_data[0] = 0;
    if (decrypt(data, key, iv, extra_data, tag, 8, 8) == 1){
        printf("%lu\n", data[0]);}
    else{
        printf("Decryption unit test failed\n");}}
    
void test_encrypt_time(){    
	WORDSIZE message[8], key[8], iv[8], extra_data[8], tag[8];
    unsigned long index;
    for (index = 0; index < 8; index++){
        message[index] = 1;}
    printf("Encrypting and authenticating 3,000,000 256-bit blocks (~91MB)\n");
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        encrypt(message, key, iv, extra_data, tag, 8, 8);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", message[0], message[1], message[2], message[3], message[4], message[5], message[6], message[7]);}
    
int main(){
    test_invert_permutation();
    test_permutation();
    test_hash();
    test_encrypt_decrypt();
    test_encrypt_time();
    return 0;}
    