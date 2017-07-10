#define WORDSIZE32 unsigned long

#define increment_nonce(nonce)({\
    nonce[3]++;\
    if (nonce[3] == 0){\
        nonce[2]++;\
        if (nonce[2] == 0){\
            nonce[1]++;\
            if (nonce[1] == 0){\
                nonce[0]++;}}}})
         
#define load_seed(_seed, seed)({\
    _seed[0] = seed[0];\
    _seed[1] = seed[1];\
    _seed[2] = seed[2];\
    _seed[3] = seed[3];})         
    
#define xor_subroutine(data, _seed)({\
    data[0] ^= _seed[0];\
    data[1] ^= _seed[1];\
    data[2] ^= _seed[2];\
    data[3] ^= _seed[3];})
    
void CTR_mode(void (*cipher_algorithm)(WORDSIZE32*, WORDSIZE32*), 
              WORDSIZE32* data,              
              WORDSIZE32* key,
              WORDSIZE32* seed){    
    WORDSIZE32 _seed[4];    
    load_seed(_seed, seed);
    cipher_algorithm(_seed, key);        
    xor_subroutine(data, _seed);
    increment_nonce(seed);}        
                     
void encrypt(void (*cipher_algorithm)(WORDSIZE32*, WORDSIZE32*),
             void (*mode_of_operation)(void (*cipher_algorithm)(WORDSIZE32*, WORDSIZE32*), WORDSIZE32*, WORDSIZE32*, WORDSIZE32*),
             WORDSIZE32* data,
             WORDSIZE32* key,
             WORDSIZE32* seed,
             unsigned long block_count){
    unsigned long block_index;
    for (block_index = 0; block_index < block_count; block_index++){
        mode_of_operation(cipher_algorithm, data + (block_index * 4), key, seed);}}
                            
void decrypt(void (*cipher_algorithm)(WORDSIZE32*, WORDSIZE32*),
             void (*mode_of_operation)(void (*cipher_algorithm)(WORDSIZE32*, WORDSIZE32*), WORDSIZE32*, WORDSIZE32*, WORDSIZE32*),
             WORDSIZE32* data,
             WORDSIZE32* key,
             WORDSIZE32* seed,
             unsigned long block_count){
    unsigned long block_index;
    for (block_index = block_count; block_index >= 0; block_index--){
        mode_of_operation(cipher_algorithm, data + (block_index * 4), key, seed);}}
             
#include "blockcipher128_256.c" 
#include <assert.h>    
 
void test_CTR_mode(){    
    WORDSIZE32 message[4], key[12], seed[4];
    CTR_mode(blockcipher128_256_encrypt, message, key, seed);}
    
void test_encrypt(){
    WORDSIZE32 blocks = 4;
    WORDSIZE32 message[blocks * 4], key[12], seed[4];
    message[0] = 0; message[1] = 0; message[2] = 0; message[3] = 0;
    seed[0] = 0; seed[1] = 0; seed[2] = 0; seed[3] = 0;    
    encrypt(blockcipher128_256_encrypt, CTR_mode, message, key, seed, blocks);
    seed[3] = 0;
    encrypt(blockcipher128_256_encrypt, CTR_mode, message, key, seed, blocks);
    assert(message[0] == 0);
    assert(message[1] == 0);
    assert(message[2] == 0);
    assert(message[3] == 0);}
    
int main(){
    test_CTR_mode();
    test_encrypt();
    return 0;}
    
        