import os


cwd = os.getcwd()
a = 100
b = 2000
with open('output.txt', 'w') as f:
    f.write(str(a+b))