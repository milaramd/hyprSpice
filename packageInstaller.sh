#!/usr/bin/env bash
set -euo pipefail

DEPENDENCY_FILE="$(dirname "$0")/dependencies"

if [[ ! -f "$DEPENDENCY_FILE" ]]; then
  echo "Dependency list not found at $DEPENDENCY_FILE" >&2
  exit 1
fi

mapfile -t PACKAGES < <(grep -Ev '^\s*(#|$)' "$DEPENDENCY_FILE")

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
  echo "No packages to install; $DEPENDENCY_FILE is empty or comment-only." >&2
  exit 0
fi

echo "Installing base requirements and yay via pacman..."
sudo pacman -S --needed --noconfirm base-devel git yay

echo "Installing listed packages via yay..."
yay -S --needed --noconfirm "${PACKAGES[@]}"

echo "Done."
