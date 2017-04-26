#include "permutation.c"

#define zero_out(array, size)({for (index = 0; index < size; index++){array[index] = 0;}})
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
                    
void test_hash(){    
    #define message_size 9
	WORDSIZE message[message_size];
    WORDSIZE hash_result[8];
    unsigned long index;
    
    zero_out(message, message_size);
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        hash_function(message, message_size, hash_result);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", hash_result[0], hash_result[1], hash_result[2], hash_result[3], hash_result[4], hash_result[5], hash_result[6], hash_result[7]);}
    
/*int main(){
    test_hash();
    return 0;}*/
    