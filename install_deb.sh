#!/bin/bash

cd $HOME

packages=(
	arandr
	bat
	brightnessctl
	build-essential
	curl
	dmenu
	dunst
	fd-find
	feh
	ffmpeg
	fzf
	git
	i3
	lxappearance
	neofetch
	neovim
	nodejs
	npm
	pass
	picom
	pipewire
	python3-pip
	python3-venv
	python3-virtualenv
	rclone
	rsync
  	silversearcher-ag
	terminator
	texlive
	thunar
	thunderbird
	tmux
	valgrind
	vlc
	xcape
	xdotool
	zathura
)

for package in "${packages[@]}"; do
	echo sudo apt install $package
done

echo python3 -m venv pyvenv
echo pip install flask requests vimiv trash-cli

ln -s $(which thunar) /usr/local/bin/files
ln -s $(which thunderbird) /usr/local/bin/thunderbird

