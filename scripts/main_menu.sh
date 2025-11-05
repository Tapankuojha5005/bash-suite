#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

while true; do
    clear
    echo "=============================="
    echo "   Bash System Suite Menu"
    echo "=============================="
    echo "1) Backup Files"
    echo "2) Update System"
    echo "3) Clean Old Logs"
    echo "4) Monitor System Logs"
    echo "5) Exit"
    echo "=============================="
    read -rp "Enter your choice: " choice

    case $choice in
        1)
            read -rp "Enter source directory (default: /etc): " src
            read -rp "Enter destination directory (default: /tmp/backups_test): " dest
            bash "$HOME/capstone/bash-suite/scripts/backup.sh" "${src:-/etc}" "${dest:-/tmp/backups_test}"
            read -rp "Press Enter to return to menu..." ;;
        2)
            bash "$HOME/capstone/bash-suite/scripts/update_system.sh"
            read -rp "Press Enter to return to menu..." ;;
        3)
            read -rp "Delete logs older than how many days? (default: 7): " days
            bash "$HOME/capstone/bash-suite/scripts/cleanup_logs.sh" "${days:-7}"
            read -rp "Press Enter to return to menu..." ;;
        4)
            bash "$HOME/capstone/bash-suite/scripts/log_monitor.sh" /var/log/syslog
            read -rp "Press Enter to return to menu..." ;;
        5)
            echo "Exiting..."
            exit 0 ;;
        *)
            echo "Invalid option, please try again."
            sleep 1 ;;
    esac
done
