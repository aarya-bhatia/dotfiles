#!/bin/bash
current=`acpi`
power=$(echo $current | cut -d ',' -f 2 | cut -d ' ' -f 2 | tr -d "%" )

if [[ "$current" =~ "Charging" ]]; then
  echo $power"+"
elif [[ "$current" =~ "Full" ]]; then
  echo "FULL"
elif [ $power -le 20 ]; then
  echo "LOW"
else
  echo $power"-"
fi

