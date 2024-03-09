from i3ipc import Connection, Event


def on_new_window(i3, e):
    print(f'a new window opened: {e.container.name}')


def on_workspace_focus(i3, e):
    print(f'workspace just got focus: {e.current.name}')


i3 = Connection()
workspaces = i3.get_workspaces()
outputs = i3.get_outputs()

for ws in workspaces:
    print(f'workspace: {ws.name} {ws.focused}')

for o in outputs:
    print(f'output: {o.name}')

print(i3.get_tree().find_classed("Bar")[0].id)


i3.on(Event.WINDOW_NEW, on_new_window)
i3.on(Event.WORKSPACE_FOCUS, on_workspace_focus)

i3.main()
