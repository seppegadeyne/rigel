#!/bin/bash

LOG_FILE="$HOME/rigel/miner.log"
MINER_EXECUTABLE="$HOME/rigel/rigel"
SESSION_NAME="quai"

# Check if the screen session is already running, if so, stop it first
if screen -list | grep -q "$SESSION_NAME"; then
	echo "Screen session '$SESSION_NAME' is already running, stopping it now..."
	screen -S "$SESSION_NAME" -X quit
	sleep 2  # Give it some time to close
fi

screen -dmS "$SESSION_NAME" "$MINER_EXECUTABLE" -a quai -o stratum+tcp://suomi.straffesites.be:3333 -u 0x0017986f17D2eeDC2ec4628eC22D676321FDfc6c -w x --api-bind 0.0.0.0:9090 --log-file "$LOG_FILE" 

echo "Rigel started in screen session '$SESSION_NAME' and API at http://localhost:9090."

