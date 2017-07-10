import sys

with open(sys.argv[1], 'wb') as _file:
    _file.write(sys.stdin.read())