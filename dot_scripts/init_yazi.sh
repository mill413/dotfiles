#!/bin/bash

# Display help message
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "Options:"
    echo "  -p, --path PATH    Specify the installation path of yazi."
    echo "  -h, --help         Show this help message and exit."
    echo
    echo "Script should be run under dotfiles/."
}

# Default yazi path
YAZI_PATH=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
    -p | --path)
        YAZI_PATH="$2"
        shift 2
        ;;
    -h | --help)
        show_help
        exit 0
        ;;
    *)
        echo "Unknown argument: $1" >&2
        show_help >&2
        exit 1
        ;;
    esac
done

# Function to check if yazi is installed using find
check_yazi_installed() {
    if [ -n "$YAZI_PATH" ]; then
        if [ -x "$YAZI_PATH/yazi" ]; then
            return 0 # yazi is installed at the specified path
        else
            return 1 # yazi not found at the specified path
        fi
    else
        if find / -type f -name "yazi" 2>/dev/null | grep -q "yazi"; then
            return 0 # yazi is installed
        else
            return 1 # yazi is not installed
        fi
    fi
}

# Check for yazi installation
if check_yazi_installed; then
    echo "yazi is installed. Proceeding with symlink creation..."
    # Create the symlink
    ln -sv "$PWD/dotfiles/yazi" "$HOME/.config/yazi"
else
    echo "Error: yazi is not installed. Please install yazi first." >&2
    exit 1
fi
