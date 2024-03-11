from threading import Lock, Thread
import sys
import subprocess
import time
import queue

UPDATE_WITH_INTERVAL = 0
UPDATE_WITH_SIGNAL = 1
UPDATE_PERSIST = 2
INTERVAL_NONE = -1


def add_button_handler(string, name):
    return f"%{{A:{name}:}}{string}%{{A}}"


def add_fg_color(string, color):
    return f"%{{F{color}}} {string} %{{F-}}"


def add_bg_color(string, color):
    return f"%{{B{color}}} {string} %{{B-}}"


def add_underline(string, color):
    return f"%{{U{color}}}%{{+u}}{string}%{{-u}}%{{U-}}"


class Module(Thread):
    def __init__(self,
                 command: str = "",
                 method: int = 0,
                 interval: int = 1,
                 id: str = "",
                 fg_color: str | None = None,
                 bg_color: str | None = None,
                 underline: str | None = None,
                 escape: bool = True,
                 maxlen: int = 120,
                 button: bool = False,
                 update_signal: queue.Queue = None):

        Thread.__init__(self)
        self.daemon = True
        self.command = command
        self.method = method
        self.interval = max(interval, 0.1)
        self.mutex = Lock()
        self.fg_color = fg_color
        self.bg_color = bg_color
        self.u_color = underline
        self.escape = escape
        self.update_signal = update_signal
        self.maxlen = maxlen
        self.id = id
        self.button = button

        self.value = None
        self.has_changed = False

    def format_value(self, value):
        if self.escape:
            value = value.replace("%", "%%")

        if self.maxlen > 0:
            value = value[:self.maxlen]

        if self.fg_color:
            value = add_fg_color(value, self.fg_color)

        if self.bg_color:
            value = add_bg_color(value, self.bg_color)

        if self.u_color:
            value = add_underline(value, self.u_color)

        if self.button:
            value = add_button_handler(value, self.id)

        return value

    def get_value(self):
        with self.mutex:
            if not self.value:
                return self.format_value("")

            return self.format_value(self.value)

    def is_changed(self):
        with self.mutex:
            ret = self.has_changed
            self.has_changed = False
            return ret

    def run(self):
        while True:
            try:
                process = subprocess.Popen(["/bin/bash", "-c", self.command],
                                           stdout=subprocess.PIPE,
                                           stderr=subprocess.PIPE,
                                           text=True)

                if self.method == UPDATE_PERSIST:
                    while True:
                        value = process.stdout.readline().strip()
                        if not value:
                            return

                        with self.mutex:
                            if not self.value or value != self.value:
                                self.has_changed = True
                                self.value = value
                                # sys.stderr.write(f"module {self.id} changed\n")

                        self.update_signal.put(True)

                stdout, stderr = process.communicate()
                value = str(stdout).strip()
                sys.stderr.write(stderr)

                with self.mutex:
                    if not self.value or value != self.value:
                        self.has_changed = True
                        self.value = value
                        # sys.stderr.write(f"module {self.id} changed\n")

                if self.method == UPDATE_WITH_SIGNAL:
                    self.update_signal.put(True)
                    return

                if self.interval <= 0:
                    return

                time.sleep(self.interval)

            except KeyboardInterrupt:
                if process.poll() is None:
                    process.terminate()
