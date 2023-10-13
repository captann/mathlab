import os
from config import *


file = f"{type}_0{sem_n}_matrix_decomp.m"

print(f"Mode: {state};" + "\n" + f"File: {file}" + "\n" + f'Is_exit: {bool(is_exit)}' + '\n' +  f"Type: {type}")
print("---------")
abc = input("Correct?... ")
if abc != 'y':
    exit()
if state == "r":
    if os.path.isfile(type + "\\" + file):
        s = type + "\\" + file

        print("Runned command: " + f'''matlab -nosplash -nodesktop -r "run('{s}'){is_exit * ';'}{is_exit * 'exit'};"''')
        os.system(f'''matlab -nosplash -nodesktop -r "run('{s}'); {is_exit * 'exit'};"''')
        print("done!")
    else:
        print("No file!")
        exit()
elif state == 'c':
    if not os.path.isfile(file):
        with open(type + "\\" + file, "w+", encoding="utf-8") as f:
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
    with open(type + "\\" + file, "w+", encoding="utf-8") as f:
        f.write("""clc
    clear variables
    close all
    N = 5;
    A = rand(N);
    """)
    print("done")
elif state == 'g':
    from datetime import datetime
    with open("atg", "r", encoding='utf-8') as f:
        a = f.read()
    b = a
    time = "git commit -m " + '"' + str(datetime.now()) + '"'
    a = a.replace("Z", time)
    with open("atg", "w", encoding='utf-8') as f:
        f.write(a)
    os.system("cmd < atg")
    with open("atg", "w", encoding='utf-8') as f:
        f.write(b)
    print('done!')
else:
    print("Not found!")