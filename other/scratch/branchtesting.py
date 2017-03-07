import operator
from crypto.utilities import rotate_left

def find_branch_rotations8():    
    results = []
    for r1 in range(8):
        for r2 in range(8):
            def branch(word):
                word ^= rotate_left(word, r1, 8)
                word ^= rotate_left(word, r2, 8)
                return word
            
            outputs = [branch(1 << shift) for shift in range(8)]
            differences = []
            for index1 in range(8):
                for index2 in range(8):
                    if index1 == index2:
                        continue
                    differences.append(format(outputs[index1] ^ outputs[index2], 'b').count('1'))
            results.append((r1, r2, min(differences)))
    return sorted(results, key=operator.itemgetter(2))
    
def find_minimum_differences(good_rotations):
    for r1, r2 in good_rotations:
        def branch(word):
            word ^= rotate_left(word, r1, 8)
            word ^= rotate_left(word, r2, 8)
            return word        
        outputs = []
        for byte in range(32):
            outputs.append(branch(byte))
            
        break_flag = False
        for index in range(32):            
            for index2 in range(index, 32):
                if format(outputs[index] ^ outputs[index2], 'b').count('1') < 4:
                    break_flag = True
                    break
            if break_flag:
                break
        else:
            print "Good happy success: ", r1, r2
                
        
        
def test_find_branch_rotations8():    
    # good rotations were: 1, 3
    #                      1, 5
    #                      3, 1
    #                      3, 7
    #                      5, 1
    #                      5, 7
    #                      7, 3
    #                      7, 5
    
    rotations_and_differences = find_branch_rotations8()
    find_minimum_differences((item[0], item[1]) for item in rotations_and_differences[:8])
        
if __name__ == "__main__":
    test_find_branch_rotations8()
    