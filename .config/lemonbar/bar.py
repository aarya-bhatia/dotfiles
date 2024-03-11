from module import Module
import sys
debug = False


class Bar:
    def __init__(self):
        self.left_modules: list[Module] = []
        self.right_modules: list[Module] = []
        self.center_modules: list[Module] = []

    def add_right(self, module: Module):
        self.right_modules.append(module)
        module.start()

    def add_left(self, module: Module):
        self.left_modules.append(module)
        module.start()

    def add_center(self, module: Module):
        self.center_modules.append(module)
        module.start()

    def has_changed(self):
        for module in self.left_modules + self.right_modules + self.center_modules:
            if module.is_changed():
                return True

        return False

    def update(self) -> bool:
        left_value = "|".join([module.get_value()
                              for module in self.left_modules])

        center_value = "|".join([module.get_value()
                                 for module in self.center_modules])

        right_value = "|".join([module.get_value()
                               for module in self.right_modules])

        new_value = f" {left_value} %{{c}}{center_value} %{{r}}{right_value}"

        any_changed = self.has_changed()

        # no updates
        if not any_changed:
            return False

        new_value += " "  # padding
        if debug:
            sys.stderr.write(new_value + "\n")

        print(new_value, flush=True)
        return True
