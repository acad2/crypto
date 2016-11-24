#define WORDSIZE32 unsigned long
#define WORDSIZE8 unsigned char
#define rotate_left(word, amount)(((word << amount) | (word >> (32 - amount))))
#define rotate_right(word, amount)(((word << amount) | (word >> (32 - amount))))
#define choice(a, b, c)((c ^ (a & (b ^ c))))
#define choice_swap(a, b, k)({\
    t = a;\
    a = choice(k, a, b);\
    b = choice(k, b, t);})
    
#define shuffle_columns(a, b, c, d, k0, k1, k2, k3)({\
    choice_swap(a, b, k0);\
    choice_swap(c, d, k1);\
    choice_swap(c, b, k2);\
    choice_swap(a, d, k3);})
    
#define bit_permutation(a, b, c, d, k0, k1, k2, k3)({\
    shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 1);\
    c = rotate_left(c, 2);\
    d = rotate_left(d, 3);\
    shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 4);\
    c = rotate_left(c, 8);\
    d = rotate_left(d, 12);\
    shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 8);\
    c = rotate_left(c, 12);\
    d = rotate_left(d, 16);\
    shuffle_columns(a, b, c, d, k0, k1, k2, k3);})
    
#define invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)({\
    choice_swap(a, d, k3);\
    choice_swap(c, b, k2);\
    choice_swap(c, d, k1);\
    choice_swap(a, b, k0);})            
    
#define invert_bit_permutation(a, b, c, d, k0, k1, k2, k3)({\
    invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 16);\
    c = rotate_right(c, 12);\
    b = rotate_right(b, 8);\
    invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 12);\
    c = rotate_right(c, 8);\
    b = rotate_right(b, 4);\
    invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 3);\
    c = rotate_right(c, 2);\
    b = rotate_right(b, 1);\
    invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);})
    
WORDSIZE32 generate_padding(){
    return 0;} // NOT IMPLEMENTED YET
    
void homomorphic_encrypt(WORDSIZE8 data, WORDSIZE32* key, WORDSIZE32* output){
    WORDSIZE32 t, padding_byte;     
    int index;
    for (index = 0; index < 3; index++){
        padding_byte = generate_padding();
        data ^= padding_byte;
        data ^= padding_byte >> 8;
        data ^= padding_byte >> 16;
        data ^= padding_byte >> 24;
        output[index] = padding_byte;}
        
    padding_byte = generate_padding();
    data ^= padding_byte >> 8;
    data ^= padding_byte >> 16;
    data ^= padding_byte >> 24;    
    padding_byte &= 0xFF;
    padding_byte |= data;
    output[3] = padding_byte;
    bit_permutation(output[0], output[1], output[2], output[3], key[0], key[1], key[2], key[3]);}
    
WORDSIZE8 homomorphic_decrypt(WORDSIZE32* data, WORDSIZE32* key){
    WORDSIZE32 t, padding_byte;
    WORDSIZE8 data_byte, index;
    invert_bit_permutation(data[0], data[1], data[2], data[3], key[0], key[1], key[2], key[3]);
    
    padding_byte = data[3];
    data_byte = padding_byte & 255;
    data_byte ^= padding_byte >> 8;
    data_byte ^= padding_byte >> 16;
    data_byte ^= padding_byte >> 24;
    for (index = 0; index < 3; index++){
        padding_byte = data[index];
        data_byte ^= padding_byte;
        data_byte ^= padding_byte >> 8;
        data_byte ^= padding_byte >> 16;
        data_byte ^= padding_byte >> 24;}
    return data_byte;}
    
/*#include "../performancetesting.c"    
int main(){    
    test_encrypt_performance_1x8_128_output(homomorphic_encrypt, 1024 * 1024);}*/
    
    