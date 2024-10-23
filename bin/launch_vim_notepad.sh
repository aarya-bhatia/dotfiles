#!/bin/bash
set -e

SAVED_NOTE_PATH=/tmp/snippet_current
TEMPLATE_PATH=/tmp/snippets.XXXXXX

NewNote() {
	tmpfile=$(mktemp $TEMPLATE_PATH)
	OpenNote $tmpfile && PromptSaveNote $tmpfile
}

OpenNote() {
	[ -z "$1" ] && echo "file is missing..." && exit 1
	alacritty --class=floating -e $EDITOR $1
	size=$(du -b $1 | cut -f1)
	if [ $size -gt 0 ]; then
		cat $1 | xsel -b
		notify-send "copied note to clipboard"
	else
		rm $1
		notify-send "note removed"
		echo "skipping empty note"
	fi
}

ContinueNote() {
	[ -f $SAVED_NOTE_PATH ] && OpenNote $SAVED_NOTE_PATH || {
		echo "no saved notes..."
		exit 1
	}
}

ClipboardNote() {
	tmpfile=$(mktemp $TEMPLATE_PATH)
	xsel -b -o >> $tmpfile
	OpenNote $tmpfile && PromptSaveNote $tmpfile
}

PromptSaveNote() {
	echo "saving note $1 to $SAVED_NOTE_PATH..."
	if [ "$1" != "$(readlink $SAVED_NOTE_PATH)" ] && [ -f "$1" ]; then
		# ans=$(printf "Yes\nNo\n" | dmenu -i -p "Bookmark this note?")
		# if [ "$ans" = "Yes" ]; then
		ln -sf $1 $SAVED_NOTE_PATH
		echo "note saved to $SAVED_NOTE_PATH"
		notify-send "note saved to $SAVED_NOTE_PATH"
		# fi
	fi

}

ans=$(printf "(1) Create Note\n(2) Continue Note\n(3) Use Clipboard\n(4) Exit\n" | dmenu -i -l 5)
[ -z "$ans" ] && exit 1

case $(echo $ans | cut -d" " -f1 | tr -d '()') in
	1) echo "creating new note..." && NewNote ;;
	2) echo "continuing last note..." && ContinueNote ;;
	3) echo "creating note from clipboard..." && ClipboardNote ;;
	4) echo "exiting..." && exit 0 ;;
	*) echo "unknown option..." && exit 1 ;;
esac
