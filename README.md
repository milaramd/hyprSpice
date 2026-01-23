Hyprland dotfiles for Arch
==========================

This repo contains my Hyprland setup and a couple of helper scripts to install dependencies and place configs.

What gets installed
-------------------
- Core tools: `hyprland`, `hyprlock`, `waybar`, `wofi`, `kitty`, `nautilus`, `google-chrome-stable`.
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
  - Terminal/file/browser: `kitty`, `nautilus`, `google-chrome-stable`; `slack` autostarts too.
  - Screenshots: `grim` + `slurp` piping to `wl-copy`, saved under `~/Pictures/Screenshots/`.
  - Media/brightness: volume keys call `wpctl` and `swayosd`; brightness keys use `brightnessctl`.
  - Lockscreen: `hyprlock` with blurred screenshot background.
- `config/waybar/`: Status bar styles and layout.
- `config/dunst/`: Notification theming (top-center layout, framed, slight transparency).
- `config/wofi/`: Launcher styling.
- `config/input-remapper-2/`: Input remapping profiles.
- `.vimrc`: Copied to your home for Vim setup (vim-plug plugins installed during setup).
- `.zshrc`: Copied to your home with a basic Oh My Zsh configuration (git plugin, robbyrussell theme).

Scripts
-------
- `packageInstaller.sh`: On Arch, installs `base-devel`, `git`, and `yay` with `pacman`, then installs everything listed in `dependencies` via `yay` (ignores blank/comment lines).
- `inputRemapper.sh`: Adds the current user to the `input` group (if needed) and installs a polkit rule allowing `wheel` users to manage input-remapper.
- `services.sh`: Enables and starts Hypr session user services/targets (`hypr-services.target`, `waybar`, `dunst`, `swayosd-server`, `awww-daemon`, `input-remapper-rat7`, `hyprpolkitagent`), core audio (`pipewire`, `pipewire-pulse`, `wireplumber`), and system services (`input-remapper`, `bluetooth`; requires sudo). Skips gracefully if missing or no user systemd.
- `configs.sh`: Applies everything from `config/` into `~/.config/` and drops `.vimrc`/`.zshrc` into your home; skips copying when the source symlink already points at the destination to avoid loops.
- `setup.sh`: Runs `packageInstaller.sh`, installs Oh My Zsh, then `services.sh`, then `configs.sh`, and finishes with `vim +PlugInstall +qall` to install Vim plugins.

Usage
-----
1) From the repo root (`dotfiles`): `./setup.sh`
2) Log out/in or restart Hyprland to let autostarted services (awww, dunst, waybar, swayosd) come up cleanly.

Notes
-----
- Assumes Arch-based system with `pacman` available. `yay` is installed automatically if missing.
- If you already have configs under `~/.config`, move or back them up before running `setup.sh` (it uses `mv`, which will overwrite matching paths).
- `services/` contains symlinks to the unit files referenced by `services.sh` for quick inspection.
