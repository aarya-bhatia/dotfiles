import sys
import os
import subprocess
import shutil

prog = "rm -rf"

if shutil.which("trash-put"):
    prog = "trash-put"

files = os.getenv("fx").splitlines()
all = False

for file in files:
    if not all:
        sys.stdout.write(f"Remove {file}? [y(es)/n(o)/a(ll)/q(uit)] ")
        sys.stdout.flush()
        ans = sys.stdin.readline().strip()[0]
        if ans == 'a':
            all = True
        elif ans == 'q':
            break

    if all or ans == 'y':
        print(f"Removing {file}")
        cmd = prog.split() + [file]
        subprocess.run(cmd)

