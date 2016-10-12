import sys
import os

def generate_asm_dump(filename, optimization_flag="-O2"):
    os.system("gcc {}.c -o {}.exe {}".format(filename, filename, optimization_flag))
    os.system("objdump -M intel -d {}.exe | python -m crypto.dump {}.asm".format(filename, filename))

if __name__ == "__main__":
    generate_asm_dump(sys.argv[1])
    