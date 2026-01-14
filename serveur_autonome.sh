#!/bin/bash
df -h
free -h
DISK_THRESHOLD=90 
SWAP_THRESHOLD=90 

echo "WARNING : utilisation disque critique (${DISK_USAGE}%)"
echo "WARNING : utilisation SWAP critique (${SWAP_USAGE}%)"
fi

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4
ps -eo pid,comm,%mem --sort=-%mem | head -n 4
