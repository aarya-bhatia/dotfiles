#!/bin/sh

Status() {
    echo Bat:$(sb-battery) Mem:$(sb-memory) $(sb-date)
}

while :; do
    xsetroot -name "$(Status)"
    sleep 3
done
