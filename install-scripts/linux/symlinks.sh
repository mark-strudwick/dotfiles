#!/bin/zsh

# Repository must be cloned to ~/dotfiles/
dotfiles_dir=~/dotfiles

# Delete existing dotfiles managed files and directories
sudo rm -rf ~/.zsh_profile > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

# Create symlinks in the home folder
ln -sf $dotfiles_dir/zsh/zsh_profile ~/.zsh_profile
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/config ~/.config

chsh -s $(which zsh)

echo "Symlinks have been created"
