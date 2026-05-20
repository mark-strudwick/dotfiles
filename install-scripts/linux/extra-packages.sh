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

echo "=== Installing ripgrep ==="
if command -v rg >/dev/null 2>&1; then
    echo "ripgrep already installed: $(command -v rg)"
else
    brew install ripgrep
    if command -v rg >/dev/null 2>&1; then
        echo "ripgrep installed successfully"
    else
        echo "ripgrep FAILED TO INSTALL"
    fi
fi

echo "=== Installing Node ==="
if command -v node >/dev/null 2>&1; then
    echo "Node already installed: $(command -v node)"
else
    brew install node
    if command -v node >/dev/null 2>&1; then
        echo "Node installed successfully"
    else
        echo "Node FAILED TO INSTALL"
    fi
fi

echo "=== Installing lazygit ==="
if command -v lazygit >/dev/null 2>&1; then
    echo "lazygit already installed: $(command -v lazygit)"
else
    brew install lazygit
    if command -v lazygit >/dev/null 2>&1; then
        echo "lazygit installed successfully"
    else
        echo "lazygit FAILED TO INSTALL"
    fi
fi
