set -euo pipefail
IFS=$'\n\t'

# Default backup paths
SRC_DIR="${1:-$HOME}"
DEST_DIR="${2:-$HOME/backups}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="${DEST_DIR}/backup_${TIMESTAMP}.tar.gz"

mkdir -p "$DEST_DIR"
tar -czf "$ARCHIVE" -C "$SRC_DIR" .

echo "Backup saved to $ARCHIVE"
