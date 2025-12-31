#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Running package installer..."
"$SCRIPT_DIR/packageInstaller.sh"

echo "Moving configs from $CONFIG_SRC to $CONFIG_DEST..."
mkdir -p "$CONFIG_DEST"
shopt -s dotglob nullglob
configs=("$CONFIG_SRC"/*)

if [[ ${#configs[@]} -eq 0 ]]; then
  echo "No configs found to move."
  exit 0
fi

mv -t "$CONFIG_DEST" "${configs[@]}"
echo "Setup complete."
