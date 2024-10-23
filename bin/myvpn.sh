#!/bin/sh

if [ $1 = "up" ]; then
    sudo wg-quick up dell-laptop
elif [ $1 = "down" ]; then
    sudo wg-quick down dell-laptop
fi

sudo wg
