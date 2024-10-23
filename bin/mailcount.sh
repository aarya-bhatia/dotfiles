#!/bin/sh

GetCounts() {
	find ~/.mail/ -type d -name "new" | while IFS= read -r line; do
		ls "$line" | wc -l
	  done
}

total=0

for count in $(GetCounts); do
	total=$(echo "$total + $count" | bc)
done

echo $total

