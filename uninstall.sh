#!/bin/bash

echo "Uninstalling CodeCat4AI..."
echo ""
echo "RECOMMENDED: If installed via Homebrew, uninstall with:"
echo "  brew uninstall ccat4ai"
echo "  brew untap unclecode/ccat4ai"
echo ""
echo "Uninstalling manual installation..."

# Check common installation locations
UNINSTALLED=false

# Check ~/bin (preferred location in new install script)
if [ -f "$HOME/bin/ccat4ai" ]; then
    rm -f "$HOME/bin/ccat4ai"
    echo "Removed ccat4ai from $HOME/bin"
    UNINSTALLED=true
fi

if [ -f "$HOME/bin/ccat" ]; then
    rm -f "$HOME/bin/ccat"
    echo "Removed ccat from $HOME/bin"
    UNINSTALLED=true
fi

# Check traditional locations (old install script)
if [ -f "/usr/local/bin/ccat" ]; then
    sudo rm -f "/usr/local/bin/ccat"
    echo "Removed ccat from /usr/local/bin"
    UNINSTALLED=true
fi

if [ -f "$HOME/.local/bin/ccat" ]; then
    rm -f "$HOME/.local/bin/ccat"
    echo "Removed ccat from $HOME/.local/bin"
    UNINSTALLED=true
fi

if [ "$UNINSTALLED" = false ]; then
    echo "Could not find any ccat4ai installation."
    echo "If you installed it to a custom location, please remove it manually."
    echo "For a complete cleanup, run:"
    echo "  ./cleanup-ccat4ai.sh"
    exit 1
fi

echo "CodeCat4AI has been uninstalled successfully!"
echo ""
echo "For a complete cleanup (including Homebrew), run:"
echo "  ./cleanup-ccat4ai.sh"