#!/bin/bash

# Function to check if a package is installed (Debian/Ubuntu)
is_installed() {
    dpkg -l "$1" &>/dev/null
}

# Function to install packages if not already installed
install_packages() {
    local packages=("$@")
    local to_install=()

    for pkg in "${packages[@]}"; do
        if ! is_installed "$pkg"; then
            to_install+=("$pkg")
        fi
    done

    if [ ${#to_install[@]} -ne 0 ]; then
        echo "Installing ${to_install[*]}"
        sudo apt-get update -qq >/dev/null
        sudo apt-get install -y -qq "${to_install[@]}" >/dev/null
    fi
}

animate_progress() {
    local message=$1
    local max_dots=${2:-5} # max number of dots (default 5)
    local delay=${3:-0.2}  # delay in seconds (default 0.5)

    echo -ne "\r$message"
    for ((i = 1; i <= max_dots; i++)); do
        echo -n "."
        sleep "$delay"
    done
    echo # Move to next line after done
}
