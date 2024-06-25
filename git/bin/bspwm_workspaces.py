#!/usr/bin/env python3
import subprocess

HIDE_INACTIVE = True

yellow = "#DFFF00"
orange = "#FFBF00"
blue = "#40E0D0"
black = "#000"
white = "#fff"
grey = "#aaa"
darkgrey = "#555"
red = "#f00"
green = "#0f0"

desktops = subprocess.run("bspc query -D --names".split(),
                          capture_output=True, text=True).stdout.strip().splitlines()


def GetFocused():
    proc = subprocess.run("bspc query -D --names -d focused".split(),
                          capture_output=True,
                          text=True)
    return proc.stdout.strip()


def GetActiveSet():
    proc = subprocess.run("bspc query -D --names -d .occupied".split(),
                          capture_output=True,
                          text=True)
    res = set()
    for line in proc.stdout.splitlines():
        res.add(line.strip())

    return res


def GetDesktops():
    focused = GetFocused()
    active = GetActiveSet()

    res = []

    for desktop in desktops:
        if desktop == focused:
            # format = "[" + desktop + "]"
            # format = f"%{{u{yellow}}}%{{+u}}{desktop}%{{-u}}"
            format = f"%{{F{yellow}}}{desktop}%{{F-}}"
        elif desktop in active:
            format = f"%{{F{grey}}}{desktop}%{{F-}}"
        else:
            format = f"%{{F{darkgrey}}}{desktop}%{{F-}}"

        format = f"%{{A1:bspc desktop -f {desktop}:}}{format}%{{A}}"

        if (desktop == focused) or (desktop in active) or (not HIDE_INACTIVE):
            res.append(format)

    print(" ".join(res), flush=True)


GetDesktops()

with subprocess.Popen(["bspc", "subscribe", "desktop_focus"], stdout=subprocess.PIPE) as p:
    while True:
        line = p.stdout.readline()
        if not line:
            break

        GetDesktops()
