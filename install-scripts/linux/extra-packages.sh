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

echo "=== Installing Claude Code ==="
if command -v claude >/dev/null 2>&1; then
    echo "Claude Code already installed: $(command -v claude)"
else
    brew install --cask claude-code
    if command -v claude >/dev/null 2>&1; then
        echo "Claude Code installed successfully"
    else
        echo "Claude Code FAILED TO INSTALL"
    fi
fi

