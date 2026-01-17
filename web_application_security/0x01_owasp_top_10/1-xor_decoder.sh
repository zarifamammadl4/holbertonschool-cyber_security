#!/bin/bash

# Check argument
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}HASH"
    exit 1
fi

HASH="$1"

# Remove {xor} prefix
CLEAN_HASH="${HASH#\{xor\}}"

# Base64 decode
DECODED=$(echo "$CLEAN_HASH" | base64 -d 2>/dev/null)

# XOR key used by WebSphere
KEY=90  # 0x5A in decimal

# XOR decode byte by byte
RESULT=""

for (( i=0; i<${#DECODED}; i++ )); do
    BYTE=$(printf "%d" "'${DECODED:$i:1}")
    XOR_BYTE=$(( BYTE ^ KEY ))
    RESULT+=$(printf "\\x%02x" "$XOR_BYTE")
done

# Print result
echo -e "$RESULT"

