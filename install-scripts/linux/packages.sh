echo "=== Installing Zsh ==="
if command -v zsh >/dev/null 2>&1; then
    echo "zsh already installed: $(command -v zsh)"
else
    sudo apt-get -y install zsh
    if command -v zsh >/dev/null 2>&1; then
        echo "zsh installed successfully"
    else
        echo "zsh FAILED TO INSTALL"
    fi
fi

# Change default shell only if needed
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Changing default shell to zsh"
    chsh -s "$(command -v zsh)"
else
    echo "Default shell already set to zsh"
fi

echo "=== Installing Oh My Zsh ==="
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh already installed"
else
    echo "Installing Oh My Zsh..."
    RUNZSH=no  # Prevent auto-launch
    CHSH=no    # Prevent it from changing shell again
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "=== Installing Build Tools ==="
sudo apt-get -y install build-essential procps curl file git

echo "=== Installing Homebrew ==="
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed: $(command -v brew)"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "=== Done ==="
