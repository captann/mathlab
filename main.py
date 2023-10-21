import os
from config import *
from colorama import init, Fore

init(autoreset=True)
matrix = int(matrix) * "matrix_"
file = f"{type}_0{sem_n}_{matrix}{sec_name}.m"
print(
    Fore.WHITE + f"Mode:     {Fore.GREEN + state};" + "\n" + Fore.WHITE + f"File:     {Fore.GREEN + file}" + "\n" + Fore.WHITE + f'Is_exit:  {Fore.GREEN + str(bool(is_exit))}' + '\n' + Fore.WHITE + f"Sec_name: {Fore.GREEN + sec_name}" + '\n' + Fore.WHITE + f"Type:     {Fore.GREEN + type}" + "\n"+ Fore.WHITE + f"Matrix:   {Fore.GREEN + str(bool(matrix))}")
print(Fore.WHITE + "---------")
print(Fore.RED + "NOT USE IN PYCHARM! CMD ONLY!")
print(Fore.YELLOW + "Correct?... ", end='')
abc = input()
if abc != 'y':
    print(Fore.RED + 'Interrupted!')
    exit()
if state == "r":
    if os.path.isfile(type + "\\" + file):
        s = type + "\\" + file

        print(
            Fore.WHITE + "Runned command: " + Fore.GREEN +  f'''matlab -nosplash -nodesktop -r "run('{s}'){is_exit * ';'}{is_exit * 'exit'};"''')
        os.system(
            f'''matlab -nosplash -nodesktop -r "run('{s}'); {is_exit * 'exit'};"''')
        print(Fore.BLUE + "Done!")
    else:
        print(Fore.RED + "No file!")
        exit()
elif state == 'c':
    if not os.path.isfile(file):
        with open(type + "\\" + file, "w+", encoding="utf-8") as f:
            f.write("""
N = 5;
A = rand(N);
""")
        print(Fore.BLUE + "Done!")
    else:
        print(Fore.RED + "Exist!")
        exit()
elif state == 'rw':
    with open(type + "\\" + file, "w+", encoding="utf-8") as f:
        f.write("""clc
    clear variables
    close all
    N = 5;
    A = rand(N);
    """)
    print(Fore.BLUE + "Done")
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
    print(Fore.BLUE + 'Done!')
else:
    print(Fore.RED + "Not found!")
