#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install required packages
sudo apt install -y python3-pipx gnome-shell-extensions dconf-cli curl unzip

# Ensure pipx is in PATH
export PATH="$HOME/.local/bin:$PATH"

# Install gnome-extensions-cli if not installed
if ! command -v gext &>/dev/null; then
    pipx install gnome-extensions-cli --system-site-packages
fi

# GNOME extension UUIDs to install
EXTENSIONS=(
    "tactile@lundal.io"
    "just-perfection-desktop@just-perfection"
    "blur-my-shell@aunetx"
    "space-bar@luchrioh"
    "undecorate@sun.wxg@gmail.com"
    "tophat@fflewddur.github.io"
    "switcher@landau.fi"
)

# Install extensions if not already installed
for ext in "${EXTENSIONS[@]}"; do
    if ! gext list | grep "$ext" &>/dev/null; then
        animate-progress "Installing extension: $ext"
        gext install "$ext"
    fi
done

# Load GNOME settings from dconf file
if [[ -f "$SCRIPT_DIR/gnome-settings.dconf" ]]; then
    echo "Applying GNOME extension settings..."
    dconf load /org/gnome/shell/extensions/ <"$SCRIPT_DIR/gnome-settings.dconf"
else
    echo "Warning: Settings file not found: $SCRIPT_DIR/gnome-settings.dconf"
fi
