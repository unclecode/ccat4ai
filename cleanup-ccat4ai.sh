#!/bin/bash

# Cleanup script for ccat4ai testing
# This script completely removes ccat4ai from your system
# so you can test the installation process from scratch

echo "=== Starting ccat4ai cleanup ==="

# Uninstall the formula if it's installed
echo "Uninstalling ccat4ai formula..."
brew uninstall ccat4ai 2>/dev/null || echo "ccat4ai formula not installed"

# Untap the repository
echo "Removing tap..."
brew untap unclecode/ccat4ai 2>/dev/null || echo "unclecode/ccat4ai tap not found"

# Clean up potential symlinks
echo "Removing symlinks..."
rm -f ~/bin/ccat 2>/dev/null || true
rm -f /usr/local/bin/ccat 2>/dev/null || true
rm -f /opt/homebrew/bin/ccat 2>/dev/null || true

# Remove lock files
echo "Removing lock files..."
sudo rm -f /opt/homebrew/var/homebrew/locks/ccat.formula.lock 2>/dev/null || true
sudo rm -f /opt/homebrew/var/homebrew/locks/ccat4ai.formula.lock 2>/dev/null || true

# Clean up cache files
echo "Cleaning Homebrew cache..."
rm -f ~/Library/Caches/Homebrew/ccat4ai--* 2>/dev/null || true
rm -f ~/Library/Caches/Homebrew/downloads/*ccat4ai* 2>/dev/null || true

# Clean up Homebrew cache
echo "Running brew cleanup..."
brew cleanup ccat4ai 2>/dev/null || true

# Verify cleanup
echo "Verifying cleanup..."
which ccat4ai 2>/dev/null && echo "WARNING: ccat4ai still found in PATH" || echo "ccat4ai not found in PATH - Good!"
which ccat 2>/dev/null && echo "WARNING: ccat still found in PATH" || echo "ccat not found in PATH - Good!"
brew list | grep ccat4ai && echo "WARNING: ccat4ai still installed" || echo "ccat4ai not found in brew list - Good!"

echo "=== Cleanup complete ==="
echo "You can now run the following to test installation:"
echo "brew tap unclecode/ccat4ai"
echo "brew install ccat4ai"