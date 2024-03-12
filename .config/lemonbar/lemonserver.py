# import socket
import sys
import os
import queue
import threading
import bar
from module import UPDATE_WITH_SIGNAL

debug = False


class LemonManager:
    def __init__(self, bar: bar.Bar,
                 sock_file="/tmp/lemonbar.sock",
                 fifo_file="/tmp/lemonbar.fifo",
                 update_interval: int = 10,
                 update_signal: queue.Queue = None):

        self.bar = bar
        self.update_interval = update_interval
        self.messages = queue.Queue()
        self.socket_file = sock_file
        self.fifo_file = fifo_file
        self.update_signal = update_signal

        self.handler_thread = threading.Thread(
            target=LemonManager.run_message_handler, args=[self])

        self.update_thread = threading.Thread(
            target=LemonManager.run_update_loop, args=[self])

        self.listener_thread = threading.Thread(
            target=LemonManager.run_listener, args=[self])

    def start(self):
        self.handler_thread.start()
        self.update_thread.start()
        self.listener_thread.start()

    def run_message_handler(lemon):
        lemon.message_handler()

    def run_update_loop(lemon):
        lemon.update_loop()

    def run_listener(lemon):
        lemon.server_listener()

    def update_loop(self):
        while True:
            try:
                self.update_signal.get(timeout=self.update_interval)

                while True:
                    # flush any pending signals as
                    # it is handled with the next update
                    try:
                        self.update_signal.get(block=False)
                    except queue.Empty:
                        break

                if debug:
                    sys.stderr.write("update requested...\n")

                self.bar.update()

            except queue.Empty:
                if debug:
                    sys.stderr.write("timeout... checking for updates\n")

                self.bar.update()

    def message_handler(self):
        while True:
            message = self.messages.get(True)
            if not message:
                continue

            message = message.strip()
            sys.stderr.write(f"message: {message}\n")

            modules = self.bar.left_modules + \
                self.bar.right_modules + \
                self.bar.center_modules

            for module in modules:
                if module.method == UPDATE_WITH_SIGNAL \
                        and module.id == message:
                    module.run()
                    break

    def server_listener(self):
        sys.stderr.write("Server is listening...\n")
        os.system(f"/usr/bin/rm -rf {self.fifo_file}")
        # os.system("/usr/bin/rm -rf " + self.socket_file)
        # server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)
        # server_socket.bind(self.socket_file)
        os.mkfifo(self.fifo_file)
        with open(self.fifo_file, "r") as pipe:
            while True:
                data = pipe.readline()
                if not data:
                    continue

                if data[-1] == '\n':
                    data = data[:-1]

                self.messages.put(data)

                if debug:
                    sys.stderr.write(f"Received from client: {data}\n")
        # try:
        #     while True:
        #         data = server_socket.recv(1024).decode()
        # finally:
        #     server_socket.close()
        os.unlink(self.socket_file)
