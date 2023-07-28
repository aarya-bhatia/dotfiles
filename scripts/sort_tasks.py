#!/usr/bin/python3
import sys

todos = []
doing = []
done = []
other = []

# TODO: use a markdown parser to handle sublists

for line in sys.stdin:
    if line[-1] == '\n':
        line = line[:-1]

    if "TODO" in line:
        todos.append(line)
    elif "DOING" in line:
        doing.append(line)
    elif "DONE" in line:
        done.append(line)
    else:
        other.append(line)

for line in todos + doing + done + other:
    print(line)

