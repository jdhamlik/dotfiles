#!/usr/bin/env zsh

DOTFILES="$(pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

ln -si "$DOTFILES/nvim" "$CONFIG_HOME/nvim"

ln -si "$DOTFILES/zshenv" "$HOME/.zshenv"
ln -si "$DOTFILES/zshrc" "$HOME/.zshrc"

CODE="$HOME/Code"

mkdir -p -m 700 "$CODE"
mkdir -p "$CODE/scripts"

