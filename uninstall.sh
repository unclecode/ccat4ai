#!/bin/bash

echo "Uninstalling CodeCat4AI..."

# Check common installation locations
if [ -f "/usr/local/bin/ccat" ]; then
    sudo rm -f "/usr/local/bin/ccat"
    echo "Removed ccat from /usr/local/bin"
elif [ -f "$HOME/.local/bin/ccat" ]; then
    rm -f "$HOME/.local/bin/ccat"
    echo "Removed ccat from $HOME/.local/bin"
else
    echo "Could not find ccat installation. If you installed it to a custom location, please remove it manually."
    exit 1
fi

echo "CodeCat4AI has been uninstalled successfully!"