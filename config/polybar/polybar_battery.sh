# icon-battery-half = 
# icon-battery-quarter = 
# icon-battery-empty = 
# acpi | cut -d"," -f2 -
#!/bin/bash

battery=$(acpi | cut -d ',' -f 2 | cut -d ' ' -f 2 | tr -d '%')

battery_empty=""  # Replace with your battery-empty icon
battery_half=""   # Replace with your battery-half icon
battery_full=""   # Replace with your battery-full icon

if (( battery < 20 )); then
  echo "$battery_empty $battery%"
elif (( battery < 50 )); then
  echo "$battery_half $battery%"
else
  echo "$battery_full $battery%"
fi

