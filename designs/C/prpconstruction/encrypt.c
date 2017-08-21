#include "hash.c"

#define ENCRYPTION_ROUNDS 12
#define initialize_state(a, b, c, d, t, iv, key, extra_data, extra_data_size)({\
    WORDSIZE hash_output[8];\
    hash_function(extra_data, extra_data_size, hash_output);\
    load_register(a, hash_output, 0);\
    load_register(b, hash_output, 4);\
    load_register(t, iv, 0);\
    a ^= t;\
    load_register(t, iv, 4);\
    b ^= t;\
    load_register(c, key, 0);\
    load_register(d, key, 4);\
    permutation(a, b, c, d);})    
        
void encrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* iv, WORDSIZE* extra_data, WORDSIZE* tag,
             unsigned long data_size, unsigned long extra_data_size){
    REGISTER a, b, c, d, t;    
    unsigned long index;
    initialize_state(a, b, c, d, t, iv, key, extra_data, extra_data_size);
        
    unsigned long block_number;    
    for (block_number = 0; block_number < data_size / 8; block_number++){        
        load_register(a, data, (block_number * 8));
        load_register(b, data, ((block_number * 8) + 4));        
        permutation(a, b, c, d);
        store_register(a, data, (block_number * 8));
        store_register(b, data, ((block_number * 8) + 4));}          
    
    load_register(t, key, 0);
    c ^= t;
    load_register(t, key, 4);
    d ^= t;
    store_register(c, tag, 0); 
    store_register(d, tag, 4);}
        
int decrypt(WORDSIZE* data, WORDSIZE* key, WORDSIZE* iv, WORDSIZE* extra_data, WORDSIZE* tag,
             unsigned long data_size, unsigned long extra_data_size){
    REGISTER a, b, c, d, t;    
    unsigned long index;
    load_register(d, tag, 4);
    load_register(c, tag, 0);
    load_register(t, key, 4);
    d ^= t;
    load_register(t, key, 0);
    c ^= t;
            
    unsigned long block_number = data_size / 8;    
    while (block_number-- > 0){        
        load_register(a, data, (block_number * 8));
        load_register(b, data, (block_number * 8) + 4);
        inverse_permutation(a, b, c, d);
        store_register(a, data, (block_number * 8));
        store_register(b, data, (block_number * 8) + 4);}          
            
    REGISTER tag_c, tag_d;
    tag_c = c;
    tag_d = d;
        
    initialize_state(a, b, c, d, t, iv, key, extra_data, extra_data_size);  
    REGISTER valid;
    valid[0] = 0xFFFFFFFF; valid[1] = 0xFFFFFFFF; valid[2] = 0xFFFFFFFF; valid[3] = 0xFFFFFFFF;
    valid = (c ^ tag_c ^ 0xFFFFFFFF) & valid;
    valid = (d ^ tag_d ^ 0xFFFFFFFF) & valid;
    return valid[0] & valid[1] & valid[2] & valid[3];}                   
    
        
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
    if (decrypt(data, key, iv, extra_data, tag, 8, 8) == 0xFFFFFFFF){
        printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]);}
    else{
        printf("Decryption failed\n");}}
    
void test_encrypt_time(){    
	WORDSIZE message[8], key[8], iv[8], extra_data[8], tag[8];
    unsigned long index;
    for (index = 0; index < 8; index++){
        message[index] = 1;
        key[index] = 0;
        iv[index] = 0;
        extra_data[index] = 0;}
    printf("Encrypting and authenticating 3,000,000 256-bit blocks (~91MB)\n");
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        encrypt(message, key, iv, extra_data, tag, 8, 8);}
    clock_t end = clock();
    
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", message[0], message[1], message[2], message[3], message[4], message[5], message[6], message[7]);}
    
int main(){
    test_encrypt_decrypt();
    test_encrypt_time();
    return 0;}
    