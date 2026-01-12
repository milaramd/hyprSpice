#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Moving configs from $CONFIG_SRC to $CONFIG_DEST..."
mkdir -p "$CONFIG_DEST"
shopt -s dotglob nullglob
configs=()
for path in "$CONFIG_SRC"/*; do
  # Keep dotfiles for copying to $HOME later.
  case "$(basename "$path")" in
    .vimrc|.zshrc) continue ;;
  esac
  configs+=("$path")
done

if [[ ${#configs[@]} -eq 0 ]]; then
  echo "No configs found to move."
else
  cp -r -t "$CONFIG_DEST" "${configs[@]}"
  echo "Configs copied."
fi

VIMRC_SRC="$CONFIG_SRC/.vimrc"
if [[ -f "$VIMRC_SRC" ]]; then
  cp "$VIMRC_SRC" "$HOME/.vimrc"
  echo "Copied .vimrc to $HOME."
else
  echo "No .vimrc found at $VIMRC_SRC to copy."
fi

ZSHRC_SRC="$CONFIG_SRC/.zshrc"
if [[ -f "$ZSHRC_SRC" ]]; then
  cp "$ZSHRC_SRC" "$HOME/.zshrc"
  echo "Copied .zshrc to $HOME."
else
  echo "No .zshrc found at $ZSHRC_SRC to copy."
fi
