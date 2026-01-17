#!/bin/bash
whois "$1" | awk -F: 'BEGIN{OFS=","}/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Fax|Email)/{gsub(/^ +/,"",$2);if($2=="")$2="";k=$1;gsub(" ","",k);if($1~/(Street)/)$2=$2" ";if($1~/(Phone Ext|Fax Ext)/)k=k":";print k,$2}' > "$1.csv"
