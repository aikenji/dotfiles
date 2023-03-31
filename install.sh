#!/bin/zsh

# synchronize homebrew
brew bundle

# links to rc files
ln -sF $HOME/.config/git/.gitconfig $HOME/.gitconfig 
ln -sF $HOME/.config/conda/.condarc $HOME/.condarc
ln -sF $HOME/.config/zsh/.zshrc $HOME/.zshrc
ln -sF $HOME/.config/zsh/.p10k.zsh $HOME/.p10k.zsh
