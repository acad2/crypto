#define CIPHERTEXT_COUNT 16
#define zero_out(array)({array[0] = 0; array[1] = 0; array[2] = 0; array[3] = 0;})
#define xor(array1, array2, key_byte)({\
    array1[0] ^= array2[(key_byte * 4) + 0];\
    array1[1] ^= array2[(key_byte * 4) + 1];\
    array1[2] ^= array2[(key_byte * 4) + 2];\
    array1[3] ^= array2[(key_byte * 4) + 3];})
#define store(output, data)({\
    output[(index * 4) + 0] = ciphertext_byte[0];\
    output[(index * 4) + 1] = ciphertext_byte[1];\
    output[(index * 4) + 2] = ciphertext_byte[2];\
    output[(index * 4) + 3] = ciphertext_byte[3];})
    
void get_random_bytes(unsigned long amount, unsigned char* output){
    zero_out(output);} // not yet implemented      
        
void public_key_encrypt(unsigned char* message, unsigned long message_size,
                        unsigned long* output, unsigned long* public_key){     
    unsigned char key_bytes[message_size * CIPHERTEXT_COUNT], count, key_byte, _key_byte;
    unsigned long index, ciphertext_byte[4];    
    get_random_bytes(message_size * CIPHERTEXT_COUNT, key_bytes);
        
    for (index = 0; index < message_size; index++){
        zero_out(ciphertext_byte);        
        _key_byte = 0;
                
        for (count = 0; count < CIPHERTEXT_COUNT; count++){
            key_byte = key_bytes[(index * 16) + count];
            _key_byte ^= key_byte;
            xor(ciphertext_byte, public_key, key_byte);}     
                    
        _key_byte ^= message[index];        
        xor(ciphertext_byte, public_key, _key_byte);
        store(output, ciphertext_byte);}}   
        
#include "C:\Users\_\Documents\GitHub\crypto\C\performancetesting.c"
int main(){
    test_public_key_encrypt_performance(public_key_encrypt, 1024 * 1024);}