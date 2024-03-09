#!/usr/bin/env python3
from bar import Bar
from module import Module, UPDATE_WITH_SIGNAL
import signal
import time
import colors
import sys

bar = Bar()


def sigusr1_handler(signum, frame):
    sys.stderr.write("Received SIGUSR1 signal\n")
    for module in bar.left_modules + bar.right_modules + bar.center_modules:
        if module.method == UPDATE_WITH_SIGNAL:
            module.run()


def main():
    # Register the signal handler
    signal.signal(signal.SIGUSR1, sigusr1_handler)

    active_window = "/home/aarya/scripts/lemonbar/active_window.sh"
    date = "/home/aarya/scripts/lemonbar/date.sh"
    wifi = "/home/aarya/scripts/lemonbar/wifi.sh"
    disk = "/home/aarya/scripts/disk.py"
    weather = "/home/aarya/scripts/weather.py"
    battery = "/home/aarya/scripts/lemonbar/battery.sh"
    kernel = "/home/aarya/scripts/lemonbar/kernel.sh"
    volume = "/home/aarya/scripts/lemonbar/volume.sh"
    brightness = "/home/aarya/scripts/lemonbar/brightness.sh"

    bar.add_left(Module(active_window, 0, 0.1, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(kernel, 0, -1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(disk, 0, 120, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(battery, 0, 1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(weather, 0, 300, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(volume, UPDATE_WITH_SIGNAL, -1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(brightness, UPDATE_WITH_SIGNAL, -1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(wifi, 0, 300, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa
    bar.add_right(Module(date, 0, 1, underline=colors.UNDERLINE_COLOR, bg_color=colors.BACKGROUND_COLOR))  # noqa

    print("loading...", flush=True)
    while True:
        time.sleep(0.2)
        bar.update()


if __name__ == "__main__":
    main()
