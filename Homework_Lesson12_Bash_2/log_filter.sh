#!/bin/bash

LOG_FILE=${1:-server.log}

# Check for etered parametr
if [[ "$#" -ne 1 ]]; then
	echo "Please Enter log file"
	exit 1
fi

# Extracting IP address from response code 200
echo "Successful logins (IP addresses):"
grep -E "ip=[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*.*status=200" "$LOG_FILE" | grep -Eo "ip=[0-9]*\.[0-9]*\.[0-9]*\.[0-9]+" | sed 's/^ip=//'

echo ""

# Extracting user from response code 403
echo "Users with failed logins:"
grep -E "user=[a-zA-Z0-9_]*.*status=403" "$LOG_FILE" | grep -Eo "user=[a-zA-Z0-9_]*" | sed 's/^user=//'

