## Todo
## fzf, ag, fd, thunderbird, nerd font, xsel

# install arch linux packages
if uname -a | grep -qi "arch"; then
    read -p "install arch packages? [y/n]: " choice
    if [[ $choice == [yY] ]]; then
        sudo pacman -Syu base-devel vim git tmux fd fzf xsel the_silver_searcher neovim ctags
    fi

    read -p "install node? [y/n]: " choice
    if [[ $choice == [yY] ]]; then
        sudo pacman -Syu nodejs npm
        sudo npm install -g neovim
    fi

fi


# install packages in Ubuntu OS
if uname -a | grep -qi "ubuntu"; then
    read -p "install ubuntu packages? [y/n]: " choice
    if [[ $choice == [yY] ]]; then
        sudo apt-get update -y
        sudo apt-get install -y build-essential vim git tmux gdb valgrind fd-find fzf neovim python3 exuberant-ctags
    fi
fi

# install mac os packages
if uname -a | grep -qi "darwin"; then
    if ! command -v brew &> /dev/null
    then
        read -p "install homebrew? [y/n]: " choice
        if [[ $choice == [yY] ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        brew install vim tmux
    fi
fi

# git setup
if command -v git &> /dev/null
then
    git config --global core.editor "vim"
    git config --global user.email "aarya.bhatia1678@gmail.com"
    git config --global user.name "Aarya Bhatia"
else
    echo "ERROR: git is not installed"
fi

# Link config files
if [ ! -f $HOME/.vimrc ]
then
    ln -sf `pwd`/vimrc $HOME/.vimrc
fi

if [ ! -f $HOME/.tmux.conf ]
then
    ln -sf `pwd`/tmux.conf $HOME/.tmux.conf
fi

# tmux plugin manager
if command -v git &> /dev/null && command -v tmux &> /dev/null 
then
    mkdir -p $HOME/.tmux/plugins
    if [ ! -d $HOME/.tmux/plugins/tpm ]
    then
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
else
    echo "ERROR: tmux is not installed"
fi

