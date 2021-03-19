autoload -U compinit promptinit colors
compinit
promptinit
colors

# ==============================================================================
# Main settings
# ==============================================================================

#setopt MENU_COMPLETE
setopt LIST_AMBIGUOUS

# This makes cd=pushd
setopt AUTO_PUSHD

# revert pushd signs
setopt PUSHD_MINUS

# No more annoying pushd messages...
setopt PUSHD_SILENT

# this will ignore multiple directories for the stack
setopt PUSHD_IGNORE_DUPS

# use magic (this is default, but it can't hurt!)
setopt ZLE

# EOF doesn't quit the shell
#setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# beeps are annoying
setopt NO_BEEP

# no overwriting files
#setopt NO_CLOBBER

# sort files numerically if possible
setopt NUMERIC_GLOB_SORT

# vim mode!!
bindkey -v
export KEYTIMEOUT=1

# fix alt+left and alt+right
bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey '^[[Z' reverse-menu-complete

# ==============================================================================
# History
# ==============================================================================

# History file
HISTFILE=~/.zshhistory
SAVEHIST=10000
HISTSIZE=10000

setopt APPEND_HISTORY

# Share history between multiple shells
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# ==============================================================================
# Autocompletion
# ==============================================================================

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# highlight selected
zstyle ':completion:*' menu select

zstyle ':completion:*' group-name ''

# ==============================================================================
# Prompt
# ==============================================================================
COLOUR="%{$fg[cyan]%}"

function precmd {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ $branch ]; then
    branch=$branch" "
  fi
  PROMPT=" ${COLOUR}λ%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%} %{$fg[cyan]%}$branch%{$reset_color%}"
}
precmd

function zle-line-init zle-keymap-select {
  case ${KEYMAP} in
    (vicmd)      COLOUR="%{$fg[white]%}" ;;
    (*)          COLOUR="%{$fg[cyan]%}" ;;
  esac
  precmd
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# ==============================================================================
# Source plugins
# ==============================================================================
source ~/.zsh/zsh-colored-man/zsh-colored-man.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# ==============================================================================
# History substring search plugin
# ==============================================================================
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=bg=none

export EDITOR='vim'


alias rmf='rm -rf'
alias la='ls -AlhFG'
alias ls='ls -hG'
alias pp='python3'
