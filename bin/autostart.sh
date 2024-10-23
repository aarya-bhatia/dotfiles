#!/bin/bash
run() {
    if which "$1" &>/dev/null; then
        if ! pgrep -f "$1" &>/dev/null; then
            echo "$@" &
            "$@" &
        fi
    fi
}

run wallpaper
run statusinfo.sh
run nightlight

