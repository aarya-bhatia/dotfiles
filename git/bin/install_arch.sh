#!/bin/bash

cd $HOME

packages=(
	acpi
	arandr
	base-devel
	bat
	blueman
	bluez
	bluez-tools
	breeze-gtk
	brightnessctl
	chromium
	clang
	clipmenu
	ctags
	curl
	dmenu
	docker
	dunst
	extra/libqalculate
	extra/perl-file-mimeinfo
	fd
	ffmpeg
	font-manager
	fzf
	gdb
	git
	i3
	i3blocks
	i3status
	inetutils
	jq
	keychain
	lxappearance
	man
	man-pages
	mpc
	mpd
	mpv
	ncmpcpp
	neofetch
	neovim
	noto-fonts
	numlockx
	openbsd-netcat
	openconnect
	optipng
	pamixer
	pass
	pavucontrol
	picom
	pipewire
	playerctl
	python-pip
	python-virtualenv
	qt5ct
	rclone
	redshift
	rsync
	scrot
	sxiv
	sysstat
	thunar
	thunderbird
	tmux
	ufw
	unzip
	valgrind
	vim
	vlc
	xcape
	xdotool
	xfce4-power-manager
	xorg-xev
	xorg-xprop
	xorg-xset
	xsel
	xss-lock
	xwallpaper
	zathura
	zathura-pdf-mupdf
)

extra=(
	archlinux-wallpaper
	breeze
	bspwm
	lemonbar-xft-git
	nodejs
	npm
	polybar
	rmlint
	sddm
  	silversearcher-ag
	stalonetray
	sxhkd
	texlive
	ttf-hack-nerd
	visual-studio-code-bin
	bsp-layout
	zoom
)

py=(
	clang-format
	dbus-python
	disutils
	flask
	ipykernel
	matplotlib
	numpy
	pandas
	psutil
	python-dotenv
	requests
	trash-cli
)

# update packages
pacman -Syu

# install system packages
echo ${packages[@]} | xargs pacman -S --needed

# install python packages in virtual environment
# if python -m venv /home/$USER/pyvenv; then
# 	if source /home/$USER/pyvenv/bin/activate; then
# 		echo ${py[@]} | xargs python -m pip install $package
# 	fi
# fi

# program aliases
if [ ! -f /usr/local/bin/files ]; then
	if which thunar; then
		ln -s $(which thunar) /usr/local/bin/files
	fi
fi

if [ ! -f /usr/local/bin/mail ]; then
	if which thunderbird; then
		ln -s $(which thunderbird) /usr/local/bin/mail
	fi
fi

