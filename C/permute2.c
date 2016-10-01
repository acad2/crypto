int permute(uint16_t left_byte, uint16_t right_byte, uint16_t key_byte)
{      
    right_byte = right_byte + key_byte + 1; // & 65535 happens via overflow
    left_byte = left_byte + (right_byte >> 8); // & 65535
    left_byte ^= (right_byte >> 3) | (right_byte << (16 - 3)); // & 65535
    return left_byte, right_byte
}

int invert_permute(uint16_t left_byte, uint16_t right_byte, uint16_t key_byte)
{
    left_byte ^= (right_byte >> 3) | (right_byte << (16 - 3));// & 65535   
    left_byte = (65536 + (left_byte - (right_byte >> 8)));// & 65535       
    right_byte = (65536 + (right_byte - key_byte - modifier));// & 65535   
    return left_byte, right_byte
}    

// Haven't gotten started on these yet really
// int permute_subroutine(data, key, index, modifier):    
//     data[index - 1], data[index] = permute(data[index - 1], data[index], key[index], modifier)    
//     
// int invert_permute_subroutine(data, key, index, modifier):    
//     data[index - 1], data[index] = invert_permute(data[index - 1], data[index], key[index], modifier)    
//     
// int permutation(data, key, modifier):        
//     for round in range(2):
//         for index in reversed(range(len(data))):        
//             permute_subroutine(data, key, index, modifier)            
//     
// int invert_permutation(data, key, modifier):    
//     for round in range(2):
//         for index in range(len(data)):
//             invert_permute_subroutine(data, key, index, modifier)            
//     
// int encrypt_bytes(data, key, tag, rounds=1):
//     size = len(data)    
//     for index in range(size):
//         data[index] = (data[index] & 255) | (tag[index] << 8)                      
//     
//     key = key[:]        
//     for round in range(rounds):                      
//         permutation(key, key, round)    
//         permutation(data, key, round)        
//             
//     for index in range(size):    
//         tag[index] = data[index] >> 8
//                 
// int decrypt_bytes(data, key, tag, rounds=1):
//     size = len(data)    
//     for index in range(size):
//         data[index] = (data[index] & 255) | (tag[index] << 8)        
//         
//     keys = []
//     key = key[:]
//     for round in range(rounds):        
//         permutation(key, key, round)        
//         keys.append(key[:])
//         
//     for round in reversed(range(rounds)):           
//         invert_permutation(data, keys[round], round)                        
//         
//     for index in range(size):
//         tag[index] = data[index] >> 8           