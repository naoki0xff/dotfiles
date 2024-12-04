### zprofile

## general
# history & completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history
bindkey "^R" history-incremental-search-backward
# etc
stty stop undef

# VARIABLE
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
export EDITOR=nvim
bindkey -e
export MANPAGER="nvim +Man!"
export XDG_CONFIG_HOME=~/.config
export LANG=en_US.UTF-8
# PATH
PATH=$HOME/.local/bin:$HOME/usr/bin:$HOME/usr/local/bin:$PATH
# LANGUAGE
# -> php (phpenv must comes after rbenv with its PATH)
PATH="${HOME}/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
# -> go
export GOPATH=$HOME/usr/local/go
export GOBIN=$GOPATH/bin
PATH=$PATH:$GOBIN
# -> node.js
PATH=$HOME/.nodebrew/current/bin:$PATH
# -> python
export PYENV_ROOT=$HOME/.pyenv
[[ -d $PYENV_ROOT/bin ]] && PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# -> ruby (also ruby-build)
eval "$(~/.rbenv/bin/rbenv init - zsh)"
# TOOLS
# -> homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# -> terraform
PATH=$HOME/.tfenv/bin:$PATH
# -> istioctl
PATH=$HOME/.istioctl/bin:$PATH
# avoid duplication
typeset -U path PATH
# finalize
export PATH

# CLI tools
# git
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    
  zstyle ':vcs_info:git:*' unstagedstr "-"  
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{#5e81ac}%1v%f|)"
# R
disable r
# tmux
[[ -z $TMUX && ! -z "$PS1" ]] && tmux
set -o ignoreeof # stop tmux from exit with C-d
# fzf(require 0.48.0 or later)
eval "$(fzf --zsh)"
FZF_DEFAULT_OPTS='--reverse'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e5e9f0,bg:#000000,hl:#81a1c1
  --color=fg+:#e5e9f0,bg+:#3b4357,hl+:#81a1c1
  --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
  --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b' # Modified bg of Nord colorscheme = https://github.com/ianchesal/nord-fzf
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 80%'
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_COMPLETION_TRIGGER=',,'
# kubernetes
export KUBE_EDITOR=nvim
