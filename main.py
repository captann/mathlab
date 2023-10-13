import os
from config import *



file = f"sem_0{sem_n}_matrix_decomp.m"

print(f"Mode: {state};" + "\n" + f"File: {file}" + "\n" + f'Is_exit: {bool(is_exit)}')
print("---------")
if state == "r":
    if os.path.isfile(file):
        print("Runned command: " + f'''matlab -nosplash -nodesktop -r "run('{file}'){is_exit * ';'}{is_exit * 'exit'};"''')
        os.system(f'''matlab -nosplash -nodesktop -r "run('{file}'); {is_exit * 'exit'};"''')
        print("done!")
    else:
        print("No file!")
        exit()
elif state == 'c':
    if not os.path.isfile(file):
        with open(f"{file}", "w+", encoding="utf-8") as f:
            f.write("""clc
clear variables
close all
N = 5;
A = rand(N);
""")
        print("done!")
    else:
        print("Exist!")
        exit()
elif state == 'rw':
    with open(f"{file}", "w+", encoding="utf-8") as f:
        f.write("""clc
    clear variables
    close all
    N = 5;
    A = rand(N);
    """)
    print("done")
else:
    print("Not found!")