echo "=== Installing Neovim ==="
if command -v nvim >/dev/null 2>&1; then
    echo "Neovim already installed: $(command -v nvim)"
else
    brew install neovim
    if command -v nvim >/dev/null 2>&1; then
        echo "Neovim installed successfully"
    else
        echo "Neovim FAILED TO INSTALL"
    fi
fi
