from module import Module, add_underline
import colors
import sys
import i3ipc
import time

WORKSPACE_IDLE = 0
WORKSPACE_ACTIVE = 1
WORKSPACE_URGENT = 2
WORKSPACE_FOCUSED = 3

IDLE_COLOR = "#F5F5F5"  # GRAY
ACTIVE_COLOR = "#FFFFFF"  # white
URGENT_COLOR = "#FF0000"  # red

i3 = i3ipc.Connection()


class WorkspaceModule(Module):
    def __init__(self):
        super().__init__()
        self.workspaces = ["I", "II", "III", "IV",
                           "V", "VI", "VII", "VIII", "IX", "X"]
        self.attributes = [WORKSPACE_IDLE for i in range(len(self.workspaces))]

    def update(self):
        # sys.stderr.write("updating workspace attributes...\n")
        for ws in i3.get_workspaces():
            # sys.stderr.write(f"{ws.name}\n")
            index = int(ws.name)-1
            if index < 0 or index >= len(self.workspaces):
                sys.stderr.write(
                    f"failed to handle workspace: {ws.name}\n")
                continue

            if ws.focused:
                self.attributes[index] = WORKSPACE_FOCUSED
            else:
                self.attributes[index] = WORKSPACE_ACTIVE

            workspaces = []
            for i in range(len(self.workspaces)):
                workspaces.append(self.format(i))

        with self.mutex:
            self.value = " ".join(workspaces)
            # sys.stderr.write(self.value + "\n")

    def format(self, index: int):
        name = self.workspaces[index]

        if self.attributes[index] == WORKSPACE_FOCUSED:
            return add_underline(name, colors.UNDERLINE_COLOR)
        elif self.attributes[index] == WORKSPACE_URGENT:
            return add_underline(name, URGENT_COLOR)
        elif self.attributes[index] == WORKSPACE_IDLE:
            return add_underline(name, IDLE_COLOR)
        elif self.attributes[index] == WORKSPACE_ACTIVE:
            return add_underline(name, ACTIVE_COLOR)

        return name

    def run(self):
        while True:
            self.update()
            time.sleep(0.5)
