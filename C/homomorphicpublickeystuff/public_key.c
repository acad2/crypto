#include "homomorphicbitpermutation.c"
#include <stdio.h>

void generate_public_key(WORDSIZE32* private_key, WORDSIZE32* output){
    WORDSIZE32 ciphertext[4];
    WORDSIZE8 byte;
    for (byte = 0; byte < 254; byte++){            
        homomorphic_encrypt(byte, private_key, ciphertext);
        output[(4 * byte) + 0] = ciphertext[0];
        output[(4 * byte) + 1] = ciphertext[1];
        output[(4 * byte) + 2] = ciphertext[2];
        output[(4 * byte) + 3] = ciphertext[3];}
    byte = 255;
    homomorphic_encrypt(byte, private_key, ciphertext);
    output[(4 * byte) + 0] = ciphertext[0];
    output[(4 * byte) + 1] = ciphertext[1];
    output[(4 * byte) + 2] = ciphertext[2];
    output[(4 * byte) + 3] = ciphertext[3];}    
    
void generate_private_key(WORDSIZE32* output){
    int index;
    for (index = 0; index < 16; index++){
        output[index] = generate_padding();}}
        
void generate_keypair(WORDSIZE32* public_key_output, WORDSIZE32* private_key_output){
    generate_private_key(private_key_output);
    generate_public_key(private_key_output, public_key_output);}
    
void encrypt(WORDSIZE8* message, WORDSIZE32 message_length, WORDSIZE32* output, WORDSIZE32* public_key){
    WORDSIZE32 index, ciphertext_byte[4];
    WORDSIZE8 symbol, xor_sum, count, random_value;
    for (index = 0; index < message_length; index++){
        symbol = message[index];
        xor_sum = 0;
        ciphertext_byte[0] = 0; ciphertext_byte[1] = 0; ciphertext_byte[2] = 0; ciphertext_byte[3] = 0;        
        for (count = 0; count < 16; count++){
            random_value = generate_padding();
            xor_sum ^= random_value;
                                   
            ciphertext_byte[0] ^= public_key[(4 * random_value) + 0];
            ciphertext_byte[1] ^= public_key[(4 * random_value) + 1];
            ciphertext_byte[2] ^= public_key[(4 * random_value) + 2];
            ciphertext_byte[3] ^= public_key[(4 * random_value) + 3];}
            
        random_value = xor_sum ^ symbol;
        ciphertext_byte[0] ^= public_key[(4 * random_value) + 0];
        ciphertext_byte[1] ^= public_key[(4 * random_value) + 1];
        ciphertext_byte[2] ^= public_key[(4 * random_value) + 2];
        ciphertext_byte[3] ^= public_key[(4 * random_value) + 3];
        
        output[(4 * index) + 0] = ciphertext_byte[0];
        output[(4 * index) + 1] = ciphertext_byte[1];
        output[(4 * index) + 2] = ciphertext_byte[2];
        output[(4 * index) + 3] = ciphertext_byte[3];}}
        
void decrypt(WORDSIZE32* ciphertext, WORDSIZE32 message_length, WORDSIZE32* private_key, WORDSIZE32* output){
    WORDSIZE32 index;
    for (index = 0; index < message_length; index++){
        output[index] = homomorphic_decrypt(ciphertext + (4 * index), private_key);}}
        
#include "../performancetesting.c"
int main(){
    test_public_key_encrypt_performance(encrypt, 1024 * 1280);
    return 0;}
    