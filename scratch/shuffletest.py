from crypto.utilities import slide


def swap_places(state, round, next_index=[7, 12, 14, 9, 2, 1, 5, 15, 11, 6, 13, 0, 4, 8, 10, 3]):
    temporary = bytearray(16)
    for index in range(16):
        temporary[next_index[index]] = state[index]
    state[:] = temporary[:]
        
def _print_state(state, message):
    print message
    for _bytes in slide(state, 4):
        print ' '.join(format(byte, 'b').zfill(4) for byte in _bytes)
        print
    
def test_swap_places():
    state = ([0] * 15) + [1]
    _print_state(state, "Before: ")
    round = 0
    while not raw_input(''):
        swap_places(state, round)
        _print_state(state, "After: ")
        round += 1
        
if __name__ == "__main__":
    test_swap_places()
    