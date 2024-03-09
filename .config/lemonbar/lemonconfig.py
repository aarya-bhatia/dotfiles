#!/usr/bin/env python3
from bar import Bar
from module import Module
import time
import colors


def main():
    bar = Bar()

    active_window = "/home/aarya/scripts/lemonbar/active_window.sh"
    date = "/home/aarya/scripts/lemonbar/date.sh"
    wifi = "/home/aarya/scripts/lemonbar/wifi.sh"
    disk = "/home/aarya/scripts/disk.py"
    weather = "/home/aarya/scripts/weather.py"
    battery = "/home/aarya/scripts/lemonbar/battery.sh"

    bar.add_left(Module(active_window, 0, 0.1, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(disk, 0, 120, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(battery, 0, 1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(weather, 0, 300, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(wifi, 0, 300, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(date, 0, 1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa

    print("loading...", flush=True)
    while True:
        time.sleep(1)
        bar.update()


if __name__ == "__main__":
    main()
