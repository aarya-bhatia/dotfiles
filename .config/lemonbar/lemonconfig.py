#!/usr/bin/env python3
from bar import Bar
from lemonserver import LemonManager
from module import Module, UPDATE_WITH_SIGNAL, UPDATE_PERSIST, INTERVAL_NONE
import colors
import queue
import subprocess

socket_file = "/tmp/lemonbar.sock"

module_i3 = "/home/aarya/scripts/lemonbar/i3.py"
module_date = "/home/aarya/scripts/lemonbar/date.sh"
module_wifi = "/home/aarya/scripts/lemonbar/wifi.sh"
module_disk = "/home/aarya/scripts/disk.py"
module_weather = "/home/aarya/scripts/weather.py"
module_battery = "/home/aarya/scripts/lemonbar/battery.sh"
module_kernel = "/home/aarya/scripts/lemonbar/kernel.sh"
module_volume = "/home/aarya/scripts/lemonbar/volume.sh"
module_brightness = "/home/aarya/scripts/lemonbar/brightness.sh"
module_dunst = "/home/aarya/scripts/lemonbar/dunst.sh"


def switch_to_workspace(name):
    # i3.command("workspace " + name)
    pass


def launch_app(*args):
    subprocess.Popen([*args])


def launch_terminal(*args):
    subprocess.Popen(["alacritty", "--class", "info",
                     "--hold", "-e", "bash", "-c", *args])


if __name__ == "__main__":
    bar = Bar()

    # active_window = "/home/aarya/scripts/lemonbar/active_window.sh"
    # bar.add_left(Module(bar, id="active_window", active_window, 0, 0.5, bg_color=colors.BACKGROUND_COLOR))  # noqa

    update_signal = queue.Queue()

    print("loading...", flush=True)

    manager = LemonManager(bar, update_signal=update_signal)

    # bar.add_left(Module(command=module_i3,
    #                     method=UPDATE_PERSIST,
    #                     interval=0,
    #                     escape=False,
    #                     maxlen=-1,
    #                     id="i3",
    #                     button=True,
    #                     update_signal=update_signal))

    bar.add_right(Module(command=module_kernel,
                         method=0,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="kernel",
                         update_signal=update_signal))

    bar.add_right(Module(command=module_disk,
                         method=0,
                         interval=300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id=None,
                         update_signal=update_signal))

    bar.add_right(Module(command=module_battery,
                         method=0,
                         interval=5,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="battery",
                         update_signal=update_signal))

    bar.add_right(Module(command=module_weather,
                         method=0,
                         interval=300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="weather",
                         update_signal=update_signal))

    bar.add_right(Module(command=module_volume,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="volume",
                         update_signal=update_signal))

    bar.add_right(Module(command=module_brightness,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="brightness",
                         button=False,
                         update_signal=update_signal))

    bar.add_right(Module(command=module_wifi,
                         method=0,
                         interval=300,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="wifi",
                         escape=False,
                         update_signal=update_signal))

    bar.add_right(Module(command=module_dunst,
                         method=UPDATE_WITH_SIGNAL,
                         interval=INTERVAL_NONE,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="dunst",
                         button=True,
                         update_signal=update_signal))

    bar.add_right(Module(command=module_date,
                         method=0,
                         interval=10,
                         underline=colors.UNDERLINE_COLOR,
                         bg_color=colors.BACKGROUND_COLOR,
                         id="date",
                         update_signal=update_signal))

    manager.start()
