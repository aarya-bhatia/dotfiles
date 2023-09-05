#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.8z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *) bat --style=plain --theme=gruvbox-dark "$1";;
esac
