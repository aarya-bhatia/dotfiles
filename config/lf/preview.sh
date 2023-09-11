#!/bin/sh

view='cat'

which bat >/dev/null 2>&1 && view='bat --style=plain --theme=gruvbox-dark'

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.8z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *) $view "$1";;
esac
