#!/bin/bash

pgrep -f xss-lock && loginctl lock-session && exit 0
pgrep -f xautolock && xautolock -locknow && exit 0

# xset dpms force off

