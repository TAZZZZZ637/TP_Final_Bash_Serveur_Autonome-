#!/bin/bash
df -h
free -h
DISK_THRESHOLD=90 
SWAP_THRESHOLD=90 

echo "WARNING : utilisation disque critique (${DISK_USAGE}%)"
echo "WARNING : utilisation SWAP critique (${SWAP_USAGE}%)"
fi
