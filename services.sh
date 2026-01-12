#!/usr/bin/env bash
set -euo pipefail

# User-level targets/services to enable (Hypr session plus core daemons)
USER_SERVICES=(
  hypr-services.target
  waybar.service
  dunst.service
  swayosd-server.service
  awww-daemon.service
  input-remapper-rat7.service
  pipewire.service
  pipewire-pulse.service
  wireplumber.service
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
