#include <string.h>
#include "randomgeneration.c"
#define CIPHERTEXT_COUNT 16 
        
void public_key_encrypt(unsigned char* message, unsigned char message_size,
                        unsigned char* output, unsigned char* public_key){     
    unsigned char key_bytes[message_size * CIPHERTEXT_COUNT], ciphertext_byte[16], count, _count, key_byte, _key_byte, index;    
    get_random_bytes(message_size * CIPHERTEXT_COUNT, key_bytes);
        
    for (index = 0; index < message_size; index++){
        memset(ciphertext_byte, 0, 16);
        _key_byte = 0;
                
        for (count = 0; count < CIPHERTEXT_COUNT; count++){
            key_byte = key_bytes[(index * 16) + count];
            _key_byte ^= key_byte;
                        
            for (_count = 0; _count < 16; _count++){
                ciphertext_byte[_count] ^= public_key[(key_byte * 16) + _count];}}                
                    
        _key_byte ^= message[index];        
        for (_count = 0; _count < 16; _count++){
            ciphertext_byte[_count] ^= public_key[(_key_byte * 16) + _count];}       
            output[(index * 16) + _count] = ciphertext_byte[_count];}}   
        
#include "C:\Users\_\Documents\GitHub\crypto\C\performancetesting.c"
int main(){
    test_public_key_encrypt_performance_8bit(public_key_encrypt, 1024 * 1024);}
    