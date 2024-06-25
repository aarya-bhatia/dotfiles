#!/bin/sh

TmuxAdd() {
    session="$1"
    window="$2"
    command="$3"

    if tmux has-session -t $session; then
	if tmux list-windows -t $session | grep -q "$window"; then
	    echo "Window $window already exists in session $session."
	else
	    tmux new-window -t $session -n "$window" "$command"
	    echo "Created new window $window in session $session"
	fi
    else
	echo "Creating tmux session: $session"
	tmux new-session -d -s $session -n "$window" "$command"
    fi
}
