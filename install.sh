#!/bin/bash

echo "Installing CodeCat4AI..."

# Make sure the script is executable
chmod +x ccat.sh

# Try to install to /usr/local/bin if possible, otherwise to ~/.local/bin
if [ -d "/usr/local/bin" ] && [ -w "/usr/local/bin" ]; then
    INSTALL_DIR="/usr/local/bin"
elif [ -d "$HOME/.local/bin" ]; then
    INSTALL_DIR="$HOME/.local/bin"
else
    # Create ~/.local/bin if it doesn't exist
    mkdir -p "$HOME/.local/bin"
    INSTALL_DIR="$HOME/.local/bin"
    
    # Add to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc" 2>/dev/null || true
        echo "Added $HOME/.local/bin to PATH in .bashrc and .zshrc"
        echo "Please restart your shell or run 'source ~/.bashrc' to update your PATH"
    fi
fi

# Copy the script to the install directory
cp ccat.sh "$INSTALL_DIR/ccat"

echo "CodeCat4AI installed successfully to $INSTALL_DIR/ccat!"
echo "You can now run 'ccat [repository_url_or_path] [output_name]' from anywhere."