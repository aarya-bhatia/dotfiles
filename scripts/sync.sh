#!/bin/sh

mkdir -p ~/dotfiles/config

copyignore="/home/aarya/dotfiles/copyignore"
opts="-avu --exclude-from=$copyignore"
directories=(
"$HOME/.config/i3"
"$HOME/.config/polybar"
"$HOME/.config/terminator"
"$HOME/.config/rofi"
"$HOME/.config/nvim"
"$HOME/.config/zathura"
"$HOME/.config/neofetch"
"$HOME/.config/cmus"
)

for directory in "${directories[@]}"; do
  rsync $opts $directory $HOME/dotfiles/config
done

rsync $opts $HOME/.Xmodmap $HOME/dotfiles/config/xmodmap
rsync $opts $HOME/.xinitrc $HOME/dotfiles/config/xinitrc
rsync $opts $HOME/.screenlayout/ $HOME/dotfiles/screenlayout
rsync $opts $HOME/.ssh/config $HOME/.ssh/*.pub $HOME/dotfiles/config/ssh

