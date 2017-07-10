#include "constants.c"
#include "functions.c"
#include "components.c"                     

void key_schedule(WORDSIZE* key, WORDSIZE* round_keys){    
    int key_number;           
    WORDSIZE a, b, c, d;    
    load(key, a, b, c, d);
    
    for (key_number = 0; key_number < KEY_COUNT; key_number++){        
        permutation(a, b, c, d); 
        add_key(a, b, c, d, key, 0);
        store(round_keys, a, b, c, d); // Round key = prp(k) ^ k
        add_key(a, b, c, d, key, 0); // remove key
        
        round_keys += 4;}}
        
        