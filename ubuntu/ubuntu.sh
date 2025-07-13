#!/bin/bash

# Get directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the ubuntu-util.sh file
source "$SCRIPT_DIR/ubuntu-util.sh"

# Source the package list
if [ ! -f "./packages.conf" ]; then
    echo "Error: packages.conf not found!"
    exit 1
fi

source ./packages.conf

animate_progress "🎯 Starting System Setup"

animate_progress "🔧 Updating System"
cmd='sudo apt-get update && sudo apt-get upgrade -y'
watch_execution "✅ System updated successfully!" bash -c "$cmd"

# Install only missing packages
animate_progress "👨‍💻 Setting up Programming Languages "
. "$SCRIPT_DIR/ubuntu-programming-language-install.sh"

animate_progress "🧩 Installing System Utilities"
install_packages "${SYSTEM_UTILS[@]}"

animate_progress "🛠️ Installing Development Tools"
install_packages "${DEV_TOOLS[@]}"

# animate_progress "Installing System Maintenance Tools"
# install_packages "${MAINTENANCE[@]}"
#
# animate_progress "Installing Desktop Environment"
# install_packages "${DESKTOP[@]}"
#
# animate_progress "Installing Media"
# install_packages "${MEDIA[@]}"
#
# animate_progress "Installing Fonts"
# install_packages "$FONTS[@]"

animate_progress "⚙️ Configuring Services"
for service in "${SERVICES[@]}"; do
    if systemctl list-unit-files | grep -q "^${service}.service"; then
        if ! systemctl is-enabled "$service" &>/dev/null; then
            animate_progress "🧪 Enabling $service"
            watch_execution "" sudo systemctl enable "$service"
        fi
    else
        echo "⚠️ Warning: $service is not installed or does not have a service file."
    fi
done

# animate_progress "Installing Gnome Extensions"
# . ../gnome/gnome-extensions.sh
#
# animate_progress "Setting Gnome Hotkeys"
# . ../gnome/gnome-hotkeys.sh
#
# animate_progress "Configuring Gnome"
# . ../gnome/gnome-settings.sh
#
# animate_progress "Installing flatpaks"
# . ubuntu-flatpaks.sh

echo "🤖 All systems go! 🚀 Give your machine a fresh start with a reboot 🔁"
