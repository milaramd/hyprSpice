#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/config"
CONFIG_DEST="$HOME/.config"

echo "Running package installer..."
"$SCRIPT_DIR/packageInstaller.sh"

echo "Configuring input-remapper permissions..."
"$SCRIPT_DIR/inputRemapper.sh"

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh already installed, skipping..."
else
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Enabling services..."
"$SCRIPT_DIR/services.sh"

echo "Applying configs..."
"$SCRIPT_DIR/configs.sh"

echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Setup complete."
