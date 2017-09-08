#include "common.h"

struct _permutation_library{
    void (*permutation)(WORDSIZE*);
    void (*inverse_permutation)(WORDSIZE*);};
extern const struct _permutation_library permutation;
 