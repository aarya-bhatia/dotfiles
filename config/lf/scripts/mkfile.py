import os
filename = input("Enter file name:").strip()
print("pwd: ", os.getcwd())
if not os.path.exists(filename):
    open(filename, "w").close()
