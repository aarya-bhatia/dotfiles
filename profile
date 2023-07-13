#!/bin/sh

[ -f ~/.bashrc ] && source ~/.bashrc

# default file permission mask
umask 0027

if command -v neofetch 2>&1 >/dev/null; then
	neofetch
fi

