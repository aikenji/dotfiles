#!/bin/bash

# any commands fails will cause script to exit
set -e

TERMINALS="kitty/ alacritty/"
WM="yabai/ skhd/"
BASICS="git/ zsh/ conda/"
TOOLS="tmux/ nvim/ lazygit/ joshuto/"

DOT_FOLDERS="$TERMINALS $WM $BASICS $TOOLS"

for folder in $DOT_FOLDERS
do
    echo "[+] $folder"
        stow -v -t $HOME $folder
done

echo "INSTALL SUCESSFULL"
