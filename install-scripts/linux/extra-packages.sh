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

echo "=== Installing JetBrains Mono Nerd Font ==="
if brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then
    echo "JetBrains Mono Nerd Font already installed"
else
    brew install --cask font-jetbrains-mono-nerd-font
    if brew list --cask font-jetbrains-mono-nerd-font >/dev/null 2>&1; then
        echo "JetBrains Mono Nerd Font installed successfully"
    else
        echo "JetBrains Mono Nerd Font FAILED TO INSTALL"
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

echo "=== Installing Go ==="
if command -v go >/dev/null 2>&1; then
    echo "Go already installed: $(command -v go)"
else
    brew install go
    if command -v go >/dev/null 2>&1; then
        echo "Go installed successfully"
    else
        echo "Go FAILED TO INSTALL"
    fi
fi

echo "=== Installing Rust ==="
if command -v rustc >/dev/null 2>&1; then
    echo "Rust already installed: $(command -v rustc)"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    if command -v rustc >/dev/null 2>&1; then
        echo "Rust installed successfully"
    else
        echo "Rust FAILED TO INSTALL"
    fi
fi

echo "=== Installing Python ==="
if brew list python >/dev/null 2>&1; then
    echo "Python (brew) already installed: $(command -v python3)"
else
    brew install python
    if brew list python >/dev/null 2>&1; then
        echo "Python installed successfully"
    else
        echo "Python FAILED TO INSTALL"
    fi
fi

echo "=== Installing LuaRocks ==="
if command -v luarocks >/dev/null 2>&1; then
    echo "LuaRocks already installed: $(command -v luarocks)"
else
    brew install luarocks
    if command -v luarocks >/dev/null 2>&1; then
        echo "LuaRocks installed successfully"
    else
        echo "LuaRocks FAILED TO INSTALL"
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
