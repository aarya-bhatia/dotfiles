#!/usr/bin/env bash

# Validate the number of arguments
if [ "$#" -lt 2 ]; then
    echo "ERROR" "Insufficient arguments. Usage: $0 <program> <arg1> [<arg2> ...]"
    exit 1
fi

# Validate if the program exists
PROGRAM="$1"
if ! command -v "$PROGRAM" &>/dev/null; then
    echo "ERROR" "Program '$PROGRAM' not found or is not executable."
    exit 1
fi

echo "INFO" "Starting foreach script with program '$PROGRAM'."

# Iterate over each additional argument and run the program
for ARG in "${@:2}"; do
    echo "INFO" "Running: $PROGRAM $ARG"
    "$PROGRAM" "$ARG"
    if [ $? -ne 0 ]; then
        echo "ERROR" "Command '$PROGRAM $ARG' failed."
    else
        echo "INFO" "Command '$PROGRAM $ARG' completed successfully."
    fi
done

echo "INFO" "foreach script completed."
exit 0

