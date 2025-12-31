Hyprland dotfiles for Arch
==========================

This repo contains my Hyprland setup and a couple of helper scripts to install dependencies and place configs.

What gets installed
-------------------
- Core tools: `hyprland`, `hyprlock`, `waybar`, `wofi`, `tilix`, `nautilus`, `google-chrome-stable`.
- UX extras: `awww` (wallpaper daemon), `dunst` (notifications), `swayosd` + `wpctl` + `brightnessctl` (OSD, volume, brightness).
- Media and utilities: `grim` + `slurp` (screenshots), `input-remapper`, `polkit-gnome`, `nm-connection-editor`, `blueman`, `pavucontrol`.
- Build/helper: `base-devel`, `git`, `yay` (AUR helper, installed by the script) and the package list in `dependencies`.

Configs included
----------------
- `config/hypr/`: Hyprland and Hyprlock.
  - Wallpaper daemon: `awww-daemon` autostarts to set wallpapers.
  - Notifications: `dunst` autostarts and is referenced by `$notifications`.
  - Bar: `waybar` autostarts via `$status`.
  - App launcher: `wofi` is bound to `$mainMod+R` (and `$mainMod+Shift+Z`).
  - Terminal/file/browser: `tilix`, `nautilus`, `google-chrome-stable`; `slack` autostarts too.
  - Screenshots: `grim` + `slurp` piping to `wl-copy`, saved under `~/Pictures/Screenshots/`.
  - Media/brightness: volume keys call `wpctl` and `swayosd`; brightness keys use `brightnessctl`.
  - Lockscreen: `hyprlock` with blurred screenshot background.
- `config/waybar/`: Status bar styles and layout.
- `config/dunst/`: Notification theming (top-center layout, framed, slight transparency).
- `config/wofi/`: Launcher styling.
- `config/input-remapper/`: Input remapping profiles.

Scripts
-------
- `packageInstaller.sh`: On Arch, installs `base-devel`, `git`, and `yay` with `pacman`, then installs everything listed in `dependencies` via `yay` (ignores blank/comment lines).
- `setup.sh`: Runs `packageInstaller.sh`, ensures `~/.config` exists, then moves everything from `dotfiles/config/` into `~/.config/`.

Usage
-----
1) From the repo root (`dotfiles`): `./setup.sh`
2) Log out/in or restart Hyprland to let autostarted services (awww, dunst, waybar, swayosd) come up cleanly.

Notes
-----
- Assumes Arch-based system with `pacman` available. `yay` is installed automatically if missing.
- If you already have configs under `~/.config`, move or back them up before running `setup.sh` (it uses `mv`, which will overwrite matching paths).
