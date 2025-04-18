#!/bin/bash
# /* ---- Kur's Custom Config for Keyhints ---- */  ##
# Keyhints. Idea got from Garuda Hyprland

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Ask the user for a search term
search_term=$(yad --entry --title="Search Keybindings" --text="Enter search term:")

# Launch yad with calculated width and height and filtered results
yad --width=$dynamic_width --height=$dynamic_height \
  --center \
  --title="Keybindings" \
  --no-buttons \
  --list \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --column=Type: \
  --timeout-indicator=bottom \
  $(
    awk -v term="$search_term" -F '"' '
    $0 ~ term { print $2, $4, $6, $8 }
  ' <<EOF
  "ESC" "close this app" "" "Indication"
  "=" "SUPER KEY (Windows Key)" "(SUPER KEY)" "Indication"
  " enter" "Terminal" "(kitty)" "Term"
  " SHIFT enter" "Scratch Terminal" "(kitty-pyprland)" "Term"
  " A" "Desktop Overview" "(AGS Overview)" "SeeDesktops"
  " D" "App Launcher" "(rofi-wayland)" "RofiLauncher"
  "ALT TAB" "App Switcher" "(rofi-wayland)" "RofiLauncher"
  " T" "Open File Manager" "(Thunar)" "FileExplorer"
  " Q" "Close active window" "(not kill)" "CloseWindow"
  " Shift Q " "Closes a specified window" "(window)" "CloseWindow"
  " Z" "Desktop Zoom" "(pyprland)" "Zoom+"
  " Alt V" "Clipboard Manager" "(cliphist)" "Clipboard"
  " B" "Hide/UnHide Waybar" "waybar" "Waybar"
  " ALT R" "Reload Waybar swaync Rofi" "CHECK NOTIFICATION FIRST!!!" "Reload"
  " SHIFT N" "Launch Notification Panel" "swaync Notification Center" "Waybar"
  " Print" "Screenshot" "(grim)" "Screenshot"
  " Shift Print" "Screenshot region" "(grim + slurp)" "Screenshot"
  " Shift S" "Screenshot region" "(swappy)" "ScreenShot"
  "ALT Print" "Screenshot active window" "active window only" "Screenshot"
  "CTRL ALT P" "Power-menu" "(wlogout)" "Powermenu"
  "CTRL ALT Del" "Hyprland Exit" "(SAVE YOUR WORK!!!)" "Close Hyprland"
  " F" "Fullscreen" "Toggles to full screen" "Fullscreen"
  " ALT L" "Toggle Dwindle | Master Layout" "Hyprland Layout" "LayoutChange"
  " Shift F" "Toggle float" "Single window" "LayoutChange"
  " ALT F" "Toggle all windows to float" "all windows" "LayoutChange"
  "SHIFT ALT L" "Switch Keyboard Layout" "use a script, in scripsDir" "KeyboardLayout"
  " G" "Toggle the windows into a group" "togglegroup" "GroupingWindows"
  "CTRL SHIFT RIGHT/LEFT" "Toggle or un-toggle the grouping of windows" "togglegroup" "GroupingWindows"
  " SHIFT B" "Exec bluetooth manager" "blueman-manager" "Bluetooth"
  " SHIFT M" "Exec music control app" "pavucontrol" "Sound/Music"
  " SHIFT T" "Toggle idle mode" "Hypridle" "Idle Mode"
  " ALT P" "Passthrough the keyboard to a VM" "VM" "Virtual Machine"
  " H" "Launch this app" "" "Hints!"
  "" "" "" ""
EOF
  )
