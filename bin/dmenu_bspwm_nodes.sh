#!/bin/bash

nodes=()
titles=()
desktops=()

declare -i count
count=0

for node in $(bspc query --nodes --node .leaf); do
	nodes+=("$node")
	titles+=("$(xdotool getwindowname $node)")
	desktops+=("$(bspc query -D --names --node $node)")
	count+=1
done

PrintNodes() {
	for ((i = 0 ; i < $count ; i++)); do
		echo ${desktops[i]}: ${titles[i]}
	done
}

result=$(PrintNodes | sort | dmenu -l 20 -i)

if [ -z "$result" ]; then
	exit 1
fi

title=$(echo $result | awk -F':' '{print $2}' | sed 's/^.//')

for ((i = 0 ; i < $count ; i++)); do
	if [ "${titles[i]}" = "$title" ]; then
		bspc node ${nodes[i]} -f
		exit 0
	fi
done
