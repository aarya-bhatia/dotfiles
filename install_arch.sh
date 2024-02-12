#!/bin/bash

cd $HOME

packages=(
	acpi
	arandr
	base-devel
	bat
	blueman
	brightnessctl
	curl
	dmenu
	dunst
	man
	ctags
	extra/libqalculate
	fd
	feh
	ffmpeg
	fzf
	git
	i3
	lxappearance
	mpc
	mpd
	mpv
	ncmpcpp
	neofetch
	neovim
	numlockx
	pass
	pavucontrol
	picom
	pipewire
	playerctl
	python-pip
	python-virtualenv
	rclone
	rsync
	scrot
	sxhkd
	sxiv
	thunar
	thunderbird
	tmux
	ufw
	valgrind
	vlc
	xcape
	xdotool
	xsel
	zathura
)

extra=(
	nodejs
	npm
	bleachbit
	bluez
	bluez-tools
	chromium
	nitrogen
	redshift
	rmlint
  	silversearcher-ag
	snap
	texlive
	xautolock
)

# system packages and applications
for package in "${packages[@]}"; do
	pacman -S --needed $package
done

# python packages
if python -m venv /home/$USER/pyvenv; then
	if source /home/$USER/pyvenv/bin/activate; then
		python -m pip install flask requests trash-cli pandas numpy matplotlib ipykernel dbus-python
	fi
fi

# program aliases
which thunar && ln -s $(which thunar) /usr/local/bin/files
which thunderbird && ln -s $(which thunderbird) /usr/local/bin/thunderbird

