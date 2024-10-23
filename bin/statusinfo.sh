#!/bin/sh

Status() {
    echo Vol:$(sb-volume) Mem:$(sb-memory) Bat:$(sb-battery) $(sb-disk) Temp:$(sb-weather) $(sb-date)
}

while :; do
    xsetroot -name "$(Status)"
    sleep 1
done
