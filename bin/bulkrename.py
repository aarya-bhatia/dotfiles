#!/usr/bin/env python3
import os
from datetime import datetime
import subprocess
import sys

filenames = []

for line in sys.stdin:
    filenames.append(os.path.basename(line.strip()))

print(filenames)

if len(filenames) == 0:
    print("No files were selected.")
    exit(0)

os.makedirs("/tmp/lf", exist_ok=True)
timestamp = str(datetime.now().timestamp())
tmp_filename = os.path.join("/tmp/lf", timestamp)

added = []

with open(tmp_filename, "w") as tmp:
    for filename in filenames:
        if os.path.isfile(filename) or os.path.islink(filename) or os.path.isdir(filename):
            tmp.write(filename + "\n")
            added.append(filename)

count = 0

if subprocess.call(["nvim", tmp_filename]) == 0:
    with open(tmp_filename, "r") as tmp:
        edited = tmp.readlines()

        if len(added) != len(edited):
            print("Error: Unexpected number of lines")
            exit(1)

        for i in range(len(added)):
            old_filename = added[i]
            new_filename = edited[i].strip()

            if new_filename == "" or old_filename == new_filename:
                continue

            if new_filename[-1] == "\n":
                new_filename = new_filename[:-1]

            if os.path.exists(new_filename):
                print(f"FAIL: '{old_filename}' -> '{new_filename}'")
                continue

            print(f"OK: {old_filename} -> {new_filename}")
            os.rename(old_filename, new_filename)
            count += 1


os.remove(tmp_filename)
