#!/bin/bash

name="$1"
filename=/tmp/"$1"

bspc_write_nodeid() {
    while true
    do
        flag=false
        for id in $(bspc query -d focused -N -n .floating.sticky.hidden)
        do
            bspc query --node $id -T | grep -q $name && { echo $id > $filename; flag=true; break; }
        done
        [[ "$flag" == "true" ]] && break
        sleep 0.1s
    done
}

hide_all_except_current(){
    for id in $(bspc query -d focused -N -n .floating.sticky.!hidden)
    do
        bspc query --node $id -T | grep -qv $name && bspc node $id --flag hidden=on
    done
}

toggle_hidden() {
    [ -e "$filename" ] || exit 1
    hide_all_except_current
    id=$(<$filename)
    bspc node $id --flag hidden -f
}

create_terminal(){
    alacritty --class="$name","$name" -e $@ &
}

if ! ps -ef | grep -q "[c]lass=$name"
then
    bspc rule -a "$name" --one-shot state=floating sticky=on hidden=on
    case "$name" in
        "htop")
            create_terminal htop
            ;;
        "neomutt")
            create_terminal neomutt
            ;;
        "newsboat")
            create_terminal newsboat
            ;;
        "lf")
            create_terminal lf
            ;;
        "terminal")
            create_terminal $SHELL
            ;;
        "notes")
            create_terminal nvim ~/GoogleDrive/Notes/$(date +"%Y-%m").md
            ;;
        *)
            exit 1
    esac
    dunstify "Scratch: starting $name"
    bspc_write_nodeid
    toggle_hidden
else
    toggle_hidden
fi
