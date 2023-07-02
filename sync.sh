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
)

for directory in "${directories[@]}"; do
  rsync $opts $directory $HOME/dotfiles/config
done

rsync $opts $HOME/.Xmodmap $HOME/dotfiles/config/xmodmap
rsync $opts $HOME/.xinitrc $HOME/dotfiles/config/xinitrc
rsync $opts $HOME/.ssh/config $HOME/.ssh/*.pub $HOME/dotfiles/config/ssh
rsync $opts $HOME/.bashrc $HOME/dotfiles/bashrc
rsync $opts $HOME/.bash_profile $HOME/dotfiles/bash_profile
rsync $opts $HOME/.vimrc $HOME/dotfiles/vimrc
rsync $opts $HOME/.tmux.conf $HOME/dotfiles/config/tmux/tmux.conf
rsync $opts $HOME/.screenlayout/ $HOME/dotfiles/screenlayout

