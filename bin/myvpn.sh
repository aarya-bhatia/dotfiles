#!/bin/sh

if [ "$1" = "up" ]; then
    sudo wg-quick up wg0
elif [ "$1" = "down" ]; then
    sudo wg-quick down wg0
fi

sudo wg
