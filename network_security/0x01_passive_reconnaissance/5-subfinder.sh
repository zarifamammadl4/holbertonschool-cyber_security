#!/bin/bash

domain="$1"

# Subdomainləri ekrana çıxar
subfinder -d "$domain" -silent | tee /tmp/subs.txt

# Host,IP formatında fayla yaz
> "$domain.txt"
while read -r sub; do
    ip=$(dig +short "$sub" | head -n 1)
    if [ -n "$ip" ]; then
        echo "$sub,$ip" >> "$domain.txt"
    fi
done < /tmp/subs.txt

rm /tmp/subs.txt
