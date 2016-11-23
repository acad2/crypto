#define WORDSIZE32 unsigned long
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
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 1);\
    c = rotate_left(c, 2);\
    d = rotate_left(d, 3);\
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 4);\
    c = rotate_left(c, 8);\
    d = rotate_left(d, 12);\
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    b = rotate_left(b, 8);\
    c = rotate_left(c, 12);\
    d = rotate_left(d, 16);\
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3);})
    
#define invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)({\
    choice_swap(a, d, k3);\
    choice_swap(c, b, k2);\
    choice_swap(c, d, k1);\
    choice_swap(a, b, k0);})            
    
#define invert_bit_permutation(a, b, c, d, k0, k1, k2, k3)({\
    a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 16);\
    c = rotate_right(c, 12);\
    b = rotate_right(b, 8);\
    a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 12);\
    c = rotate_right(c, 8);\
    b = rotate_right(b, 4);\
    a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);\
    d = rotate_right(d, 3);\
    c = rotate_right(c, 2);\
    b = rotate_right(b, 1);\
    a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3);})
    
WORDSIZE32 generate_padding(){
    return random_unsigned_long()}
    
void encrypt(WORDSIZE32* data, WORDSIZE32* key, WORDSIZE32* output){
    WORDSIZE32 padding[2], t;
    padding[0] = generate_padding();
    padding[1] = generate_padding();
    output[0] = data[0] ^ padding[0];
    output[1] = data[1] ^ padding[1];
    output[2] = padding[2];
    output[3] = padding[3];
    bit_permutation(output[0], output[1], output[2], output[3], key[0], key[1], key[2], key[3]);}
    
void decrypt(WORDSIZE32* data, WORDSIZE32* key, WORDSIZE32* output){
    WORDSIZE32 t;
    invert_bit_permutation(data[0], data[1], data[2], data[3], key[0], key[1], key[2], key[3]);
    output[0] = data[0];
    output[1] = data[1];}
    
    