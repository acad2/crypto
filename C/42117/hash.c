#include "permutation.c"

#define zero_out(array, size)({for (index = 0; index < size; index++){array[index] = 0;}})
    
void hash_function(WORDSIZE* hash_input, WORDSIZE input_length, WORDSIZE* output){
    WORDSIZE state[16] __attribute__((aligned(16)));
    unsigned long index, block_number, number_of_blocks;
    
    zero_out(state, 16);
                
    number_of_blocks = input_length / 8;      
    for (block_number = 0; block_number < number_of_blocks; block_number++){
        for (index = 0; index < 8; index++){\
            state[index] ^= hash_input[(block_number * 8) + index] ^ block_number;}\
        permutation(state);}
    
    block_number += 1;    
    for (index = 0; index < input_length % 8; index++){
        state[index] ^= hash_input[(block_number * 8) + index] ^ 0xFFFFFFFF ^ block_number;}
    permutation(state);        
        
    for (index = 0; index < 8; index++){
        output[index] = state[index];}}
                        
int main(){    
    #define message_size 32
	WORDSIZE message[message_size];
    WORDSIZE hash_result[8];
    unsigned long index;
    
    zero_out(message, message_size);
    clock_t begin = clock();
    for (index = 0; index < 1000000; index++){
        hash_function(message, message_size, hash_result);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", hash_result[0], hash_result[1], hash_result[2], hash_result[3], hash_result[4], hash_result[5], hash_result[6], hash_result[7]);
    return 0;}
    