void key_alternating_cipher(void (*permutation)(unsigned long long*),
                            unsigned long long* round_keys, 
                            unsigned long long* state,
                            int rounds, int size)