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
setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# beeps are annoying
setopt NO_BEEP

# no overwriting files
#setopt NO_CLOBBER

# sort files numerically if possible
setopt NUMERIC_GLOB_SORT

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
function precmd {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ $branch ]; then
    branch=$branch" "
  fi
  PROMPT=" %{$fg[cyan]%}λ%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%} %{$fg[cyan]%}$branch%{$reset_color%}"
}
precmd

# ==============================================================================
# Source plugins
# ==============================================================================
source ~/.zsh/zsh-colored-man/zsh-colored-man.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-dircycle/zsh-dircycle.zsh
source ~/.zsh/zsh-sudo/zsh-sudo.zsh

# ==============================================================================
# History substring search plugin
# ==============================================================================
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=bg=none

export EDITOR="vim"


alias rmf='rm -rf'
alias la='ls -AlhFG'
alias ls='ls -hG'
alias pp='python3'
alias pnb='ipython3 notebook'

. /Users/adampaszke/torch/install/bin/torch-activate
alias qth='qlua -e "require('"'"'trepl'"'"')()"'


# Added by termtile (https://github.com/apaszke/termtile)
alias ul='osascript ~/.termtile/tile.scpt up left'
alias ur='osascript ~/.termtile/tile.scpt up right'
alias dl='osascript ~/.termtile/tile.scpt down left'
alias dr='osascript ~/.termtile/tile.scpt down right'
alias ll='osascript ~/.termtile/tile.scpt left'
alias rr='osascript ~/.termtile/tile.scpt right'
alias up='osascript ~/.termtile/tile.scpt up'
alias down='osascript ~/.termtile/tile.scpt down'
alias big='osascript ~/.termtile/resize.scpt '
alias cen='osascript ~/.termtile/center.scpt '
alias max='osascript ~/.termtile/maximize.scpt '
alias sn='osascript ~/.termtile/changeScreen.scpt next'
alias fs='osascript ~/.termtile/fullscreen.scpt '

