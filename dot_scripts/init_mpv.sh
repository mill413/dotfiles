#!/bin/bash

# Display help message
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "Options:"
    echo "  -p, --path PATH    Specify the installation path of mpv."
    echo "  -h, --help         Show this help message and exit."
    echo
    echo "Script should be run under dotfiles/."
}

# Default mpv path
MPV_PATH=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--path)
            MPV_PATH="$2"
            shift 2
            ;;
        -h|--help)
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

# Function to check if mpv is installed using find
check_mpv_installed() {
    if [ -n "$MPV_PATH" ]; then
        if [ -x "$MPV_PATH/mpv" ]; then
            return 0 # mpv is installed at the specified path
        else
            return 1 # mpv not found at the specified path
        fi
    else
        if find / -type f -name "mpv" 2>/dev/null | grep -q "mpv"; then
            return 0 # mpv is installed
        else
            return 1 # mpv is not installed
        fi
    fi
}

# Check for mpv installation
if check_mpv_installed; then
    echo "mpv is installed. Proceeding with symlink creation..."
    # Create the symlink
    ln -sv "$PWD/dotfiles/mpv" "$HOME/.config/mpv"
else
    echo "Error: mpv is not installed. Please install mpv first." >&2
    exit 1
fi
