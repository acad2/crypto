#include <stdio.h>

#define WORDSIZE unsigned long long
#define ROUNDS 16
#define rotate_left(word, amount)((word << amount) | (word >> (64 - amount)))
#define shift_rows(b, c, d, r0, r1, r2)({b = rotate_left(b, r0); c = rotate_left(c, r1); d = rotate_left(d, r2);})
#define mix_columns(a, b, c, d)({a ^= d; b ^= c; c ^= a; d ^= b;})
#define sbox(a, b, c, d)({t = a; a = (a & b) ^ c; c = (b & c) ^ d; d = (d & a) ^ t; b ^= c & t;})
#define shift_and_mix(a, b, c, d, r0, r1, r2)({shift_rows(b, c, d, r0, r1, r2); mix_columns(a, b, c, d);})
#define round_function(a, b, c, d)({\
    shift_and_mix(a, b, c, d, 1, 2, 3);\
    shift_and_mix(a, b, c, d, 4, 8, 12);\
    shift_and_mix(a, b, c, d, 16, 32, 48);\
    sbox(a, b, c, d);})
#define add_key(a, b, c, d, k0, k1, k2, k3)({a ^= k0; b ^= k1; c ^= k2; d ^= k3;})
#define load(data, a, b, c, d)({a = data[0]; b = data[1]; c = data[2]; d = data[3];})
#define store(data, a, b, c, d)({data[0] = a; data[1] = b; data[2] = c; data[3] = d;})

void encrypt(WORDSIZE* data, WORDSIZE* key){
    WORDSIZE a, b, c, d, t, k0, k1, k2, k3;
    unsigned char round;
    load(data, a, b, c, d);
    load(key, k0, k1, k2, k3);
    
    add_key(a, b, c, d, k0, k1, k2, k3);
    for (round = 0; round <= ROUNDS; round++){
        round_function(a, b, c, d);}
    add_key(a, b, c, d, k0, k1, k2, k3);
    
    store(data, a, b, c, d);}
    

    