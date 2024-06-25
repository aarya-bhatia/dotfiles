#!/usr/bin/env python3
import os
from datetime import datetime
import subprocess
import sys

TMP_DIR = "/tmp/bulkedit"
os.makedirs(TMP_DIR, exist_ok=True)
timestamp = str(datetime.now().timestamp())
tmp_filename = os.path.join(TMP_DIR, timestamp)

visited = set()
filenames = []

for line in sys.stdin:
    filenames.append(os.path.basename(line.strip()))

with open(tmp_filename, "w") as tmp:
    for i in range(len(filenames)):
        tmp.write(f"{i:03d} {filenames[i]}\n")

if subprocess.call([os.getenv("EDITOR", "vim"), tmp_filename]) == 0:
    with open(tmp_filename, "r") as tmp_file:
        for line in tmp_file:
            tokens = line.split(" ")
            if len(tokens) < 2:
                ans = input(f"create file {line}? [y/n]").strip()
                if (ans == 'y'):
                    f = os.open(line)
                    f.close()

            file_index = int(tokens[0]).strip()
            file_name = " ".join(tokens[1:]).strip()
            if file_index >= len(filenames):
                print("illegal file index")
                exit(1)

            if file_index not in visited:
                old_name = filenames[file_index]
                if os.path.exists(file_name):
                    os.rename(file_name, file_name + ".bak")
                os.rename(old_name, file_name)

            visited.add(file_index)

        for i in range(len(filenames)):
            if i not in visited:
                ans = input(f"remove {filenames[i]}? [y/n] ").strip()
                if (ans == 'y'):
                    os.remove(filenames[i])


os.remove(tmp_filename)
