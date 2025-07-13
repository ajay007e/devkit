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
        echo "📦 Installing ${to_install[*]}"
        watch_execution "" sudo apt-get update
        watch_execution "📦 [${to_install[*]}] installed successfully" sudo apt-get install -y "${to_install[@]}"
    fi
}

animate_progress() {
    local message=$1
    local max_dots=${2:-3} # max number of dots (default 5)
    local delay=${3:-0.2}  # delay in seconds (default 0.5)

    echo -ne "\r$message"
    for ((i = 1; i <= max_dots; i++)); do
        echo -n "."
        sleep "$delay"
    done
    echo # Move to next line after done
}

START_MESSAGES=(
    "🚀 Starting task..."
    "🔧 Preparing to execute command..."
    "🧪 Running step..."
    "🎯 Executing action..."
    "📦 Installing package..."
    "🔄 Processing..."
)

SUCCESS_MESSAGES=(
    "✅ Task completed successfully!"
    "🥳 Done! Everything went smoothly."
    "🎉 Operation succeeded!"
    "📦 Package installed successfully."
    "🔓 Unlock achieved!"
    "💾 Saved successfully."
)

watch_execution() {
    local success_msg="$1"
    shift
    local cmd=("$@")

    local temp_log
    temp_log=$(mktemp)
    local error_log="devkit-installation-error.log"
    # Run command in background
    "${cmd[@]}" &>"$temp_log" &
    local pid=$!

    # Save cursor position
    tput sc

    while kill -0 $pid 2>/dev/null; do
        tput rc
        tput ed
        tail -n 5 "$temp_log"
        sleep 0.2
    done

    wait $pid
    local status=$?

    tput rc
    tput ed

    if [ $status -eq 0 ]; then
        if [[ -n "$success_msg" ]]; then
            echo "$success_msg"
        fi
    else
        echo "💥 Something exploded. 🧯 Logs tucked away safely in: $error_log"
        {
            echo "❌ Command failed: ${cmd[*]}"
            echo "🕒 Timestamp: $(date)"
            echo "------------------------------------------------------------"
            cat "$temp_log"
            echo -e "\n\n"
        } >>"$error_log"
    fi

    rm -f "$temp_log"
}
