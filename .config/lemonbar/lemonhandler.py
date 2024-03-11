#!/usr/bin/env python3

import socket
import sys
import os
import i3ipc
import subprocess

i3 = i3ipc.Connection()

socket_file = "/tmp/lemonbar.sock"
if not os.path.exists(socket_file):
    print("socket file does not exist")
    os.exit(1)


def switch_to_workspace(name):
    i3.command("workspace " + name)


def launch_app(*args):
    subprocess.Popen([*args])


def launch_terminal(*args):
    subprocess.Popen(["alacritty", "--class", "info",
                     "--hold", "-e", "bash", "-c", *args])


with socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as client_socket:
    client_socket.connect(socket_file)

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
            os.system("dunstctl set-paused toggle")
            client_socket.send("dunst".encode())

        elif line == "bluetooth":
            os.system("bluetooth toggle")
            client_socket.send("bluetooth".encode())

        elif line == "date":
            launch_terminal("cal")

        else:
            print("unknown handler: " + line)
