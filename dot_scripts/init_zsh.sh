#!/bin/bash

# Display help message
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "Options:"
    echo "  -p, --path _PATH    Specify the installation path of oh-my-zsh."
    echo "  -h, --help         Show this help message and exit."
    echo
    echo "If no path is provided, the script will search for oh-my-zsh in predefined locations."
    echo "Script should be run under dotfiles/ ."
}

# Check arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--path)
            CUSTOM_PATH="$2"
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

# Define the list of search paths
SEARCH_PATHS=(
    "$CUSTOM_PATH"
    "$HOME/.oh-my-zsh"
    "/usr/local/share/oh-my-zsh"
    "/usr/share/oh-my-zsh"
    "/opt/oh-my-zsh"
    "/"
)

# Iterate through the search paths to find oh-my-zsh installation
INSTALL_PATH=""
for _PATH in "${SEARCH_PATHS[@]}"; do
    if [ -n "$_PATH" ] && [ -d "$_PATH" ]; then
        INSTALL_PATH="$_PATH"
        break
    fi
    if [ -z "$_PATH" ]; then
        INSTALL_PATH=$(find "$_PATH" -type d -name "oh-my-zsh" 2>/dev/null | head -n 1)
        [ -n "$INSTALL_PATH" ] && break
    fi
done

# Check if the installation path was found
if [ -z "$INSTALL_PATH" ]; then
    echo "Error: Unable to find the oh-my-zsh installation path. Please ensure oh-my-zsh is installed." >&2
    exit 1
fi

# Define the zshrc file path
ZSHRC_FILE="./zsh/zshrc"

# Check if the zshrc file exists
if [ ! -f "$ZSHRC_FILE" ]; then
    echo "Error: zshrc file not found." >&2
    exit 1
fi

# Update the ZSH= line in the zshrc file using /usr/bin/sed
sed -i.bak -E "s|^ZSH=.*$|ZSH=\"$INSTALL_PATH\"|" "$ZSHRC_FILE"

# Notify the user of the successful update
echo "zshrc file has been updated. ZSH variable is set to: $INSTALL_PATH"

rm "$HOME/.zshrc"
ln -sv "$PWD/zsh/zshrc" "$HOME/.zshrc"