from math import sqrt

from crypto.utilities import integer_to_bytes

from PIL import Image
       
def visualize_diffusion(permutation, state, design_name, state_to_bytes=lambda state: state, image_size=600, rounds=4):
    state_size = int(sqrt(len(state_to_bytes(state))))
    for round in range(rounds):
        _state = state_to_bytes(state) 
        print state, _state
        image = Image.frombytes("L", (state_size, state_size), _state)
        image = image.resize((image_size, image_size))
        image.save("./" + design_name + "{}.bmp".format(round))
        state = permutation(*state)
        
def test_visualize_diffusion():
    from crypto.designs.nonlinear.permutation.piltestpermutation import permutation
    def state_to_bytes(state):
        output = []
        for integer in state:            
            output.extend(bytes(integer_to_bytes(integer, 4)))        
        return ''.join(output)
    white = int("1111 1111 1100 0000 1000 0000 0100 0000".replace(' ', ''), 2)
    state = (white, 0, 0, 0)
    visualize_diffusion(permutation, state, "piltestpermutation", state_to_bytes)
        
if __name__ == "__main__":
    test_visualize_diffusion()
    