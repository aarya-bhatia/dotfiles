#!/bin/sh

TRASH=/tmp/trash
mkdir -p $TRASH

notmuch search --output=files tag:deleted or tag:trash | while read line; do
  mv "$line" $TRASH
done

notmuch new
