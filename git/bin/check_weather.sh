#!/bin/sh
URL="https://wttr.in/?m&0"
while :; do
  curl $URL
  read
done
