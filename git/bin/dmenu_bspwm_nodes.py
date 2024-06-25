import subprocess

nodes = subprocess.run(
    ["bspc", "query", "--nodes", "--node", ".leaf"],
    capture_output=True,
    text=True
).stdout.strip().split("\n")

titles = [subprocess.run(
    ["xdotool", "getwindowname", node],
    capture_output=True,
    text=True
).stdout.strip() for node in nodes]

desktops = [subprocess.run(
    ["bspc", "query", "-D", "--names", "--node", node],
    capture_output=True,
    text=True
).stdout.strip() for node in nodes]

dmenu_input = [f"{desktop}: {title}" for desktop,
               title in zip(desktops, titles)]

dmenu_input = "\n".join(sorted(dmenu_input))

result = subprocess.run(
    ["dmenu", "-i", "-l", "20"],
    input=dmenu_input,
    capture_output=True,
    text=True
).stdout.strip()

if not result:
    exit(1)

title = result[result.index(":") + 2:]

for node, node_title in zip(nodes, titles):
    if node_title == title:
        subprocess.run(["bspc", "node", node, "-f"])
        exit(0)
