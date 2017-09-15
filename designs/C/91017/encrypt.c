#include "hash.c" 
        
void crypto_aead_encrypt(WORDSIZE* data, WORDSIZE* keyr, WORDSIZE* keym, 
                         WORDSIZE* extra_data, WORDSIZE* tag, WORDSIZE* decryption_iv,
                         unsigned long data_size, unsigned long extra_data_size){
    REGISTER a, b, c, d, t;    
    unsigned long index;
    
    keyed_hash_function(keyr, extra_data, extra_data_size, tag);
    load_register(c, keyr, 0); load_register(d, keyr, 4);
    unsigned long block_number;    
    for (block_number = 0; block_number < data_size / 8; block_number++){        
        load_register(a, data, (block_number * 8));
        load_register(b, data, ((block_number * 8) + 4));        
        permutation(a, b, c, d);
        store_register(a, data, (block_number * 8));
        store_register(b, data, ((block_number * 8) + 4));}          
    
    load_register(t, keym, 0);
    c ^= t;
    load_register(t, keym, 4);
    d ^= t;
    store_register(c, decryption_iv, 0); 
    store_register(d, decryption_iv, 4);}
        
int crypto_aead_decrypt(WORDSIZE* data, WORDSIZE* decryption_iv, WORDSIZE* keym, 
                        WORDSIZE* extra_data, WORDSIZE* tag, 
                        unsigned long data_size, unsigned long extra_data_size){
    REGISTER a, b, c, d, t;    
    unsigned long index;
    load_register(d, decryption_iv, 4);
    load_register(c, decryption_iv, 0);
    load_register(t, keym, 4);
    d ^= t;
    load_register(t, keym, 0);
    c ^= t;
            
    unsigned long block_number = data_size / 8;    
    while (block_number-- > 0){        
        load_register(a, data, (block_number * 8));
        load_register(b, data, (block_number * 8) + 4);
        inverse_permutation(a, b, c, d);
        store_register(a, data, (block_number * 8));
        store_register(b, data, (block_number * 8) + 4);}          
            
    WORDSIZE _tag[8], keyr[8];
    store_register(c, keyr, 0);
    store_register(d, keyr, 4);
    keyed_hash_function(keyr, extra_data, extra_data_size, _tag);
    
    REGISTER tag_a, tag_b, _tag_a, _tag_b, valid;
    load_register(tag_a, tag, 0); load_register(tag_b, tag, 4);
    load_register(_tag_a, _tag, 0); load_register(_tag_b, tag, 4);    
    valid[0] = 0xFFFFFFFF; valid[1] = 0xFFFFFFFF; valid[2] = 0xFFFFFFFF; valid[3] = 0xFFFFFFFF;
    valid = (_tag_a ^ tag_a ^ 0xFFFFFFFF) & valid;
    valid = (_tag_b ^ tag_b ^ 0xFFFFFFFF) & valid;    
    return valid[0] & valid[1] & valid[2] & valid[3];}                   
    
        
void test_encrypt_decrypt(){
    WORDSIZE data[8], key[8], iv[8], extra_data[8], tag[8], decryption_iv[8];
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
    
    encrypt(data, iv, key, extra_data, tag, decryption_iv, 8, 8);  
    //iv[0] = 0;    
    //tag[0] = 0;        
    //extra_data[0] = 0;    
    if (decrypt(data, decryption_iv, key, extra_data, tag, 8, 8) == 0xFFFFFFFF){
        printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]);}
    else{
        printf("Decryption failed\n");}}
    
void test_encrypt_time(){    
	WORDSIZE message[8], key[8], iv[8], extra_data[8], tag[8], decryption_iv[8];
    unsigned long index;
    for (index = 0; index < 8; index++){
        message[index] = 1;
        key[index] = 0;
        iv[index] = 0;
        extra_data[index] = 0;}
    printf("Encrypting and authenticating 3,000,000 256-bit blocks (~91MB)\n");
    clock_t begin = clock();
    for (index = 0; index < 3000000; index++){
        encrypt(message, iv, key, extra_data, tag, decryption_iv, 8, 8);}
    clock_t end = clock();
                 
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
    printf("Time required: %.2fs\n", time_spent);
    printf("%lu%lu%lu%lu%lu%lu%lu%lu\n", message[0], message[1], message[2], message[3], message[4], message[5], message[6], message[7]);}
    
int main(){
    test_encrypt_decrypt();
    test_encrypt_time();
    return 0;}
    