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
	exuberant-ctags
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
	numlockx
	pass
	picom
	pipewire
	python3-pip
	python3-venv
	rclone
	rsync
	terminator
	thunar
	thunderbird
	tmux
	valgrind
	vlc
	xcape
	xdotool
	xsel
	zathura
)

extra=(
	xautolock
	texlive
	pavucontrol
  	silversearcher-ag
	playerctl
	xsel
	nitrogen
	acpi
	rmlint
	snap
	bleachbit
	chromium
	bluez
	bluez-tools
	blueman
	fd-find
	ufw
	redshift
	scrot
)

gnome=(
	gnome-tweaks
	gnome-shell-extension-manager
)

apt update -y

# system packages and applications
for package in "${packages[@]}"; do
	apt install $package -y
done

# python packages
which python3 && python3 -m venv pyvenv
which pip && pip install flask requests vimiv trash-cli

# program aliases
which thunar && ln -s $(which thunar) /usr/local/bin/files
which thunderbird && ln -s $(which thunderbird) /usr/local/bin/thunderbird
which gnome-control-center && ln -s $(which gnome-control-center) /usr/local/bin/settings

