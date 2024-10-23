#!/bin/sh

if pgrep -f redshift; then
    echo "redshift is already running"
    exit 1
elif ! [ -z "$LATITUDE" -o -z "$LONGITUDE" ]; then
    redshift -l $LATITUDE:$LONGITUDE
else
    echo "latitude or longitude info is missing"
    exit 1
fi
