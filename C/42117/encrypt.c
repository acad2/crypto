#include "permutation.c"
#include "hash.c"

#define initialize_state(state, iv, key)({\
    for (index = 0; index < 8; index++){\
        state[index] = iv[index];\
        state[index + 8] = key[index];}\
    permutation(state);})
    
void encrypt(WORDSIZE* data, WORDSIZE* iv, WORDSIZE* key, WORDSIZE* extra_data, WORDSIZE* tag
             unsigned long data_size, unsigned long extra_data_size){
    WORDSIZE state[16];
    unsigned long index;
    initialize_state(state, iv, key);
        
    unsigned long number_of_blocks, block_number;
    number_of_blocks = data_size / 8;
    for (block_number = 0; block_number < number_of_blocks; block_number++){
        for (index = 0; index < 8; index++){
            state[index] = data[(block_number * 8) + index];}
        permutation(state);
        for (index = 0; index < 8; index++){
            data[(block_number * 8) + index] = state[index];}}
            
    for (index = 0; index < 8; index++){
        tag[index] = state[index + 8] ^ key[index];}}
        
int decrypt(WORDSIZE* data, WORDSIZE* iv, WORDSIZE* key, WORDSIZE* extra_data, WORDSIZE* tag,
             unsigned long data_size, unsigned long extra_data_size){
    WORDSIZE state[16];
    unsigned long index;
    for (index = 0; index < 8; index++){
        state[index + 8] = tag[index] ^ key[index];}
    
    unsigned long number_of_blocks, block_number
    number_of_blocks = data_size / 8;
    while (block_number-- > 0){
        for (index = 0; index < 8; index++){
            state[index] = data[(block_number * 8) + index];}
        invert_permutation(state);
        for (index = 0; index < 8; index++){
            data[(block_number * 8) + index] = state[index];}}
            
    for (index = 0; index < 8; index++){
        tag[index] = state[index + 8];}
    
    initialize_state(state, iv, key);
    
    int valid = 1;
    for (index = 0; index < 8; index++){
        if (state[index + 8] != tag[index]){
            valid = 0;}
        else{
            valid = valid;}}
    if (valid == 1){
        return 1;}
    else{
        return -1;}}
        
    
       