#!/bin/bash

# ask for sudo password in the beginning
sudo whoami

if ! [ -f "$COPYIGNORE" ]; then
	echo "file missing:" $COPYIGNORE
	exit 1
fi


always=0
never=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        -y)
			always=1
            ;;
        -n)
			never=1
            ;;
        *)
            ;;
    esac
    # Shift to the next argument
    shift
done

if [ $always -eq 1 ] && [ $never -eq 1 ]; then
	echo "Please choose either -y or -n option"
	exit 1
fi

confirm() {
	ret_yes=0
	ret_no=1

	if [ $always -eq 1 ]; then
		return $ret_yes
	fi

	if [ $never -eq 1 ]; then
		return $ret_no
	fi

	printf "$1 [y/n]:"
	read ans

	if [ "$ans" = 'y' ]; then
		return $ret_yes
	fi

	return $ret_no
}

if which crontab; then
	crontab -l > $HOME/scripts/crontab
fi

if [ $always -eq 1 ]; then
	yes | $HOME/scripts/cloudsync.sh
else
	confirm "sync cloud storage" && $HOME/scripts/cloudsync.sh
fi

if confirm "update packages"; then
	if which apt 2>/dev/null; then
		sudo apt update -y && sudo apt upgrade -y
	fi

	if which pacman 2>/dev/null; then
		sudo pacman -Syu --noconfirm
	fi

	if which yay 2>/dev/null; then
		confirm "yay update?" && yay -Syu
	fi

	if which snap 2>/dev/null; then
		sudo snap refresh
	fi
fi

if confirm "update passwords"; then
	pass git add .
	pass git commit -m "Synced on $(date +'%x %X')"
	pass git push
fi

PKG_DUMP_PATH=$HOME/scripts/packages

hostname=$(uname -n)
if confirm "dump packages"; then
	which pacman && pacman -Qqe > $PKG_DUMP_PATH/${hostname}-pacman.txt
	which pip && pip list > $PKG_DUMP_PATH/${hostname}-pip.txt
	which apt && apt list > $PKG_DUMP_PATH/${hostname}-apt.txt
	which npm && npm list > $PKG_DUMP_PATH/${hostname}-npm.txt
	which snap && snap list > $PKG_DUMP_PATH/${hostname}-snap.txt
fi

git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -a -m "Synced on $(date +'%x %X')"
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push

cd $HOME/scripts
git commit -a -m "Synced on $(date +'%x %X')"
git push

echo "Sync successful!"

if which neofetch &>/dev/null; then
	neofetch
fi

