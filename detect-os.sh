#!/bin/bash

# Get uname and os-release info
UNAME_OUT="$(uname -s)"
OS_RELEASE_FILE="/etc/os-release"

# macOS check
if [[ "$UNAME_OUT" == "Darwin" ]]; then
    echo "Unsupported System [macOS (Apple)]"
    exit 0
fi

# Windows via WSL check
if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "Unsupported System [Windows (WSL)]"
    exit 0
fi

# Linux distro check
if [[ -f "$OS_RELEASE_FILE" ]]; then
    . "$OS_RELEASE_FILE" # Source the file to get ID variable
    case "$ID" in
    ubuntu)
        ./ubuntu/ubuntu.sh
        ;;
    arch)
        echo "Unsupported System [Arch Linux]"
        ;;
    debian)
        echo "Unsupported System [Debian]"
        ;;
    fedora)
        echo "Unsupported System [Fedora]"
        ;;
    *)
        echo "Unsupported System [Linux, unknown distro: $ID]"
        ;;
    esac
    exit 0
fi

# Unknown system fallback
echo "System type could not be identified."
exit 1
