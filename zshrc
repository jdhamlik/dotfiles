FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	colored-man-pages
	common-aliases
	fzf
	git
	mise
	zoxide

	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'

HISTSIZE=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

set -o vi 

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias e="$EDITOR"

alias cat="bat"

