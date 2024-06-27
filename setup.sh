#!/usr/bin/env zsh

if !command -v 'brew' > /dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	brew update
	brew install "$(<homebrew_packages.txt)"
fi

DOTFILES="$(pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

ln -si "$DOTFILES/mise" "$CONFIG_HOME"
ln -si "$DOTFILES/nvim" "$CONFIG_HOME"

ln -si "$DOTFILES/zshenv" "$HOME/.zshenv"
ln -si "$DOTFILES/zshrc" "$HOME/.zshrc"

CODE="$HOME/Code"

mkdir -p -m 700 "$CODE"

ln -si "$DOTFILES/scripts" "$CODE"

