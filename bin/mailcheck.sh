#!/bin/sh

export DISPLAY=:0;
export XAUTHORITY=~/.Xauthority

PIPE=/tmp/mail_signal.fifo
rm -rf $PIPE
mkfifo $PIPE

TIMER_SEC=180 # 3 min


timer() {
  while true; do
    echo "TIMER" >> $PIPE
    sleep $TIMER_SEC
  done
}

timer &
BG_PROCESS_PID=$!
echo $BG_PROCESS_PID

# Function to terminate the background process
handle_signal() {
  echo "signal caught..."
  [ -n "$BG_PROCESS_PID" ] && kill -TERM "$BG_PROCESS_PID"
  exit 0
}

trap 'handle_signal' EXIT SIGTERM SIGINT

paused=0

while true; do
  read -r line < $PIPE
  echo "fetching mail (received: $line)..."
  if [ "$line" = "EXIT" ]; then
    kill -TERM "$BG_PROCESS_PID"
    exit 0
  elif [ "$line" != "TIMER" ]; then
    notify-send "Mail" "received signal: $line"
  fi

  if [ "$line" = "TRASH_MAIL" ]; then
    notmuch_delete_mail.sh
  elif [ "$line" = "PAUSE" ]; then
    paused=1
  elif [ "$line" = "RESUME" ]; then
    paused=0
  elif [ $paused -eq 0 ]; then
    mbsync -a -q
    notmuch new
    msmtp-runqueue.sh
  fi
done
