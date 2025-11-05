#!/usr/bin/env bash
# --------------------------------------------------------------------
# update_system.sh : Automate apt package update, upgrade & cleanup
# --------------------------------------------------------------------
set -euo pipefail
IFS=$'\n\t'

LOG_DIR="$HOME/capstone/bash-suite/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/update_$(date +%Y%m%d_%H%M%S).log"

{
  echo "========== System Update Started: $(date) =========="
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean -y
  echo "========== System Update Completed: $(date) =========="
} | tee -a "$LOG_FILE"

echo "✅ System update complete. Log saved at: $LOG_FILE"
