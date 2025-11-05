#!/usr/bin/env bash
# --------------------------------------------------------------------
# cleanup_logs.sh : Remove or compress old logs
# --------------------------------------------------------------------
set -euo pipefail
IFS=$'\n\t'

LOG_DIR="$HOME/capstone/bash-suite/logs"
DAYS_OLD="${1:-7}"   # delete logs older than 7 days by default

mkdir -p "$LOG_DIR"
echo "🧹 Cleaning logs older than $DAYS_OLD days in $LOG_DIR ..."

# Delete very old logs
find "$LOG_DIR" -type f -mtime +"$DAYS_OLD" -delete

echo "✅ Cleanup complete at $(date)."
