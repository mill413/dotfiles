#!/bin/bash

# Display help message
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "Options:"
    echo "  -p, --path PATH    Specify the installation path of Neovim."
    echo "  -h, --help         Show this help message and exit."
    echo
    echo "Script should be run under dotfiles/."
}

# Default Neovim path
NEOVIM_PATH=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--path)
            NEOVIM_PATH="$2"
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

# Function to check if Neovim is installed using find
check_neovim_installed() {
    if [ -n "$NEOVIM_PATH" ]; then
        if [ -x "$NEOVIM_PATH/nvim" ]; then
            return 0 # Neovim is installed at the specified path
        else
            return 1 # Neovim not found at the specified path
        fi
    else
        if find / -type f -name "nvim" 2>/dev/null | grep -q "nvim"; then
            return 0 # Neovim is installed
        else
            return 1 # Neovim is not installed
        fi
    fi
}

# Check for Neovim installation
if check_neovim_installed; then
    echo "Neovim is installed. Proceeding with symlink creation..."
    # Create the symlink
    ln -sv "$PWD/dotfiles/neovim" "$HOME/.config/nvim"
else
    echo "Error: Neovim is not installed. Please install Neovim first." >&2
    exit 1
fi
