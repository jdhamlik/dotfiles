#!/usr/bin/env zsh

DOTFILES="$(pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

ln -si "$DOTFILES/nvim" "$CONFIG_HOME/nvim"
ln -si "$DOTFILES/.gitignore" "$HOME/.gitignore"

