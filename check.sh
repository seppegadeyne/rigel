#!/bin/bash

BASEDIR="$HOME/rigel"
SESSION_NAME="quai"
PROCESS_PATH="$HOME/rigel/rigel"  # Full path of the exact process
RUN_SCRIPT="$BASEDIR/run.sh"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
	logger -t check-rigel"Error: Directory '$BASEDIR' does not exist. Exiting."
	exit 1
fi

# Check if the actual rigel process is running (exact match)
PROCESS_PID=$(ps aux | awk '$11 == "'$PROCESS_PATH'" {print $2}')

if [ -n "$PROCESS_PID" ]; then
	logger -t check-rigel "Process '$PROCESS_PATH' is already running (PID: $PROCESS_PID). No action needed."
	exit 0
fi

logger -t check-rigel "Process '$PROCESS_PATH' is not running. Restarting..."

# Call run.sh to restart the application
cd "$BASEDIR" && ./run.sh 

logger -t check-rigel "Rigel process restarted successfully."
