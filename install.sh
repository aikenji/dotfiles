#!/bin/bash

# any commands fails will cause script to exit
set -e

# install basic tools using homebrew
# ===========================================
#
# fonts
brew install font-jetbrains-mono-nerd-font
# basic tools of zsh
brew install eza bat btop fd fzf zoxide tealdeer fastfetch
brew install git tmux nvim neovide lazygit yazi
# WM
brew install kitty aerospace 
brew tap FelixKratz/formulae
brew install --ignore-dependencies borders
# miniconda (upgrade miniconda will lost all your virtual envs in current version)
# brew install miniconda
# yazi preamble
ya pack -a yazi-rs/flavors:catppuccin-macchiato
ya pack -a yazi-rs/plugins:full-border

TERMINALS="kitty/"
WM="aerospace/"
BASICS="git/ zsh/ conda/"
TOOLS="tmux/ nvim/ neovide/ lazygit/ yazi/"

DOT_FOLDERS="$TERMINALS $WM $BASICS $TOOLS"

for folder in $DOT_FOLDERS
do
    echo "[+] $folder"
        stow -v -t $HOME $folder
done

echo "INSTALL SUCESSFULL"
