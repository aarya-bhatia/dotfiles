#!/bin/sh

Status() {
    echo Vol:$(sb-volume) Bat:$(sb-battery) Mem:$(sb-memory) $(sb-date)
}

while :; do
    xsetroot -name "$(Status)"
    sleep 3
done
