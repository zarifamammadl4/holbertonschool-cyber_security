#!/bin/bash
whois "$1" | awk -F: 'BEGIN{OFS=", "} /^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Fax|Email)/{gsub(/^ +/,"",$2);key=$1;if($1~/(Street)/)$2=$2" ";if($1~/(Phone Ext|Fax Ext)/)key=key":";print key,$2}' > "$1.csv"
