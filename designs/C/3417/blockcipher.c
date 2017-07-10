#include <stdio.h>

#define WORDSIZE unsigned long long
#define ROUNDS 16
#define rotate_left(word, amount)((word << amount) | (word >> (64 - amount)))
#define add_key(data, key)({data[0] ^= key[0]; data[1] ^= key[1]; data[2] ^= key[2]; data[3] ^= key[3];})
#define generate_constant(round_number)({\
    t = round_number;\
    t ^= rotate_left(t, 3);\
    t ^= rotate_left(t, 6);\
    t ^= rotate_left(t, 17);\
    t ^= rotate_left(t, 15);\
    t ^= rotate_left(t, 24);})
    
#define shift_rows(b, c, d, r0, r1, r2)({b = rotate_left(b, r0); c = rotate_left(c, r1); d = rotate_left(d, r2);})
#define mix_columns(a, b, c, d)({a ^= d; b ^= c; c ^= a; d ^= b;})
#define shift_and_mix(a, b, c, d, r0, r1, r2)({shift_rows(b, c, d, r0, r1, r2); mix_columns(a, b, c, d);})
#define sbox(a, b, c, d)({t = a; a = (a & b) ^ c; c = (b | c) ^ d; d = (d & a) ^ t; b ^= c & t;})
#define round_function(a, b, c, d, round_number)({\
    a ^= generate_constant(round_number);\
    shift_and_mix(a, b, c, d, 1, 2, 3);\
    shift_and_mix(a, b, c, d, 4, 8, 12);\
    shift_and_mix(a, b, c, d, 16, 32, 48);\
    sbox(a, b, c, d);})
    
#define load(data, a, b, c, d)({a = data[0]; b = data[1]; c = data[2]; d = data[3];})
#define store(data, a, b, c, d)({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})
    
void encrypt(WORDSIZE* data, WORDSIZE* key){
    WORDSIZE a, b, c, d, t;
    unsigned char round;
    add_key(data, key)
    load(data, a, b, c, d);    
        
    for (round = 1; round <= (ROUNDS + 1); round++){
        round_function(a, b, c, d, round);}
        
    store(data, a, b, c, d);}
    add_key(data, key)

    