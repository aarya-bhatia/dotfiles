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
	mpv
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

apt update -y

for package in "${packages[@]}"; do
	apt install $package -y
done

which python3 && python3 -m venv pyvenv
which pip && pip install flask requests vimiv trash-cli

which thunar && ln -s $(which thunar) /usr/local/bin/files
which thunderbird && ln -s $(which thunderbird) /usr/local/bin/thunderbird

