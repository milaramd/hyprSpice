{
  // ---------------------------------------------------------
  //  WAYBAR LAYOUT
  // ---------------------------------------------------------
  "modules-left": [
    "hyprland/workspaces",
    "hyprland/window"
  ],

  "modules-center": [
    "clock"
  ],

  "modules-right": [
    "network",
    "bluetooth",
    "pulseaudio", // or "wireplumber" depending on your system
    "battery"
  ],

  // ---------------------------------------------------------
  //  MODULE CONFIGURATION
  // ---------------------------------------------------------

  // Workspaces
  "workspaces": {
    "disable-scroll": true,
    "all-outputs": true,
    "format": "{name}"
  },

  // Window title
  "window": {
    "max-length": 50,
    "format": "{}"
  },

  // Center clock island
  "clock": {
    "interval": 1,
    "format": "{:%H:%M - %d/%m}",  // YOUR FORMAT
    "tooltip-format": "{:%A, %d %B %Y\n%H:%M:%S}"
  },

  // WiFi / Network
  "network": {
    "format-wifi": "  {essid}",
    "format-ethernet": "  {ipaddr}",
    "format-disconnected": "󰖪  offline",
    "tooltip-format": "Signal: {signalStrength}%\nIP: {ipaddr}",
    "on-click": "nm-connection-editor"
  },

  "bluetooth": {
    "format": " {status}",
    "format-connected": " {device_alias}",
    "format-off": " off",
    "on-click": "blueman-manager"
  },

  // Volume (PulseAudio)
  "pulseaudio": {
    "format": "{icon} {volume}%",
    "format-muted": "󰝟 muted",
    "format-icons": {
      "default": ["󰕿", "󰖀", "󰕾"]
    },
    "on-click": "pavucontrol"
  },

  // Battery
  "battery": {
    "states": {
      "warning": 30,
      "critical": 15
    },
    "format": "{icon} {capacity}%",
    "format-icons": ["󰁺","󰁼","󰁾","󰂀","󰂂","󰁹"],
    "format-charging": "󰂄  {capacity}%"
  },

  // Bluetooth
/*  "bluetooth": {
    "format": " {status}",
    "format-connected": " {device_alias}",
    "format-off": " off",
    "on-click": "blueman-manager"
  },

  // Volume (PulseAudio)
  "pulseaudio": {
    "format": "{icon} {volume}%",
    "format-muted": "󰝟 muted",
    "format-icons": {
      "default": ["󰕿", "󰖀", "󰕾"]
    },
    "on-click": "pavucontrol"
  },
*/
  // If you use WirePlumber instead of PulseAudio
  // "wireplumber": { ... same config ... },

  // ---------------------------------------------------------
  //  GENERAL SETTINGS
  // ---------------------------------------------------------
  "layer": "top",
  "position": "top"
}

