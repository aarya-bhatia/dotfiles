from module import Module

MAX_LENGTH = 120


class Bar:
    def __init__(self):
        self.left_modules: list[Module] = []
        self.right_modules: list[Module] = []
        self.center_modules: list[Module] = []
        self.prev_value = ""

    def add_right(self, module: Module):
        self.right_modules.append(module)
        module.start()

    def add_left(self, module: Module):
        self.left_modules.append(module)
        module.start()

    def add_center(self, module: Module):
        self.center_modules.append(module)
        module.start()

    def update(self):
        left_value = "|".join([module.get_value()[:MAX_LENGTH]
                              for module in self.left_modules])

        center_value = "|".join([module.get_value()[:MAX_LENGTH]
                                 for module in self.center_modules])

        right_value = "|".join([module.get_value()[:MAX_LENGTH]
                               for module in self.right_modules])

        new_value = f"{left_value} %{{c}}{center_value} %{{r}}{right_value}"

        # no updates
        if new_value == self.prev_value:
            return

        new_value = new_value + " "  # padding
        print(new_value, flush=True)
        # sys.stderr.write(new_value + "\n")
        self.prev_value = new_value
