#!/bin/zsh

# any commands fails will cause script to exit
set -e

# install basic tools using homebrew
# ===========================================
#
# fonts
# brew install font-jetbrains-mono-nerd-font
# basic tools of zsh
# brew install eza bat btop fd fzf zoxide tealdeer fastfetch
# brew install git tmux nvim neovide lazygit yazi
# WM
# brew install kitty aerospace
# brew tap FelixKratz/formulae
# brew install --ignore-dependencies borders
# miniconda (upgrade miniconda will lost all your virtual envs in current version)
# brew install miniconda

TERMINALS="kitty/ ghostty/"
WM="aerospace/ sketchybar/"
BASICS="git/ zsh/ conda/"
TOOLS="tmux/ nvim/ neovide/ lazygit/ yazi/ fastfetch/"

DOT_FOLDERS="$TERMINALS $WM $BASICS $TOOLS"

for folder in $DOT_FOLDERS; do
    echo "[+] $folder"
    stow -v -t $HOME $folder
done

# yazi preamble
set +e # when return 1 not exit
ya pack -a yazi-rs/flavors:catppuccin-macchiato
ya pack -a yazi-rs/plugins:full-border
set -e

echo "INSTALL SUCESSFULL"
