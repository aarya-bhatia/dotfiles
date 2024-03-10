#!/usr/bin/env python3

import sys
import os
import i3ipc
import subprocess

i3 = i3ipc.Connection()


def switch_to_workspace(name):
    i3.command("workspace " + name)


def launch_app(*args):
    subprocess.Popen([*args])


def launch_terminal(*args):
    subprocess.Popen(["alacritty", "--class", "info",
                     "--hold", "-e", "bash", "-c", *args])


while True:
    line = sys.stdin.readline().strip()
    if not line:
        break

    if line.startswith("workspace-"):
        switch_to_workspace(line[len("workspace-"):])

    elif line == "disk":
        launch_terminal("df", "-sh")

    elif line == "battery":
        launch_terminal("acpi")

    elif line == "weather":
        launch_terminal("curl", "https://wttr.in/")

    elif line == "volume":
        launch_app("pavucontrol")

    elif line == "brightness":
        pass

    elif line == "wifi":
        launch_terminal("nmtui")

    elif line == "dunst":
        os.system(
            "dunstctl set-paused toggle && kill -10 $(pgrep -f lemonconfig.py)")

    elif line == "bluetooth":
        os.system("bluetooth toggle && kill -10 $(pgrep -f lemonconfig.py)")

    elif line == "date":
        launch_terminal("cal")

    else:
        sys.stderr.write("unknown handler: " + line)
