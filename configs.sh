#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Applying configs from $CONFIG_SRC..."
mkdir -p "$CONFIG_DEST"
shopt -s dotglob nullglob

applied_any=false
for path in "$CONFIG_SRC"/*; do
  base="$(basename "$path")"

  # Skip empty matches (when directory is empty).
  [[ "$base" == "*" ]] && continue

  # Determine destination: dotfiles go to $HOME, the rest to ~/.config.
  if [[ "$base" == ".vimrc" || "$base" == ".zshrc" ]]; then
    dest="$HOME/$base"
  else
    dest="$CONFIG_DEST/$base"
  fi

  # Avoid copying symlinks that already target the desired destination.
  if [[ -L "$path" ]]; then
    target="$(readlink -f "$path")"
    if [[ "$target" == "$dest" ]]; then
      echo "Skipping $base (source symlink already points to $dest)."
      continue
    fi
  fi

  applied_any=true
  echo "Installing $base -> $dest"
  rm -rf "$dest"
  cp -a "$path" "$dest"
done

if [[ "$applied_any" == false ]]; then
  echo "No configs applied (config directory is empty or fully skipped)."
else
  echo "Config application complete."
fi
