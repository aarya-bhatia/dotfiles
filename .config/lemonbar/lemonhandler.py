#!/usr/bin/env python3

import sys
import os
import subprocess

usei3 = False

if usei3:
    import i3ipc
    i3 = i3ipc.Connection()

    def switch_to_workspace(name):
        i3.command("workspace " + name)

else:
    def switch_to_workspace(name):
        pass


def launch_app(*args):
    subprocess.Popen([*args])


def launch_terminal(*args):
    subprocess.Popen(["alacritty", "--class", "info",
                     "--hold", "-e", "bash", "-c", *args])


def send_message(message):
    with open("/tmp/lemonbar.fifo", "w") as pipe:
        pipe.write(message + "\n")


while True:
    line = sys.stdin.readline().strip()
    print(f"handling: {line}")
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
        os.system("/home/aarya/scripts/lemonbar/dunst.sh --click")
        send_message("dunst")

    elif line == "bluetooth":
        os.system("bluetooth toggle")
        send_message("bluetooth")

    elif line == "date":
        launch_terminal("cal")

    else:
        print("unknown handler: " + line)
