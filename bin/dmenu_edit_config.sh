#!/bin/sh

EDITOR=nvim
name=$(echo scripts sxhkd dwm dmenu autostart lf tmux nvim scripts i3 bspwm polybar | sed "s/ /\n/g" | dmenu -p "Edit config file > ")
if [ -z "$name" ]; then
	exit 1
fi

Open() {
	exec ${TERMINAL:-alacritty} -e $EDITOR "$1"
}

case "$name" in
    "dwm") Open /home/aarya/git/dwm ;;
    "dmenu") Open /home/aarya/git/dmenu ;;
	"i3") Open /home/aarya/.config/i3/config ;;
	"sxhkd") Open /home/aarya/.config/sxhkd/sxhkdrc ;;
	"polybar") Open /home/aarya/.config/polybar/config.ini ;;
	"lf") Open /home/aarya/.config/lf/lfrc ;;
	"tmux") Open /home/aarya/.tmux.conf ;;
	"bspwm") Open /home/aarya/.config/bspwm/bspwmrc ;;
	"autostart") Open /home/aarya/bin/autostart.sh ;;
	"nvim") Open /home/aarya/.config/nvim/init.vim ;;
	"scripts") Open "$(fd . /home/aarya/bin | dmenu -p 'Select file: ' -l 20)" ;;
	*) Open "$(fd . $HOME/.config | grep -m 1 -iE '$name')" ;;
esac
