#!/bin/sh

echo "Healthcheck URL $HEALTHCHECK_URL" 

if [ -n ${HEALTHCHECK_URL+x} ]; then 
    echo "Pinging healthcheck start"
    curl -m 10 --retry 5 "$HEALTHCHECK_URL/start" 
fi

echo "[$(date)] Starting imap backup…"

result=$(imap-backup)

if [ -n ${HEALTHCHECK_URL+x} ]; then 
    echo "Pinging healthcheck end"
    curl -m 10 --retry 5 "$HEALTHCHECK_URL/$result" 
fi

echo "[$(date)] Backup finished!"
