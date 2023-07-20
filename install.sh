#!/bin/sh

# synchronize homebrew
# brew bundle

# rm the old rc files
rm -f $HOME/.config/kitty # make sure just link file not dirs
rm -f $HOME/.config/alacritty
rm -f $HOME/.config/tmux
rm -f $HOME/.config/nvim
rm -f $HOME/.config/ranger
rm -f $HOME/.config/lazygit
rm -f $HOME/.zshrc 
rm -f $HOME/.p10k.zsh 
rm -f $HOME/.gitconfig 
rm -f $HOME/.condarc 

# use stow to manager all config files
stow kitty/ alacritty/ tmux/ nvim/ ranger/ lazygit/
stow git/ zsh/ conda/
