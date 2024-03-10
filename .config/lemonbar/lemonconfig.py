#!/usr/bin/env python3
from bar import Bar
from module import Module, UPDATE_WITH_SIGNAL, UPDATE_PERSIST, INTERVAL_NONE
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

    i3 = "/home/aarya/scripts/lemonbar/i3.py"
    date = "/home/aarya/scripts/lemonbar/date.sh"
    wifi = "/home/aarya/scripts/lemonbar/wifi.sh"
    disk = "/home/aarya/scripts/disk.py"
    weather = "/home/aarya/scripts/weather.py"
    battery = "/home/aarya/scripts/lemonbar/battery.sh"
    kernel = "/home/aarya/scripts/lemonbar/kernel.sh"
    volume = "/home/aarya/scripts/lemonbar/volume.sh"
    brightness = "/home/aarya/scripts/lemonbar/brightness.sh"
    bluetooth = "/home/aarya/scripts/lemonbar/bluetooth.sh"
    dunst = "/home/aarya/scripts/lemonbar/dunst.sh"

    # active_window = "/home/aarya/scripts/lemonbar/active_window.sh"
    # bar.add_left(Module(bar, active_window, 0, 0.5, bg_color=colors.BACKGROUND_COLOR))  # noqa

    bar.add_left(Module(bar, i3, UPDATE_PERSIST, 0, escape=False, maxlen=-1))

    bar.add_right(Module(bar, kernel, 0, INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR))

    bar.add_right(Module(bar, disk, 0, 120, underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name=None))

    bar.add_right(Module(bar, battery, 0, 1, underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="battery"))

    bar.add_right(Module(bar, weather, 0, 300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="weather"))

    bar.add_right(Module(bar, volume, UPDATE_WITH_SIGNAL, INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="volume"))

    bar.add_right(Module(bar, brightness, UPDATE_WITH_SIGNAL, INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name=None))

    bar.add_right(Module(bar, bluetooth, UPDATE_WITH_SIGNAL, INTERVAL_NONE,
                         underline=None, escape=False,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="bluetooth"))

    bar.add_right(Module(bar, dunst, UPDATE_WITH_SIGNAL, INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="dunst"))

    bar.add_right(Module(bar, wifi, 0, 300, underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="wifi"))

    bar.add_right(Module(bar, date, 0, 1, underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         handler_name="date"))

    print("loading...", flush=True)
    while True:
        time.sleep(5)
        bar.update()


if __name__ == "__main__":
    main()
