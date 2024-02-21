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
	brightnessctl
	ctags
	curl
	dmenu
	docker
	dunst
	extra/libqalculate
	fd
	ffmpeg
	fzf
	git
	i3
	lxappearance
	man
	mpc
	mpd
	mpv
	ncmpcpp
	neofetch
	neovim
	numlockx
	pamixer
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
	sxiv
	thunar
	thunderbird
	tmux
	ufw
	valgrind
	vi
	vlc
	xcape
	xdotool
	xsel
	xss-lock
	xwallpaper
	zathura
	zathura-pdf-mupdf
)

extra=(
	archlinux-wallpaper
	breeze-gtk
	chromium
	clipmenu
	extra/perl-file-mimeinfo
	gdb
	inetutils
	keychain
	man-pages
	nodejs
	noto-fonts
	noto-fonts-emoji
	npm
	redshift
	rmlint
  	silversearcher-ag
	sxhkd
	sysstat
	texlive
	ttf-hack-nerd
	xfce4-power-manager
)

py=(flask requests trash-cli pandas numpy matplotlib ipykernel dbus-python psutil)

# install system packages
for package in "${packages[@]}"; do
	pacman -S --needed $package
done

# install python packages
if python -m venv /home/$USER/pyvenv; then
	if source /home/$USER/pyvenv/bin/activate; then
		for package in "${py[@]}"; do
			python -m pip install $package
		done
	fi
fi

# program aliases
which thunar && sudo ln -s $(which thunar) /usr/local/bin/files
which thunderbird && sudo ln -s $(which thunderbird) /usr/local/bin/mail

