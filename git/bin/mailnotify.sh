#!/usr/bin/bash
# TODO
#
#
# Script to notify user for new mails.
# Crontab ex:
# */3 * * * * $HOME/.local/scripts/mbsync-notify.sh [acc_name]
#

# do not duplicate
killall mbsync &>/dev/null

#run mbsync once for all accs with named configs file, with quiet interface
# or specify account name as argument and define separate cron tasks for each acc
if [ -n $1 ]
then
  acc=$1
else
  acc=
fi
/usr/bin/mbsync -c $HOME/.config/isync/mbsyncrc -a $acc -q

#count new mail for every maildir, only in INBOX
# since there are maildirs/accounts in a format `~/Mail/account1/subacc1`,
# `~/Mail/account1/subacc2`, `~/Mail/account2/subacc1` etc
# there should be such an expansion
maildirnew="$HOME/Mail/*/*/INBOX/new/"
new="$(find $maildirnew -type f | wc -l)"

notmuch new

#count old mail for every maildir
maildirold="$HOME/Mail/*/*/INBOX/*/cur/"
old="$(find $maildirold -type f | wc -l)"

#`notify-send` requires connection to DBUS_SESSION_BUS_ADDRESS
# and one way is to export display and use X server authority cookies thru .Xauthority
# see here https://askubuntu.com/questions/298608/notify-send-doesnt-work-from-crontab
export DISPLAY=:0; export XAUTHORITY=~/.Xauthority

if [ $new -gt 0 ]
then
  /usr/bin/notify-send -a "Mbsync" "New mail!" "New: $new Old: $old"
fi
