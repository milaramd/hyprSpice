#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Running package installer..."
"$SCRIPT_DIR/packageInstaller.sh"

echo "Enabling services..."
"$SCRIPT_DIR/services.sh"

echo "Applying configs..."
"$SCRIPT_DIR/configs.sh"

echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Setup complete."
