#!/usr/bin/env bash
set -euo pipefail

USER_NAME="${SUDO_USER:-$USER}"

echo "Ensuring $USER_NAME is in the input group..."
if id -nG "$USER_NAME" | grep -qw input; then
  echo "$USER_NAME is already in the input group."
else
  sudo usermod -a -G input "$USER_NAME"
  echo "Added $USER_NAME to the input group."
fi

echo "Writing polkit rule for input-remapper..."
sudo tee /etc/polkit-1/rules.d/49-inputremapper.rules >/dev/null <<'EOF'
polkit.addRule(function(action, subject) {
  if (action.id == "inputremapper" && subject.isInGroup("wheel")) {
    return polkit.Result.YES;
  }
});
EOF
echo "Polkit rule installed."
