#!/bin/bash

echo "Installing CodeCat4AI..."
echo ""
echo "RECOMMENDED: Install via Homebrew (https://brew.sh):"
echo "  brew tap unclecode/ccat4ai"
echo "  brew install ccat4ai"
echo ""
echo "Installing manually..."

# Make sure the script is executable
chmod +x ccat.sh

# Create ~/bin if it doesn't exist
mkdir -p "$HOME/bin"
INSTALL_DIR="$HOME/bin"

# Add to PATH if not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc" 2>/dev/null || true
    echo "Added $HOME/bin to PATH in .bashrc and .zshrc"
    echo "Please restart your shell or run 'source ~/.bashrc' (or ~/.zshrc) to update your PATH"
fi

# Create the symlink
ln -sf "$(pwd)/ccat.sh" "$INSTALL_DIR/ccat4ai"

echo "CodeCat4AI installed successfully to $INSTALL_DIR/ccat4ai!"
echo "You can now run 'ccat4ai [repository_url_or_path] [output_name]' from anywhere."
echo ""
echo "Want to create a shorter 'ccat' alias? Run:"
echo "  ln -sf $INSTALL_DIR/ccat4ai $INSTALL_DIR/ccat"