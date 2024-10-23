#!/bin/sh

case "$1" in
	text/* | */xml) bat -p --theme=ansi "$1" ;;
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.8z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.json) jq < "$1" ;;
    *) cat "$1";;
esac
