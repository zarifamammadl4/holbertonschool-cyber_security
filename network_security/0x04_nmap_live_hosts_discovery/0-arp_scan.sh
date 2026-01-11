#!/bin/bash

# Check if subnet argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <subnet>"
    exit 1
fi

# ARP scan to discover live hosts without port scanning
sudo nmap -sn -PR "$1"
