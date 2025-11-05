#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

LOG_FILE="${1:-/var/log/syslog}"
KEYWORDS="${2:-error|fail|critical}"
OUTPUT_DIR="$HOME/capstone/bash-suite/logs"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/log_alert_$(date +%Y%m%d_%H%M%S).log"

echo "Scanning $LOG_FILE for: $KEYWORDS"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

grep -Ei "$KEYWORDS" "$LOG_FILE" > "$OUTPUT_FILE" || true

if [ -s "$OUTPUT_FILE" ]; then
    echo "Alerts found and saved to $OUTPUT_FILE"
else
    echo "No matching alerts found."
    rm -f "$OUTPUT_FILE"
fi
