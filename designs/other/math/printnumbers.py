# every N numbers has N as a factor
# 1 2 3 4 5 6 7 8 9
#   2   4   6   8
#     3     3     3
#         5         5
#             7
from crypto.utilities import prime_generator

def prime_generator():
    filter = dict()
    prime = 2
    filter[2] = 4    
    for number in itertools.count(3):
        if number not in filter:
            filter.appen
    
    
def generate_primes_until(n):    
    for prime in prime_generator():
        if prime < n:
            yield prime
        else:
            raise StopIteration()
            
def print_numbers_up_to(n=30):    
    print(' '.join(str(item) for item in range(n)))
    for index, p in enumerate(generate_primes_until(n)):
        spacing = ' ' * len(' '.join(str(item) for item in range(p)))
        print(spacing.join(str(item) for item in range(0, n, p)))
        
        
if __name__ == "__main__":
    import sys
    with open("numbers.txt", "w") as _file:
        _backup = sys.stdout
        sys.stdout = _file
        print_numbers_up_to(64)
        _file.flush()
    sys.stdout = _backup