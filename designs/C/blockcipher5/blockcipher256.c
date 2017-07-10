#define WORDSIZE unsigned long

#define rotate_left(a, amount)({(a << amount) | (a >> (32 - amount));})
#define choice(a, b, c)({c ^ (a & (b ^ c));})

#define _permutation(a, b, c, d, rotation_amount)({\
    a ^= b + c + d;\
    a = rotate_left(a, (7 + rotation_amount));\
    a += (b ^ c ^ d);\
    a = rotate_left(a, (9 + rotation_amount));})           
        
#define choice_shuffle(a, b, k)({\
    t = a;\
    a = choice(k, a, b);\
    b = choice(k, b, t);})        
    
#define bit_permutation(a, b, c, d, k0, k1, k2, k3)({\
    choice_shuffle(a, b, k0);\
    choice_shuffle(c, d, k1);\
    a = rotate_left(a, 1);\
    b = rotate_left(b, 2);\
    c = rotate_left(c, 3);\
    d = rotate_left(d, 5);\
    choice_shuffle(a, c, k2);\
    choice_shuffle(b, d, k3);\
    a = rotate_left(a, 8 );\
    b = rotate_left(b, 16);\
    c = rotate_left(c, 24);\
    d = rotate_left(d, 4);})
    
#define permutation(a, b, c, d, e, f, g, h)({\
    _permutation(a, b, c, d, 1);\
    _permutation(b, c, d, a, 2);\
    _permutation(c, d, a, b, 3);\
    _permutation(d, a, b, c, 5);\
    _permutation(e, f, g, h, 7);\
    _permutation(f, g, h, e, 11);\
    _permutation(g, h, e, f, 13);\
    _permutation(h, e, f, g, 17);\
    bit_permutation(e, f, g, h, a, b, c, d);\
    bit_permutation(a, b, c, d, e, f, g, h);})
    
void permutation(WORDSIZE* data){
    WORDSIZE a, b, c, d, e, f, g, h, t;
    a = data[0]; b = data[1]; c = data[2]; d = data[3]; e = data[4]; f = data[5]; g = data[6]; h = data[7];
    
    int round;
    for (round = 0; round < 10; round++){
        permutation(a, b, c, d, e, f, g, h);}
    data[0] = a; data[1] = b; data[2] = c; data[3] = d; data[4] = e; data[5] = f; data[6] = g; data[7] = h;}
    
#include "../performancetesting.c"
    
int main(){
    test_permutation_performance_8x32(permutation, 5000000);    
    return 0;}
    
        