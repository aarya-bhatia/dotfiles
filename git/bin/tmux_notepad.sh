#!/bin/bash

session="notepad"

source tmux_manager.sh

TmuxAdd $session weather ~/scripts/tmux_sessions/check_weather.sh
TmuxAdd $session notes ~/scripts/tmux_sessions/open_notes.sh
TmuxAdd $session todos ~/scripts/tmux_sessions/check_todos.sh
TmuxAdd $session contacts abook

tmux attach -t $session


