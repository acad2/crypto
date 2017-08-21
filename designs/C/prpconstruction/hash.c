#include "permutation.c"

#define HASHING_ROUNDS 24

#define zero_out(array, size)({for (index = 0; index < size; index++){array[index] = 0;}})
#define absorb(a, b, c, d, t, hash_input, block_number)({\
    load_register(t, hash_input, (block_number * 8));\
    a ^= t;\
    load_register(t, hash_input, ((block_number * 8) + 4));\
    b ^= t;\
    a[0] ^= block_number;\
    permutation(a, b, c, d);})
    
void hash_function(WORDSIZE* hash_input, WORDSIZE input_length, WORDSIZE* output){
    REGISTER a, b, c, d, t;
    unsigned long index, block_number = 0, number_of_blocks;
    
    number_of_blocks = input_length / 8;      
    if (input_length % 8 == 0){
        if (number_of_blocks >= 1){
            number_of_blocks -= 1;}}
    
    a ^= a; b ^= b; c ^= c; d ^= d;
    if (number_of_blocks > 0){        
        for (block_number = 0; block_number < number_of_blocks; block_number++){      
            absorb(a, b, c, d, t, hash_input, block_number);}}
        
    int amount = input_length % 8;    
    if (amount == 0){
        amount = 8;}    
        
    if (amount < 5){
        load_register(t, hash_input, (block_number * 8));
        a ^= t;}
    else{
        load_register(t, hash_input, (block_number * 8));
        a ^= t;
        load_register(t, hash_input, (block_number * 8) + 4);
        b ^= t;}       
    a[0] ^= 0xFFFFFFFF ^ block_number;
    permutation(a, b, c, d);
    
    store_register(a, output, 0);
    store_register(b, output, 4);}
                    
void test_hash(){    
    #define message_size 8
	WORDSIZE message[message_size];
    WORDSIZE hash_result[8];
    unsigned long index;
    
    zero_out(message, message_size);
    zero_out(hash_result, 8);
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        hash_function(hash_result, message_size, hash_result);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", hash_result[0], hash_result[1], hash_result[2], hash_result[3], hash_result[4], hash_result[5], hash_result[6], hash_result[7]);}
    
/*int main(){
    test_hash();
    return 0;}*/
    