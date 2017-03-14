#define WORDSIZE unsigned long
#define KEY_ADDITION_LAYERS 4
#define rotate_left(a, amount)((a << amount) | (a >> (32 - amount)))

#define gen_constant(word){\
    t = word;\
    t ^= rotate_left(t, 3);\
    t ^= rotate_left(t, 6);\
    t ^= rotate_left(t, 13);\
    t ^= rotate_left(t, 8);}
        
#define shift_rows(b, c, d, r1, r2, r3){\
    b = rotate_left(b, r1);\
    c = rotate_left(c, r2);\
    d = rotate_left(d, r3);}

#define mix_columns(a, b, c, d){\
    t = a;\
    a = (a & b) ^ c;\
    c = (b | c) ^ d;\
    d = (d & a) ^ t;\
    b = b ^ (c & t);}

#define mix(a, b, c, d, r1, r2, r3){\
    mix_columns(a, b, c, d);\
    shift_rows(b, c, d, r1, r2, r3);}
    
#define add_key(a, b, c, d, k0, k1, k2, k3){a ^= k0; b ^= k1; c ^= k2; d ^= k3;}
#define load(data, a, b, c, d){a = data[0]; b = data[1]; c = data[2]; d = data[3];}
#define store(data, a, b, c, d){data[0] = a; data[1] = b; data[2] = c; data[3] = d;}
        
#define round_function(a, b, c, d, round_number){\
    gen_constant(round_number);\
    a ^= t;\
    mix(a, b, c, d, 1, 2, 3);\
    mix(a, b, c, d, 4, 8, 12);\
    mix(a, b, c, d, 8, 12, 16);}
    
void encrypt(WORDSIZE* data, WORDSIZE* key){
    unsigned int key_number;
    WORDSIZE a, b, c, d, k0, k1, k2, k3, t;
    load(data, a, b, c, d);
    load(key, k0, k1, k2, k3);
    for (key_number = 0; key_number < KEY_ADDITION_LAYERS; key_number++){
        add_key(a, b, c, d, k0, k1, k2, k3);        
        round_function(a, b, c, d, ((4 * key_number) + 1));               
        round_function(a, b, c, d, ((4 * key_number) + 2));                
        round_function(a, b, c, d, ((4 * key_number) + 3));                
        round_function(a, b, c, d, ((4 * key_number) + 4));}
    
    add_key(a, b, c, d, k0, k1, k2, k3)
    store(data, a, b, c, d)}
    