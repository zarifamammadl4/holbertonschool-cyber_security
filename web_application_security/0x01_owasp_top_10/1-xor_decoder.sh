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

# XOR key used by WebSphere (0x5A)
KEY=90

RESULT=""

# XOR decode byte by byte (binary safe)
for (( i=0; i<${#DECODED}; i++ )); do
    CHAR="${DECODED:$i:1}"
    BYTE=$(printf '%d' "'$CHAR")
    XOR_BYTE=$(( BYTE ^ KEY ))

    # Convert number back to character safely
    printf -v OUT_CHAR '\\x%02x' "$XOR_BYTE"
    RESULT+="$OUT_CHAR"
done

echo -e "$RESULT"
