/*************/
/*  GLOBAL   */
/*************/
* {
    border: none;
    border-radius: 0;
    font-family: "JetBrainsMono Nerd Font", "FiraCode Nerd Font", monospace;
    font-size: 14px;
    font-weight: 600;
    min-height: 0;
}

/* Whole bar */
window#waybar {
    background: transparent;
    color: #e5e5e5;
}

/* Hide built-in bar background if any theme has one */
window#waybar > box {
    background: transparent;
}

/*********************************/
/*  FLOATING ISLAND CONTAINERS   */
/*********************************/
/* Left, center, right wrappers */
.modules-left,
.modules-center,
.modules-right {
    background: rgba(20, 20, 28, 0.92);
    border-radius: 0 0 7px 7px;
    padding: 4px 10px;
    margin: 0px 0px 0px 0px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.55);
}

/* Make it feel more “floating” off the edges */
.modules-left {
    margin-left: 5px;
}

.modules-right {
    margin-right: 5px;
}
/* Center island: keep it tight and clean */
.modules-center {
    padding: 4px 14px;
}

/* Remove individual module backgrounds so only islands are visible */
.modules-left > * ,
.modules-center > * ,
.modules-right > * {
    background: transparent;
    padding: 0 6px;
}

/***************/
/*   CENTER    */
/***************/
/* Clock in the middle island */
#clock {
    font-weight: 600;
    font-size: 14px;
}

/* If you want clock text perfectly centered inside its island: */

/****************/
/*   LEFT SIDE  */
/****************/
/* “Stock” modules – adjust as needed based on what you use */
#workspaces button {
    padding: 0 6px;
    margin: 0 2px;
    border-radius: 12px;
    background: transparent;
    color: #aaaaaa;
}

#workspaces button.focused,
#workspaces button.active {
    background: rgba(255, 255, 255, 0.10);
    color: #ffffff;
}

#workspaces button.urgent {
    background: #ff5555;
    color: #ffffff;
}

#window {
    padding: 0 6px;
    color: #c0c0c0;
}

/****************/
/*  RIGHT SIDE  */
/****************/
/* WiFi / network */
#network {
    padding: 0 6px;
}

#network.disconnected {
    color: #ff7070;
}

/* Battery */
#battery {
    padding: 0 6px;
}

/* Example battery colors */
#battery.charging {
    color: #a0ffb0;
}

#battery.warning {
    color: #ffd36b;
}

#battery.critical {
    color: #ff7070;
}

/* Bluetooth */
#bluetooth {
    padding: 0 6px;
}

/* Volume (PulseAudio / PipeWire) */
#pulseaudio,
#wireplumber {
    padding: 0 6px;
}

#pulseaudio.muted,
#wireplumber.muted {
    color: #777777;
}

/*********************/
/*  HOVER / DETAILS  */
/*********************/
.modules-left > *:hover,
.modules-right > *:hover {
    background: rgba(255, 255, 255, 0.08);
    border-radius: 8px;
}

tooltip {
    background: #181820;
    color: #f0f0f0;
    border-radius: 8px;
    padding: 6px 8px;
    border: 1px solid rgba(255, 255, 255, 0.06);
}

