#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Moving configs from $CONFIG_SRC to $CONFIG_DEST..."
mkdir -p "$CONFIG_DEST"
shopt -s dotglob nullglob
configs=("$CONFIG_SRC"/*)

if [[ ${#configs[@]} -eq 0 ]]; then
  echo "No configs found to move."
else
  mv -t "$CONFIG_DEST" "${configs[@]}"
  echo "Configs moved."
fi

VIMRC_SRC="$SCRIPT_DIR/.vimrc"
if [[ -f "$VIMRC_SRC" ]]; then
  cp "$VIMRC_SRC" "$HOME/.vimrc"
  echo "Copied .vimrc to $HOME."
else
  echo "No .vimrc found at $VIMRC_SRC to copy."
fi
