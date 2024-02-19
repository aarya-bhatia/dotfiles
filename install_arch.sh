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
	bleachbit
	breeze-gtk
	chromium
	clipmenu
	extra/perl-file-mimeinfo
	feh
	inetutils
	nitrogen
	nodejs
	noto-fonts
	npm
	sysstat
	man-pages
	redshift
	rmlint
  	silversearcher-ag
	sxhkd
	texlive
	ttf-hack-nerd
	xautolock
	xfce4-power-manager
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

