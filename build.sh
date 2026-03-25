#!/bin/bash

set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"
REPO_URL="https://github.com/soyr-redhat/nvim-config.git"

echo "========================================="
echo "Neovim Configuration Installer"
echo "========================================="
echo ""

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "ERROR: Neovim is not installed."
    echo "Please install Neovim 0.11.6 or higher first."
    exit 1
fi

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n 1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
echo "Found Neovim version: $NVIM_VERSION"

# Backup existing config if it exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Existing config found. Backing up to: $BACKUP_DIR"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
fi

# Clone the repository
echo "Cloning configuration repository..."
git clone "$REPO_URL" "$NVIM_CONFIG_DIR"
cd "$NVIM_CONFIG_DIR"

echo ""
echo "Configuration cloned successfully!"
echo ""

# Install plugins
echo "Installing plugins..."
nvim --headless "+Lazy! sync" +qa

echo ""
echo "========================================="
echo "Installation Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Start Neovim: nvim"
echo "2. Run :Mason to verify LSP servers are installed"
echo "3. Run :checkhealth to verify everything is working"
echo ""
echo "Key bindings:"
echo "  <Space>ff - Fuzzy find files"
echo "  <Space>fg - Live grep"
echo "  <Space>h  - Harpoon menu"
echo ""
echo "See README.md for full documentation."
