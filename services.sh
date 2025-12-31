#!/usr/bin/env bash
set -euo pipefail

USER_SERVICES=(
  pipewire.service
  pipewire-pulse.service
  wireplumber.service
  swayosd.service
  awww-daemon.service
)

SYSTEM_SERVICES=(
  input-remapper.service
)

enable_user_service() {
  local svc="$1"
  if systemctl --user enable --now "$svc" >/dev/null 2>&1; then
    echo "Enabled user service: $svc"
  else
    echo "Skipped/missing user service: $svc (not found or user systemd unavailable)"
  fi
}

enable_system_service() {
  local svc="$1"
  if sudo systemctl enable --now "$svc" >/dev/null 2>&1; then
    echo "Enabled system service: $svc"
  else
    echo "Skipped/missing system service: $svc (requires sudo or service not present)"
  fi
}

echo "Enabling user services..."
for svc in "${USER_SERVICES[@]}"; do
  enable_user_service "$svc"
done

echo "Enabling system services..."
for svc in "${SYSTEM_SERVICES[@]}"; do
  enable_system_service "$svc"
done

echo "Service enablement attempted."
