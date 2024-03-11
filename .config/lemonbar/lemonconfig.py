#!/usr/bin/env python3
from lemonserver import LemonManager
from bar import Bar
from module import Module, UPDATE_WITH_SIGNAL, UPDATE_PERSIST, INTERVAL_NONE
import queue
import colors

i3 = "/home/aarya/scripts/lemonbar/i3.py"
date = "/home/aarya/scripts/lemonbar/date.sh"
wifi = "/home/aarya/scripts/lemonbar/wifi.sh"
disk = "/home/aarya/scripts/disk.py"
weather = "/home/aarya/scripts/weather.py"
battery = "/home/aarya/scripts/lemonbar/battery.sh"
kernel = "/home/aarya/scripts/lemonbar/kernel.sh"
volume = "/home/aarya/scripts/lemonbar/volume.sh"
brightness = "/home/aarya/scripts/lemonbar/brightness.sh"
dunst = "/home/aarya/scripts/lemonbar/dunst.sh"

if __name__ == "__main__":
    bar = Bar()

    # active_window = "/home/aarya/scripts/lemonbar/active_window.sh"
    # bar.add_left(Module(bar, id="active_window", active_window, 0, 0.5, bg_color=colors.BACKGROUND_COLOR))  # noqa

    update_signal = queue.Queue()

    print("loading...", flush=True)

    manager = LemonManager(bar, update_signal=update_signal)

    bar.add_left(Module(command=i3,
                        method=UPDATE_PERSIST,
                        interval=0,
                        escape=False,
                        maxlen=-1,
                        id="i3",
                        button=True,
                        update_signal=update_signal))

    bar.add_right(Module(command=kernel,
                         method=0,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="kernel",
                         update_signal=update_signal))

    bar.add_right(Module(command=disk,
                         method=0,
                         interval=120,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id=None,
                         update_signal=update_signal))

    bar.add_right(Module(command=battery,
                         method=0,
                         interval=1,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="battery",
                         update_signal=update_signal))

    bar.add_right(Module(command=weather,
                         method=0,
                         interval=300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="weather",
                         update_signal=update_signal))

    bar.add_right(Module(command=volume,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="volume",
                         update_signal=update_signal))

    bar.add_right(Module(command=brightness,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="brightness",
                         button=False,
                         update_signal=update_signal))

    bar.add_right(Module(command=dunst,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="dunst",
                         button=True,
                         update_signal=update_signal))

    bar.add_right(Module(command=wifi,
                         method=0,
                         interval=300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="wifi",
                         update_signal=update_signal))

    bar.add_right(Module(command=date,
                         method=0,
                         interval=1,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="date",
                         update_signal=update_signal))

    manager.start()
